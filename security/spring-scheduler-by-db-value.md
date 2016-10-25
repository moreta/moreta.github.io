

# Triggerを利用してnext execution timeを指定

<http://docs.spring.io/spring/docs/3.0.x/reference/scheduling.html#scheduling-trigger-interface>


```java
@Configuration
@EnableScheduling
public class MyAppConfig implements SchedulingConfigurer {

    @Autowired
    Environment env;

    @Bean
    public MyBean myBean() {
        return new MyBean();
    }

    @Bean(destroyMethod = "shutdown")
    public Executor taskExecutor() {
        return Executors.newScheduledThreadPool(100);
    }

    @Override
    public void configureTasks(ScheduledTaskRegistrar taskRegistrar) {
        taskRegistrar.setScheduler(taskExecutor());
        taskRegistrar.addTriggerTask(
                new Runnable() {
                    @Override public void run() {
                        myBean().getSchedule();
                    }
                },
                new Trigger() {
                    @Override public Date nextExecutionTime(TriggerContext triggerContext) {
                        Calendar nextExecutionTime =  new GregorianCalendar();
                        Date lastActualExecutionTime = triggerContext.lastActualExecutionTime();
                        nextExecutionTime.setTime(lastActualExecutionTime != null ? lastActualExecutionTime : new Date());
                        nextExecutionTime.add(Calendar.MILLISECOND, env.getProperty("myRate", Integer.class)); //you can get the value from wherever you want
                        return nextExecutionTime.getTime();
                    }
                }
        );
    }
}
```

# References

+ [Configuring Spring Scheduler At run time based on db values](http://stackoverflow.com/questions/32034858/configuring-spring-scheduler-at-run-time-based-on-db-values)
+ [Scheduling a job with Spring programmatically (with fixedRate set dynamically)](http://stackoverflow.com/questions/14630539/scheduling-a-job-with-spring-programmatically-with-fixedrate-set-dynamically/14632758#14632758)

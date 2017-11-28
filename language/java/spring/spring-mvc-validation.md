
# `@Valid` `@Validated`

<http://d.hatena.ne.jp/tatsu-no-toshigo/20131006/1381031027>


# Conditional validation

+ validation groupを利用する

# ValidationMessage.properties

## salple


```
javax.validation.constraints.NotNull.message=入力してください 
org.hibernate.validator.constraints.Length.message=入力は{max}文字までです。
```


## ValidationMessage.propertiesを messages.propertiesにしたい場合

+ defaultのmessage property fileは`ValidationMessage.properties`
+ これを変えたい場合には (私的にはおすすめてでない)
  + LocalValidatorFactoryBeanを作成する
  + messageSourceを任意のものにする
    + WebMvcAutoConfigurationAdapterのaddValidatorで上のLocalValidatorFactoryBeanを返す

```java
@SpringBootApplication
public class App extends WebMvcAutoConfigurationAdapter {
    
    @Autowired
    MessageSource messageSource;
    
    public static void main(String[] args) {
        SpringApplication.run(App.class, args);
    }

    @Bean
    public LocalValidatorFactoryBean validator() {
        LocalValidatorFactoryBean f = new LocalValidatorFactoryBean();
        f.setValidationMessageSource(this.messageSource);
        return f;
    }
    
    @Override
    public Validator getValidator() {
        return validator();
    }
}
```




# References

+ [Spring WebMVCをやってみる (13) - @ValidとBindingResult -](http://kinjouj.github.io/2013/12/spring-webmvc-13-valid-annotation-and-bindingresult.html)
+ [Spring docs - 9. Validation, Data Binding, and Type Conversion](https://docs.spring.io/spring/docs/current/spring-framework-reference/html/validation.html)
  + Validatorと DataBindを利用する方法
+ [Spring REST api validate](https://www.mkyong.com/spring-mvc/spring-rest-api-validation/)
  + @Valid @RequestBody 
+ [Validating Form Input](https://spring.io/guides/gs/validating-form-input/)
+ [Hibernate validation contrain](https://docs.jboss.org/hibernate/stable/validator/reference/en-US/html_single/#_validating_constraints)
+ [Spring MVC Exception Handling](http://memorynotfound.com/spring-mvc-exception-handling/)
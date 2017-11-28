
```sh
# catalina.shの以下の部分を修正する場合
JAVA_OPTS="-server -Xms600m -Xmx2048m"

# JDK8の環境設定
export CATALINA_OPTS='-Xmx512m -Xms256m'

# JDK6,7の管理設定
export CATALINA_OPTS='-XX:MaxPermSize=128m -Xmx512m -Xms256m'
```

# References

+ [A Heap of Trouble](https://www.elastic.co/blog/a-heap-of-trouble)
+ <http://docs.oracle.com/javase/7/docs/technotes/guides/vm/performance-enhancements-7.html#compressedOop>
+ [Tomcatのメモリ割り当て](http://groupsession.jp/v4/support/tomcat_setting.html)

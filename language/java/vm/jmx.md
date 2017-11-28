JMX- Java Management Extensions
================================

# MBean (Managed Bean)

+ JavaBeansの一種であり、
+ 依存性の注入により作られている。
+ MBeanはJava Virtual Machine上で走るリソース（アプリケーションやJava EE技術サービス（トランザクション・モニタやJDBCドライバなど））との連絡窓口の役割を果たす
+ MBeanは、関心のある統計数値（パフォーマンス、リソース使用量、問題など）を収集すること（プル）、アプリケーションの設定値を取得または設定すること（プッシュ/プル）、および障害や状態変化などのイベントを通知すること（プッシュ）に使える

# できること

稼働中のJVMのメソッドが呼べる(MBean経由で外部に公開されているものであればなんでも出来る)

+ 稼働中にログレベルを変更したり
+ やばそうだからGC呼んでみたり
+ 設定変更や動作に直結する変更でも、いちいち再起動する必要がない
+ 稼働中のJVMの内部状態が見える

# JMXをリモートで接続し、管理するためには

リモートから MBeanServer に接続するために
+ Connector
  + Connector は JMX に特有のプロトコルを使用して MBeanServer と監視システムの通信を行うもの
+ Protocol Adapter
  + Protocol Adapter は JMX のプロトコルを他のプロトコルに変換して通信を行うもの
  + tomcatの管理にも使っている
+ SNMP
  + 他のプロトコルとして HTML やネットワーク機器を管理するために使用される
がある

![from 虎の穴 図2 JMX の構成](https://dl.dropboxusercontent.com/u/21522805/blog/java/jmx/jmx_structure.png)


## ほか jconsole

+ [Jconsoleで確認](http://docs.oracle.com/javase/jp/6/technotes/guides/management/jconsole.html)
+ [jmxtools.ja](http://www.oracle.com/technetwork/java/javase/tech/javamanagement-140525.html)

# MBean を作る

+ StandardMBean
+ DynamicMBean
  + OpenMBean
  + ModelMBean

# MBeanインターフェイスとその実装

```
public interface HogeFTPServerMBean {
 public String getUptime();

 public int getReadBytes();

 public int getWrittenBytes();

 public void setEchoMessage(String msg);
}
```

で、これをimplementsしたサーバを書いて、それが起動する際に

```
MBeanServer server = ManagementFactory.getPlatformMBeanServer();
server.registerMBean(this, new ObjectName("yourDomain:type=hogeFTPServer"));
```

などと書いておけばあら不思議、先ほどのインターフェイスを実行中に呼び出すことができます。

# References

+ [Java Management Extensions](https://ja.wikipedia.org/wiki/Java_Management_Extensions)
+ [JMX について
](http://otndnld.oracle.co.jp/document/products/wls/docs103/jmxinst/understanding.html)
+ [JMXコマンドラインツール](http://qiita.com/uzresk/items/9142c24f218003a4b2a6)
+ [JMX documentation](http://www.oracle.com/technetwork/java/javase/tech/docs-jsp-135989.html)

## JMX分析ツール

+ [jolokia](https://jolokia.org/)
+ [jq コマンドを使う日常のご紹介](http://qiita.com/takeshinoda@github/items/2dec7a72930ec1f658af)
  + [jq - command line json parser](https://stedolan.github.io/jq/)
+ [AWS cloudwatch](https://aws.amazon.com/jp/cloudwatch/)
+ [Command-line JMX Client](http://crawler.archive.org/cmdline-jmxclient/)

## book

+ [Hibernate - Statistics via JMX](https://www.safaribooksonline.com/library/view/mastering-hibernate/9781782175339/ch07s02.html)
+ [Kafka - Using the JMX tool](https://www.safaribooksonline.com/library/view/apache-kafka-cookbook/9781785882449/ch04s07.html)
+ [Spring Boot -  Monitoring Spring Boot via JMX](https://www.safaribooksonline.com/library/view/spring-boot-cookbook/9781785284151/ch07s04.html)
+ [Spring Boot - Restricting access only to JMX](https://www.safaribooksonline.com/library/view/learning-spring-boot/9781784393021/ch03s08.html)
+ [Spring - Chapter 20. Managing Spring beans with JMX](https://www.safaribooksonline.com/library/view/spring-in-action/9781617291203/kindle_split_031.html)
+ [Java™ and JMX: Building Manageable Systems](https://www.safaribooksonline.com/library/view/javatm-and-jmx/0672324083/)

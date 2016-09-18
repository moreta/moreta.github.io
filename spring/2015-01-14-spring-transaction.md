---
title : Spring Framework - Transaction
data: 2015-01-14
tags: spring-framework, java, transaction
---

# 宣言的トランザクション管理

+ あるメソッドを呼び出したときにトランザクションをかけるとき
+ 非検査例外(RuntimeException及びそのサブクラス)が発生した場合はロールバックされるが、
+ 検査例外(Exception及びそのサブクラスでRuntimeExceptionのサブクラスじゃないもの)が発生した場合はロールバックされずコミットされ

```java
@Transactional
public void updateXXX(XXX xxx) {
  // do something
}
```

# Transaction Manager

* <http://www.techscore.com/tech/Java/Others/Spring/6/>

JTA, JDO, JDBC, Hibernate, iBatis 等ではトランザクションを扱う方法は異なります
ここで、springは統一的に扱う方法が用意されており、大きく２つに区分できる。

* 宣言的トランザクション管理
* プログラミングなトランザクション管理

一部例外をのぞく宣言的な管理を推奨されている。

宣言的トランザクション管理を行うには、`org.springframework.transaction.interceptor.TransactionProxyFactoryBean` クラスを使用します。Bean 定義ファイルでこのクラスのプロパティを設定するだけでコンテナがトランザクション管理を行ってくれます。設定すべきプロパティは以下の 3つです



| プロパティ名          | 型                                                         | 設定内容                                                                                                |
|:----------------------|:-----------------------------------------------------------|:--------------------------------------------------------------------------------------------------------|
| target                | java.lang.Object                                           | トランザクション管理を行いたいメソッドを持つクラス                                                      |
| transactionManager    | org.springframework.transaction.PlatformTransactionManager | 使用する PlatformTransactionManager インタフェースを実装する具象クラス                                  |
| transactionAttributes | java.util.Properties                                       | メソッド名をキーとし、トランザクションの振る舞い、分離レベル等トランザクション属性を値に持つ Properties |


このうちもっとも重要なのは `transactionAttributes` です。Properties のキー値となるメソッド名にはワイルドカード `*` を使用することができます。キーに対応する値には`org.springframework.transaction.TransactionDefinition`で定義されている項目の他、特定の例外が発生したときのロールバックルールを指定可能です。

| 設定項目                               | 説明                                                                                               |
|:---------------------------------------|:---------------------------------------------------------------------------------------------------|
| トランザクションの振る舞い             | TransactionDefinition で定義されている定数フィールドを使用して指定                                 |
| トランザクションの分離レベル           | TransactionDefinition で定義されている定数フィールドを使用して指定                                 |
| 読み取り専用かどうか                   | 読み取り専用にする場合は readOnly を指定                                                           |
| タイムアウト時間                       | 単位は"秒"                                                                                         |
| 発生したときの振る舞いを指定したい例外 | 発生したときの振る舞いを指定したい例外の完全限定名を、規定のプリフィクス ("+" or "-") をつけて指定 |


このうち必ず指定しなければならないのはトランザクションの振る舞いです。もし null 値や空文字を指定した場合は当該メソッドがトランザクション内で処理されません。指定順序は任意で、複数指定する場合は "," (カンマ) で区切って指定します。

Spring では宣言的トランザクション管理を行っているとき、非検査例外 (java.lang.RuntimeException およびそのサブクラス) が発生するとデフォルトで自動的にロールバックされます。逆に言えばそれ以外の例外 (検査例外) が発生してもコミットされます。場合によってはこのデフォルトの振る舞いを変えたいことがあるかもしれません。そのような場合には発生したときの振る舞いを指定したい例外の完全限定名にプリフィクスをつけて指定します。プリフィクスとして使用できるのは "+" と "-" で、
指定した例外が投げられたとき

* コミットする場合は "+" を、
* ロールバックするときは "-" を指定します。

```xml
<property name="transactionAttributes">
  <props>
    <prop key="insert*">PROPAGATION_REQUIRED,+MyUncheckedException</prop>
    <prop key="update*">PROPAGATION_REQUIRED,-MyCheckedException</prop>
    <prop key="*">PROPAGATION_REQUIRED,readOnly</prop>
  </props>
</property>
```

# Propagation



# References

+ [Springでトランザクション管理](http://qiita.com/NagaokaKenichi/items/a279857cc2d22a35d0dd)

---
title: Spring JPA
data: 2016-08-30
tags: spring, spring-boot, jpa
---

<!-- toc -->

# Query methods & Query creation

`findByFooAndBar`のようなことをクエリを作成さずに利用できる

<http://docs.spring.io/spring-data/jpa/docs/current/reference/html/#jpa.query-methods.query-creation>

# Anootation


参考 :  <http://etc9.hatenablog.com/entry/20090830/1251606823>


## `@Entity`

`@Entity`は該当のクラスがエンティティであることを指定

## `@Id`

primary Key

## `@Table`

dbのテーブル名とentityのクラス名が違う場合

```
@Table(name="CUST", schema="RECORDS")
@Table(name="CUST")
```

## `@GeneratedValue`

`@Id`の指定した primary keyの採番方法を指定

```java
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
public Long getId() { return id; }
```

### strategy

+ GenerationTypeを利用
  + AUTO
  + IDENTITY
  + SEQUENCE
  + TABLE
+ customでstrategyを作ることもできる

## `@Column`

カラム属性を指定します。プロパティかフィールドに指定します。

```
@Entity
public class Customer {
    @Column(name = "first_name", nullable = false, length = 30)
    public String getFirstname(){ return firstname };
```

## `@Transient`

+ 永続化対象外とするプロパティやフィールド
  + テーブルとマッピングされないカラム

## `@MappedSuperclass`


+ @MappedSuperclassを付けないと、BaseEntity の id は永続化されません。


```java
@MappedSuperclass
public abstract class BaseEntity {
  @Id protected Long id;
  // ・・・
}

@Entity
public class Customer extends BaseEntity {
  public String name;
  // ・・・
}
```

## `@Enumerated`

+ <http://randyumi.hatenablog.com/entry/2013/09/26/011518>
+ <http://tomee.apache.org/examples-trunk/jpa-enumerated/README.html>
+ [Mapping Enums Done Right With @Convert in JPA 2.1](https://dzone.com/articles/mapping-enums-done-right)
+ Stringを指定すると，Enum#name call
+ Ordinalを指定すると，Enum#ordinal call
+ EnumType.ORDINAL：数値型
  + enumの書き順でDBには数字で記録される
+ EnumType.STRING：文字列型
  + nameがよばれ stringで保存される


```java
@Enumerated(EnumType.String)
private HogeEnum hoge;
```

## `@Temporal`

+ <http://itdoc.hitachi.co.jp/manuals/link/cosmi_v0870/APR4/EU260113.HTM>
+ <http://javabeat.net/jpa-annotations-temporal/>
+ 時刻を表す型（java.util.Dateおよびjava.util.Calendar）を持つ永続化プロパティまたは永続化フィールドに指定するアノテーションです。@Basicとともに使用できます。
+ ただし，`@Version`と@`Temporal`は同時に指定できません。どちらかのアノテーションだけを指定してください。適用可能要素は，メソッドとフィールドです。

+ TemporalType.DATE：java.sql.Dataと同じです。
+ TemporalType.TIME：java.sql.Timeと同じです。
+ TemporalType.TIMESTAMP：java.sql.Timestampと同じです。

## `@Convert`

+ <http://mike-neck.hatenadiary.com/entry/2014/09/11/162055>


enum convertの例

```java
@Converter(autoApply = true)
public class VehicleConverter implements AttributeConverter<Vehicle, String> {

 @Override
 public String convertToDatabaseColumn(Vehicle vehicle) {
  switch (vehicle) {
  case BUS:
   return "B";
  case CAR:
   return "C";
  case PLANE:
   return "P";
  case TRAIN:
   return "T";
  default:
   throw new IllegalArgumentException("Unknown value: " + vehicle);
  }
 }

 @Override
 public Vehicle convertToEntityAttribute(String dbData) {
  switch (dbData) {
  case "B":
   return Vehicle.BUS;
  case "C":
   return Vehicle.CAR;
  case "P":
   return Vehicle.PLANE;
  case "T":
   return Vehicle.TRAIN;
  default:
   throw new IllegalArgumentException("Unknown value: " + dbData);
  }
 }

}
```

## `@PrePersist` and `@PreUpdate`

+ `@EntityListeners(TimeStampListener.class)`のようにListenersを作ってそれで作る方法
+ または Entity classなかで `@PrePersist` and `@PreUpdate`を実装してもいい

```java
public class YourEntityClass {
  ...
    private Date creationTime;
    private Date modificationTime;

    @PrePersist
    public void prePersist() {
        Date now = Date();
        this.creationTime = now;
        this.modificationTime = now;
    }

    @PreUpdate
    public void preUpdate() {
        this.modificationTime = Date();
    }
}
```

### `@PrePersist`

### `@PreUpdate`

## `@Version`

+ JPAの楽観ロックを使うため

以下のようなsqlが発行される

```
where id=?
and version=?
```

# CookBook

## How to map a string to DB sequence in Hibernate - String primaryを作る方法

<http://stackoverflow.com/questions/12517421/how-to-map-a-string-to-db-sequence-in-hibernate>

```java
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.hibernate.HibernateException;
import org.hibernate.engine.spi.SessionImplementor;
import org.hibernate.id.IdentifierGenerator;

public class StringKeyGenerator implements IdentifierGenerator {

    @Override
    public Serializable generate(SessionImplementor session, Object collection) throws HibernateException {
        Connection connection = session.connection();
        PreparedStatement ps = null;
        String result = "";

        try {
            // Oracle-specific code to query a sequence
            ps = connection.prepareStatement("SELECT TABLE_SEQ.nextval AS TABLE_PK FROM dual");
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                int pk = rs.getInt("TABLE_PK");

                // Convert to a String
                result = Integer.toString(pk);
            }
        } catch (SQLException e) {
            throw new HibernateException("Unable to generate Primary Key");
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException e) {
                    throw new HibernateException("Unable to close prepared statement.");
                }
            }
        }

        return result;
    }
}
```

```java
@Id
@GenericGenerator(name="seq_id", strategy="my.package.StringKeyGenerator")
@GeneratedValue(generator="seq_id")
@Column(name = "TABLE_PK", unique = true, nullable = false, length = 20)
public String getId() {
    return this.id;
}
```

1. `@GenericGenerator`でつかう strategyクラスを作成
2. `@GenericGenerator`登録
3. `@GeneratedValue`の`generator`に`@GenericGenerator`のnameを入れる


# entity save

`save` & `flush` & `saveAndFlush`


# Spring Data JPA の Specificationでらくらく動的クエリ

<http://qiita.com/tag1216/items/3a408d2751a6310e2948>

Specification を使用するには、先ず Repositoryインターフェイスを JpaSpecificationExecutor を継承した形にする。

```java
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
public interface UserRepository extends JpaRepository<User, Long>, JpaSpecificationExecutor<User> {
}
```

# References

+ <http://stackoverflow.com/questions/12517421/how-to-map-a-string-to-db-sequence-in-hibernate>

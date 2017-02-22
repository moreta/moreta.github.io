

# fieldでaccessするかaccessor(getter)でaccessするか？

<http://stackoverflow.com/questions/594597/hibernate-annotations-which-is-better-field-or-property-access>

普通にgetterを定義saveしても、getterを経由しない
なのでgetterを`@Column`をつけて上げなとsaveのときにgetterを見てくれないので注意


## 以下の方法はだめだった

普通にgetterを定義saveしても、getterを経由しない
なのでgetterを`@Column`をつけて上げなとsaveのときにgetterを見てくれないので注意


```java
@Entity
public class Person {

  @Column("nickName")
  public String getNickName(){
     if(this.name != null) return generateFunnyNick(this.name);
     else return "John Doe";
  }
}
```

上記はstackoverflowのコードだが、jpaを使っているなら

```java
@Column(name = "nickName")
```
のようにする


# Object status

<http://docs.jboss.org/hibernate/core/3.6/reference/en-US/html/objectstate.html>

+ Transient
+ Persistent
+ Detached


Hibernate defines and supports the following object states:

## Transient

an object is transient if it has just been instantiated using the new operator, and it is not associated with a Hibernate Session. It has no persistent representation in the database and no identifier value has been assigned. Transient instances will be destroyed by the garbage collector if the application does not hold a reference anymore. Use the Hibernate Session to make an object persistent (and let Hibernate take care of the SQL statements that need to be executed for this transition).

## Persistent

a persistent instance has a representation in the database and an identifier value. It might just have been saved or loaded, however, it is by definition in the scope of a Session. Hibernate will detect any changes made to an object in persistent state and synchronize the state with the database when the unit of work completes. Developers do not execute manual UPDATE statements, or DELETE statements when an object should be made transient.

## Detached

a detached instance is an object that has been persistent, but its Session has been closed. The reference to the object is still valid, of course, and the detached instance might even be modified in this state. A detached instance can be reattached to a new Session at a later point in time, making it (and all the modifications) persistent again. This feature enables a programming model for long running units of work that require user think-time. We call them application transactions, i.e., a unit of work from the point of view of the user.

# Trouble Shoot

## application起動のときに "No identifier specified for entity"が発生

`@Id`がなくて発生するエラー





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

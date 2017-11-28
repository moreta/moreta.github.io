


# @Fetchアノテーションを使用する (Hibernate only. spring data jpaでは無視される)

```java
@Entity
public class Parent {
    @OneToMany(mappedBy="parent")
    @Fetch(FetchMode.SUBSELECT)
    private List<Child> children;
    ...
}  
```


| FetchMode | SELECT文の発行数 |
|:----------|:-----------------|
| SELECT    | N+1              |
| JOIN      | 1                |
| SUBSELECT | 2                |




# References

[JPAとN+1問題](http://bbook.hatenablog.jp/entry/2015/02/16/234848)

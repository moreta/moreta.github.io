# hibernate.id.new_generator_mappings

一意のインデックスキーを生成する場合にこの設定は有効に

<https://access.redhat.com/documentation/ja-JP/JBoss_Enterprise_Application_Platform/6/html/Migration_Guide/Hibernate_JPA_Persistence_Unit_Properties.html>

# Hilo algorithm

Hibernate will do a next value call on sequence 
and then calculate the values he will use from memory with the following formula 
(e.g. allocationSize is 50 and current sequence value is 5): 

upperLimit = (5 * 50) + 1 = 251 
lowerLimit = (251 - 50) = 201.

## Hiloの関連エラー

<https://hibernate.atlassian.net/browse/HHH-10656>

# sequenceを stringで保存する場合や prefixをつけて利用する場合

<http://stackoverflow.com/questions/12517421/how-to-map-a-string-to-db-sequence-in-hibernate>

# References

+ [Sequences in Hibernate](http://tech.zooplus.com/sequences-in-hibernate/)
+ [3.2.2.3. Hibernate JPA 永続ユニットプロパティ](https://access.redhat.com/documentation/ja-JP/JBoss_Enterprise_Application_Platform/6/html/Migration_Guide/Hibernate_JPA_Persistence_Unit_Properties.html)

---
title : Spring With ibatis(mybatis)
data: 2016-03-22
tags: spring-framework, java, ibatis
---

# ibatis startBatch, executeBatchを使いたい？

+ <http://stackoverflow.com/questions/2921840/ibatis-startbatch-only-works-with-sqlmapclients-own-start-and-commit-transact>
+ <https://docs.spring.io/spring/docs/2.5.x/javadoc-api/org/springframework/orm/ibatis/SqlMapClientTemplate.html>


SqlMapClientTemplate doesn't provide access to `startBatch()` `executeBatch()` directly.
So `new SqlMapClientCallback()`


```java
public void storeMyData(final List<MyData> listData) {
    getSqlMapClientTemplate().execute(new SqlMapClientCallback() {
        @Override
        public Object doInSqlMapClient(SqlMapExecutor executor) throws SQLException {
            int count = 0, total = 0;

            Map<String, Object> params = new HashMap<String, Object>();

            executor.startBatch();

            for (MyData data : listData) {
                params.put("param name 1", data.getValue());
                executor.insert("insertData", params);
                count++;
                if (count % DB_BATCH_SIZE == 0) {
                    total += executor.executeBatch();
                    executor.startBatch();
                }
                params.clear();
            }
            total += executor.executeBatch();
            return new Integer(total);
        }
    });
}
```

```java

getSqlMapClientTemplate().execute(new SqlMapClientCallback() {
         public Object doInSqlMapClient(SqlMapExecutor executor) throws SQLException {
                 executor.startBatch();
                 executor.update("insertSomething", "myParamValue");
                 executor.update("insertSomethingElse", "myOtherParamValue");
                 executor.executeBatch();
                 return null;
         }
 });
```

# ibatis mybatis

<http://www.egovframe.go.kr/wiki/doku.php?id=egovframework:rte2:psl:dataaccess:ibatis_vs_mybatis>

| ibatis                       | mybatis             | note                |
|------------------------------|---------------------|---------------------|
| com.ibatis.*                 | org.apache.ibatis.* | package name change |
| SqlMapConfig                 | Configuration       |                     |
| sqlMap                       | mapper              |                     |
| sqlMapClient                 | sqlSession          |                     |
| rowHandler                   | resultHandler       |                     |
| parameterMap, parameterClass | parameterType       |                     |
| resultClass                  | resultType          |                     |
| #var#                        | #{var}              |                     |
| $var$                        | ${var}              |                     |
| <isEqual>, <isNull>          | <if>                |                     |


# 大量データのselectとメモリ

<https://codezine.jp/article/detail/1852?p=2>


## 問題

大量の検索結果をCSVデータとして出力したい場合

大量の検索結果をCSVデータとして出力することを考えてみます。iBATISは検索結果をListデータとして返してくれます。例えば1千万件もあるデータをqueryForListで取得すると、1千万件もの検索結果を保持するListがJavaのオブジェクトして生成されてしまいます

## どうすれば？

+ このListを全件走査してCSVファイルを出力した場合、Listは単なる中間データとして存在するだけです
+ RowHandlerを使う - iBatis
+ ResultHandlerを使う - MyBatisから ~ 3.3まで

### RowHandler sample

#### sample 1

<http://devlights.hatenablog.com/entry/20060821/1156178950>

#### sample 2

大量をselectして、 csvへ書き込む例


rowhandlerの実装
```java
public class CsvRowHandler implements RowHandler {
  PrintWriter out;
  /**
   * 出力ファイルを指定してCSVRowHandlerを生成する
   * @param outputFile  出力ファイル
   */
  public CsvRowHandler(File outputFile) throws IOException {
    out = new PrintWriter(new FileWriter(outputFile));
  }
  /**
   * 1行を処理する
   */
  public void handleRow(Object value) {
    Dept dept = (Dept)value;
    out.print(dept.getDeptno());
    out.print(",");
    out.print(dept.getDname());
    out.print(",");
    out.print(dept.getLocation());
    out.println();
  }
  /**
   * ファイルをクローズする。
   */
  public void close(){
    out.close();
  }
}
```

使う部分
```java
//CSV出力用RowHandlerを生成
CsvRowHandler rowHandler = new CsvRowHandler(new File("Dept.csv"));
//rowHandlerを指定してクエリーを実行
sqlMap.queryWithRowHandler("csvData", rowHandler);
//CSVファイルをクローズ
rowHandler.close();
```

+ `handleRow` methodが N回呼ばれる
+ `queryForList`ではなく、`queryWithRowHandler`で実行し、引数に`RowHandler`を渡す
+ MYSQLで利用するときに注意点
  + ibatisの SQL MAPに以下のようにfetchSizeを追加する必要がある
    + しないとmysqlなどでは自分のjdbcを作ってあげるので rowhandlerを使っても out of memoryが発生する
    + `<select id="test" fetchSize="-2147483648">` > Integer.MIN_VALUE
  + MYSQL + rowHandler cacheバグ
    + `SELECT SQL_NO_CACHE * from Table...`のようにcache仕様中止syntaxを利用
+ Springと利用するときに
  +  -`getSqlMapClientTemplete()`には`queryWithRowHandler`メソッドがないので`getSqlMapClient()`を利用する-
  + `getSqlMapClientTemplete()`にも`queryWithRowHandler`メソッドがあった!

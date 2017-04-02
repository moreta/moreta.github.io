---
title: Apache Drill
data: 2016-05-13
tags: apache, drill, data
---


# Install on Mac

+ [Installing Drill on Linux and Mac OS X](https://drill.apache.org/docs/installing-drill-on-linux-and-mac-os-x/)
+ [Starting Drill on Linux and Mac OS X](https://drill.apache.org/docs/starting-drill-on-linux-and-mac-os-x/)

```bash
curl -o apache-drill-1.6.0.tar.gz http://apache.mesi.com.ar/drill/drill-1.6.0/apache-drill-1.6.0.tar.gz
tar -xvzf apache-drill-1.6.0.tar.gz
```

## path設定

```sh
## fish shell
set -x DRILL_HOME /drillpath/apache-drill-1.6.0
set -x PATH $DRILL_HOME/bin $PATH

## bash shell
# drill
export DRILL_HOME=/drillpath/apache-drill-1.6.0
export PATH=$DRILL_HOME/bin:$PATH
```

# console

```sh
# start drill shell
drill-embedded
# exist
!quit
```


# Querying Data with Drill
使ってみよう

```sh
0: jdbc:drill:zk=local> !set maxwidth 10000
0: jdbc:drill:zk=local> select * from
    dfs.`<path-to-yelp-dataset>/yelp/yelp_academic_dataset_business.json`
    limit 1;
```

# Storage Plugin Registration

アクセスできる Datasource

+ cp
  + Points to JAR files in the Drill classpath, such as employee.json that you can query.
+ dfs
  + Points to the local file system, but you can configure this storage plugin to point to any distributed file system, such as a Hadoop or S3 file system.
+ hbase
  + Provides a connection to HBase.
+ hive
  + Integrates Drill with the Hive metadata abstraction of files, HBase, and libraries to read data and operate on SerDes and UDFs.
+ mongo
  + Provides a connection to MongoDB data.

# Schema


```sql
0: jdbc:drill:zk=drilldemo:5181> show schemas;
+-------------+
| SCHEMA_NAME |
+-------------+
| hive.default |
| dfs.reviews |
| dfs.flatten |
| dfs.default |
| dfs.root  |
| dfs.logs  |
| dfs.myviews   |
| dfs.clicks  |
| dfs.tmp   |
| sys       |
| hbase     |
| INFORMATION_SCHEMA |
| s3.twitter  |
| s3.reviews  |
| s3.default  |
+-------------+
15 rows selected (0.072 seconds)
```

+ dfs.tmp
  + /tmp directoryを利用

# CSV export

tableをcsvタイプで作ることによってexportできる

```sql
USE dfs.tmp;
ALTER SESSION SET `store.format`='csv';

CREATE TABLE exprort_table_name
AS
SELECT ...
```

# Configuration

bfs
```json
{
  "type": "file",
  "enabled": true,
  "connection": "file:///",
  "config": null,
  "workspaces": {
    "root": {
      "location": "/",
      "writable": true,
      "defaultInputFormat": null
    },
    "csv_files": {
    }
    "tmp": {
      "location": "/tmp",
      "writable": true,
      "defaultInputFormat": null
    }
  },
  "formats": {
    "psv": {
      "type": "text",
      "extensions": [
        "tbl"
      ],
      "delimiter": "|"
    },
    "csv": {
      "type": "text",
      "extensions": [
        "csv"
      ],
      "delimiter": ","
    },
    "csv2": {
      "type": "text",
      "extensions": [
        "csv2"
      ],
      "skipFirstLine": true,
      "delimiter": ","
    },
    "tsv": {
      "type": "text",
      "extensions": [
        "tsv"
      ],
      "delimiter": "\t"
    },
    "parquet": {
      "type": "parquet"
    },
    "json": {
      "type": "json",
      "extensions": [
        "json"
      ]
    },
    "avro": {
      "type": "avro"
    },
    "sequencefile": {
      "type": "sequencefile",
      "extensions": [
        "seq"
      ]
    },
    "csvh": {
      "type": "text",
      "extensions": [
        "csvh"
      ],
      "extractHeader": true,
      "delimiter": ","
    }
  }
}
```
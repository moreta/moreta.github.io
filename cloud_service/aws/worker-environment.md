Worker Environment
=======================

<http://docs.aws.amazon.com/ja_jp/elasticbeanstalk/latest/dg/using-features-managing-env-tiers.html>

# 長い時間ローカルに実行されるタスクを回避ため

1.  プログラミング言語で AWS SDK を使用しAmazon Simple Queue Service キューに送信
2. インスタンスの異なるセットでそれらを行うプロセスを実行できます
  + and run the process that performs them on a separate set of instances

Elastic Beanstalk は Amazon SQS キューを管理し、キューから読み取る各インスタンスでデーモンプロセスを自動的に実行することで、このプロセスを簡略化します

## worker deamon

<http://docs.aws.amazon.com/ja_jp/elasticbeanstalk/latest/dg/using-features-managing-env-tiers.html#worker-daemon>
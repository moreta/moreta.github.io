

# AWSなら Aws Auroraを使う

* Reader Endpointを利用すれば解決できる

## railsでは

* multi readをサポートする　makara, octopus?, multidbなど使う必要ない
* 1master-1read(endpoint)が可能なので、switch_pointで大丈夫


# Pgpoolを利用

[AWS 上で Pgpool-II を使ってみよう](https://www.sraoss.co.jp/event_seminar/2017/jpug_20171103_pgpool_aws.pdf)

# HAProxyを利用

haproxyで利用するケースもある
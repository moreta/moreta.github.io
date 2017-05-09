HTTP Streaming
==============


# Chunked transfer encoding

+ ストリーミングなレスポンスにはContnt-Lengthヘッダはない
+ その代わりにTransfer-Encodingヘッダが"chunked"という値で含まれる


```
HTTP/1.1 200 OK
Content-Type: text/plain
Transfer-Encoding: chunked

25
This is the data in the first chunk

1C
and this is the second one

3
con
8
sequence
0
```


# References

+ [ストリーミング](https://ja.wikipedia.org/wiki/%E3%82%B9%E3%83%88%E3%83%AA%E3%83%BC%E3%83%9F%E3%83%B3%E3%82%B0)
  * [Chunked transfer encoding](https://en.wikipedia.org/wiki/Chunked_transfer_encoding)
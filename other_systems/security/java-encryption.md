


# Cipherオブジェクトの生成

Cipherオブジェクトの生成には、これまでと同様に下のgetInstanceファクトリメソッドを実行します。

```java
static Cipher getInstance(String transformation);
static Cipher getInstance(String transformation, String provider);
static Cipher getInstance(String transformation, Provider provider);

```

## transformation

+ 暗号化に使用するアルゴリズムやフィードバックモードを指定
+ パディング(padding)方式を指定

syntax

+ "algorithm/mode/padding"または
+ "algorithm"

```java
String transformation = "DES/CBC/PKCS5Padding";
String transformation = "AES/ECB/NoPadding";

Cipher c = Cipher.getInstance(transformation);
```

### Java暗号化アーキテクチャ標準アルゴリズム

* AES/CBC/NoPadding (128)
* AES/CBC/PKCS5Padding (128)
* AES/ECB/NoPadding (128)
* AES/ECB/PKCS5Padding (128)
* DES/CBC/NoPadding (56)
* DES/CBC/PKCS5Padding (56)
* DES/ECB/NoPadding (56)
* DES/ECB/PKCS5Padding (56)
* DESede/CBC/NoPadding (168)
* DESede/CBC/PKCS5Padding (168)
* DESede/ECB/NoPadding (168)
* DESede/ECB/PKCS5Padding (168)
* RSA/ECB/PKCS1Padding (1024、2048)
* RSA/ECB/OAEPWithSHA-1AndMGF1Padding (1024、2048)
* RSA/ECB/OAEPWithSHA-256AndMGF1Padding (1024、2048)


# nonceとは

nonceとは、number used onceの略で、1回だけ使われる番号という意味

### OpenIDの場合には、

> 第三者であるOP（OpenID発行サイト）に行って、また戻ってくるわけですから、1回だけ使えるトークンを発行して、
> 同じトークンを持ったユーザーが次に来たら**はねる**、というnonceの考え方は、本当にそれが正しいユーザーかを確認するために有効です

# char to byte code

[How to convert char to byte?](http://stackoverflow.com/questions/9139453/how-to-convert-char-to-byte)

```java
// 正の整数255を表す16進数リテラル「0xff」のAND演算をして、正の値に変換
stringBytes[i] = (byte) stringChars[i] & 0x00FF
```

# macとは

Message Authentication Code

# References

+ [JCE](http://www.techscore.com/tech/Java/JavaSE/JCE/index/)
+ [java doc Chiper Class](https://docs.oracle.com/javase/jp/8/docs/api/javax/crypto/Cipher.html)
+ [Cipherアルゴリズム名](https://docs.oracle.com/javase/jp/8/docs/technotes/guides/security/StandardNames.html#Cipher)
+ [5. Cipher Class](http://www.techscore.com/tech/Java/JavaSE/JCE/5/)

## nonce

+ [wiki nonce](https://ja.wikipedia.org/wiki/%E3%83%8E%E3%83%B3%E3%82%B9)
+ [悪意のある攻撃から身を守るには？](https://thinkit.co.jp/article/839/1)


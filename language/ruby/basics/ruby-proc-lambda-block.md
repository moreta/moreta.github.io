Ruby block/proc/lambda/yeild
=============================

# yield?

+ ブロックを呼び出すもの
+ 内部にyieldを持っている以上「ブロックを引数として受けとるメソッドである」ということを認識しないといけない。

# Proc

+ ブロックをオブジェクト化したもの
+ Procオブジェクトはcallで呼び出すことが出来る
+ Procに引数を期待する書き方も出来る
+ Proc.newとlambdaはほぼ同義

# ブロックとは引数で渡す

```ruby
#メソッド定義
def give_me_block( &block )
  block.call
end

#実行
give_me_block do
  p "Hello, block!"
end
=> "Hello, block!"
```

## 上の例を yieldをつかったら

```ruby
#メソッド定義
#def give_me_block( &block )
#  block.call
#end

#メソッド定義
def give_me_block    # (&block)を除去
  yield
end
```

## 注意

+ block引数は`一番最後に定義`
  + 以下はNG
  + `def give_me_block( &block1, param1 )`
  + `def give_me_block( &block1, &block2 )`

# &blockの「&」って？

&を付けることで、実際に引数にブロックが渡ってきた際、
**Procオブジェクトに変換**している。


# Procオブジェクトって？

+ ブロックをオブジェクト化したものがProc
  + ブロックがそれ単体では存在できないことを思い出す （→オブジェクト化してしまえばok）
  + ブロックをオブジェクトに変換することで、引き渡されたメソッド（give_me_block）内で扱えるようにする
+ Procオブジェクトは、callで呼び出すことが出来る
  + 上のblockを引数で渡す例で、2行目のblock.callの正体はこれ。

# Procとlambdaの違い

+ Procの場合追加のパラメータはnilに設定する
+ lambdaはエラーを返す
+ <https://qa.atmarkit.co.jp/q/68>

두번째 다른 점은 lambda는 diminutive return을 할 수 있다는 점이다. 예컨데, Proc는 값을 반환하면 메서드를 중단한다. 따라서 메서드의 최종 반환 값은 Proc의 반환값이 된다. 하지만 lambda는 반환 후에도 메서드가 계속 된다. 다음 예를 보자.



# References

+ <http://www.joinc.co.kr/modules/moniwiki/wiki.php/Site/Ruby/ProcsLambdaBlocks>
+ [Ruby block/proc/lambdaの使いどころ](http://qiita.com/kidach1/items/15cfee9ec66804c3afd2)
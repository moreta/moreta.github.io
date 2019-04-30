mac key repeat
======================


Karabinerからできてたけど、アップデートででくなくなった。

# References

* <https://blog.nijohando.jp/post/karabiner-elements-key-repeat-tab-is-gone/>

# 環境設定から設定できる速度以上の速度に設定できる

<https://github.com/mathiasbynens/dotfiles/issues/687>

```sh
echo "キーリピートの速さ 現在の設定を表示"
defaults read -g KeyRepeat
# defaults read NSGlobalDomain KeyRepeat # same

echo "キーリピート開始までの早さ 現在の設定を表示"
defaults read -g InitialKeyRepeat
# defaults read NSGlobalDomain InitialKeyRepeat # same

echo "キーリピートの速さ 1 に設定する(小さい程速い)"
echo "Set a blazingly fast keyboard repeat rate, (1unit 15ms)"
defaults write -g KeyRepeat -int 1

echo "Set a shorter Delay until key repeat"
echo "キーリピート開始までの早さ 10 に設定する(小さい程早い)"
defaults write -g InitialKeyRepeat -int 10
```


# Revert

revert to default settings with:

```sh
defaults delete -g KeyRepeat
defaults delete -g InitialKeyRepeat
```
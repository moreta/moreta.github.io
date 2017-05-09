less
=======

# tail -f の代わりのlessを使う

```sh
less -F file.log
# or

less file.log
# shift fするとtailモードになる
```

# tail mode -> normal mode

`Ctrl+C`
を入力して、通常のlessに戻れます。

# tailがいいどころ

+ 複数fileをtailする場合には tailがいい
+ lessはpipeができない `less +F /var/log/exim_mainlog | grep "something"` << できない



# References

+ [Stop using tail -f (mostly)](http://www.brianstorti.com/stop-using-tail/)
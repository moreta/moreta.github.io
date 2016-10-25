

# ssh loginの自動化

```sh
#!/bin/sh

PW="Password"

expect -c "
set timeout 5
spawn env LANG=C /usr/bin/ssh hoge@ServerName
expect \"password:\"
send \"${PW}\n\"
expect \"$\"
exit 0
"
```
# References

[Linuxの対話がめんどくさい?そんな時こそ自動化だ！-expect編-](http://qiita.com/ine1127/items/cd6bc91174635016db9b)

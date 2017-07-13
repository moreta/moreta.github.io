Python Install
=====================

# yum install 

```
yum search python
yum install python3.6
```

# source install

場合によってsudoとか必要かな

```sh
curl -O https://www.python.org/ftp/python/3.6.1/Python-3.6.1.tgz
tar xzf Python-3.6.1.tgz
cd Python-3.6.1
./configure --prefix=/usr/local
make
make altinstall
# pip install
curl -kL https://bootstrap.pypa.io/get-pip.py | /usr/local/bin/python3.6
# virtualenv install
/usr/local/bin/pip3.6 install virtualenv virtualenvwrapper
```

## /usr/local vs /opt/local


# References

[CentOS に Python2.7, Python3.3を入れたメモ](http://qiita.com/a_yasui/items/5f453297855791ed648d)
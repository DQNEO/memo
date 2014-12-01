# OSX(Yosemite)に関するメモ

## 組み込みのApacheについて

### version
```
$ /usr/sbin/httpd -v
Server version: Apache/2.4.9 (Unix)
Server built:   Sep  9 2014 14:48:20
```

### 起動、停止、再読込、再起動
* sudo apachectl start
* sudo apachectl stop
* sudo apachectl reload
* sudo apachectl restart

### DocumentRoot

/Library/WebServer/Documents/

### 設定ファイル

```
$ ls /etc/apache2 -l
total 44
drwxr-xr-x 15 root wheel   510 10 25 11:49 extra/
-rw-r--r--  1 root wheel 20786  9 10 07:11 httpd.conf
-rw-r--r--  1 root wheel 18121  2 18  2014 httpd.conf~previous
-rw-r--r--  1 root wheel 13077  9 10 07:09 magic
-rw-r--r--  1 root wheel 53258  9 10 07:09 mime.types
drwxr-xr-x  4 root wheel   136  9 10 07:09 original/
drwxr-xr-x  3 root wheel   102  9 10 07:11 other/
drwxr-xr-x  4 root wheel   136 10 25 11:54 users/
```

### apachectrlとは何か？

```
$ head /usr/sbin/apachectl
#!/bin/sh
```

単なるshスクリプトなので読め( ˘ω˘)

# PHPを有効にする方法

/etc/apache2/httpd.conf の169行目あたり

```conf
#LoadModule php5_module libexec/apache2/libphp5.so
```
このコメントを外してreloadする。


### DocumentRootをちょっといじる

好きにいじりたいのでオーナーを変更
```
$ sudo chown DQNEO /Library/WebServer/Documents
$ echo hello > /Library/WebServer/Documents/hello.txt
$ curl http://localhost/hello.txt
hello
$ echo '<?php echo PHP_VERSION . PHP_EOL;' > hello.php
$ curl http://localhost/hello.php
5.5.14
```

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

DocumentRoot: /Library/WebServer/Documents/

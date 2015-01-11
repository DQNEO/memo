## 基本方針
* 作業用の一般ユーザを作成
* ssh2のみ許可
* ポート番号を22以外に設定
* rootログイン禁止
* パスワード認証禁止,空パスワード禁止(公開鍵認証方式のみ許可)
* X Window Systemを使用しないのでX11転送も不要
* ユーザを制限する
* 接続元のIPを制限する(hosts.allow, hosts.deny)
* 一日一回 cat /var/log/secure　を眺める

## 設定
### 作業用の一般ユーザを作成
```
adduser -m userhoge
passwd userhoge
```

### /etc/ssh/sshd_config
```
Protocol 2
Port 9022
PermitRootLogin no
PermitEmptyPasswords no
PasswordAuthentication no
ChallengeResponseAuthentication no
UsePAM no
X11Forwarding no
AllowUsers userhoge
```
### ~/.ssh/authorized_keys
```
su - userhoge
mkdir ~/.ssh
chmod 0700 ~/.ssh
nano ~/.ssh/authorized_keys  # 手元のPCの公開鍵を張り付ける
chmod 0600 ~/.ssh/authorized_keys
```

#### /etc/hosts.deny
```
ALL:ALL
```

#### /etc/hosts.allow
```
sshd: 10.100.1.1
```

## 参考
[さくらのVPSを借りたら真っ先にやるべきssh設定](http://blog.myfinder.jp/2010/09/vpsssh.html)

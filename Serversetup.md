# サーバ構築マニュアル

## [sshd](sshd.md)

## sudo
 * useradd , wheel, visudo

パスワードなしでsudoする方法

/etc/sudoers.d/01_userfoo を作って、

```
userfoo      ALL=(ALL)       NOPASSWD:ALL
```
または

/etc/sudoers.d/00_wheel を作って
```
%wheel        ALL=(ALL)       ALL
```

## firewall
* iptablesを設定(不要なポートは閉じる　またSSHには国内からのみアクセス可とする)

## 開発環境
* zsh/screen/Emacs/Git

## SELinux
## TCPWrapper
## hostname
## ntpd
## DNS Resolver
## Disable Services
不要デーモンを停止する

## 参考リンク
* CentOSをサーバーとして活用するための基本的な設定
http://tanaka.sakura.ad.jp/archives/001065.html
* さくらVPSを借りたら絶対にやるべき11のタスク
http://anond.hatelabo.jp/20101027225250
* 今こそ見直すApacheの設定
http://blog.nomadscafe.jp/2011/07/apache.html

## 以下、ゴミ

練習で書いたやつ https://gist.github.com/1607706


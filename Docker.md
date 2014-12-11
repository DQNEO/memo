# Dockerメモ

## 最近の動向
* v1.3から、だいぶ便利になったらしい。
 * execコマンド
 * フォルダ共有機能？

## チュートリアル
* https://gist.github.com/yasushiyy/9923d68e4811d458fbe0
* http://docs.docker.com/userguide/dockerizing/
* http://www.techscore.com/blog/2014/08/05/introduction-to-docker/


## Hello World
```
$ sudo docker run ubuntu:14.04 /bin/echo 'Hello world'
Hello world
$ sudo docker run centos:centos6 /bin/echo 'Hello world'
Hello world
```

解説
```
docker run イメージ名　コマンド
```

`ubuntu:14.04` : イメージ名。:から右はタグ名っぽい。省略したら:latestを指定したのと同じになる。

この hello worldが終了すると、コンテナは終了する。永続化されないっぽい？


## 用語
Image マシンイメージ。AMIみたいなやつ。
Container  プロセスのこと
DockerHub  イメージ共有レポジトリのこと。Registryと同じか。

## 公式イメージ
単に`centos`とうつと、centos7が入ってしまう。`centos/centos6`と打てばv6を指定できる。

## コマンドの解説
### 副作用のないコマンドたち
ps, images は、状態を見るコマンドなので副作用がない。

```
sudo docker ps
sudo docker images
```

## sudo なしでdockerコマンドを叩けるようにする
ユーザをdockerグループに所属させればよい
```
sudo usermod --append --groups docker vagrant
```

### pull
DockerHUbからイメージをダウンロードしてくる。

```
docker pull centos  (centos7が入る)
docker pull ubuntu  (14.04が入る)
```

上記は、centos:latest, ubuntu:latestを指定したのと同じ意味である。
centos6を取得したい場合はこうする。

```
docker pull centos:centos6
```

ひとが作ったイメージを取得したい場合はこう
```
docker pull kazeburo/perl
```

### build
buildとは、Dockerfileを使ってイメージを作成すること。

`builddir/Dockerfile` を用意した上で下記のようにする
```
sudo docker build --rm=true --tag="dqneo/projectname" builddir
```

### run
コンテナを起動する。

pullせずにいきなりDockerHub上のイメージを指定することができる。

```
docker run kazeburo/perl perl -v
```

-t 仮想ttyをわりあてる
-i 

-vで、共有ディレクトリをマウントできる。(NFS的な)
```
sudo docker run -v /vagrant:/opt/vagrant -t -i centos/centos6 df -h
```

### rm 
コンテナの削除

```
docker rm コンテナID
```

### rmi
イメージの削除

```
docker rmi イメージ削除
```

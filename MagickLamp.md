# 仕事で使える魔法のLAMP

## make編

* [6 - 「ビルド」という作業は何を指しているのか](http://www.atmarkit.co.jp/ait/articles/1105/23/news128.html)
* [9 - Makefileをいろいろ書き換えながらビルドしてみよう] (http://www.atmarkit.co.jp/ait/articles/1106/10/news115.html)

### 6 - 「ビルド」という作業は何を指しているのか


### 9 - Makefileをいろいろ書き換えながらビルドしてみよう


## GNU hello編目次

* [10 - ダウンロードファイルが真正なものであるかを確認](http://www.atmarkit.co.jp/ait/articles/1106/17/news138.html)
* [11 - 配布パッケージの中身と、configureの役目を知る](http://www.atmarkit.co.jp/ait/articles/1106/24/news112.html)
* [12 - configureの設定を変更してみる](http://www.atmarkit.co.jp/ait/articles/1107/01/news139.html)
* [13 - configureでソフトウェア固有の設定を変更してみる](http://www.atmarkit.co.jp/ait/articles/1107/08/news129.html)

## 10 - ダウンロードファイルが真正なものであるかを確認

GNU helloをダウンロードする
```
wget http://ftp.gnu.org/gnu/hello/hello-2.7.tar.gz
```

## 11 - 配布パッケージの中身と、configureの役目を知る

* ファイル名が大文字になっているものはドキュメント
* INSTALL, CHANGESなどは読んどけ
* configureコマンドがMakefileを生成する
* configureはシェルスクリプトである。

### 背景：なぜconfigureを使うのか？

Makefileを書き換えればビルド設定変更することはできるが、ユーザーが環境差異を調べて吸収する作業をするのは大変。
そこで、自動的に環境を調査して、環境に合わせて設定したMakefileを生成する、という方法が採られるようになった。


> configureによる自動設定が主流になる前は、Makefileなどのファイルを自分の環境に合わせて書き換えてからmakeしていました。それに比べると現在のビルド作業は、はるかに楽になったものです。ただし、今現在でもconfigureが付属せず、自分で書き換えなければいけないFOSSは、ごく少ないですが存在しています。


## 12 - configureの設定を変更してみる

要約

onfigureの役割は2つ

* ほかの環境に移植しやすくすること
* ユーザーが設定を変更できるようにすること

設定変更は主に4つ

* インストールディレクトリ (どのソフトウェアでも共通)
* コンパイラやそのオプション (どのソフトウェアでも共通)
* 機能や追加オプションのオン・オフ (ソフトウェ固有)
* ソフトウェア実行時の設定のデフォルト値 (ソフトウェ固有)

ソフトウェ固有のオプションは、`./configure --help=short` で見ることができる。

### --prefixについて

インストール先は、--prefixで設定できる。
次のようにするのがよい。

```
./configure --prefix=/opt/hello-2.7
```

こうすると、下記のようにインストールされる。
```
$ tree /opt/hello-2.7
/opt/hello-2.7
├── bin
│   └── hello
└── share
    ├── info
    │   ├── dir
    │   └── hello.info
    └── man
        └── man1
            └── hello.1
```

/opt/app/ の直下に直接ファイルが置かれるのではなく、たいていbin, shareなどのディレクトが作られてその下に配置される。
これはUnixのお作法に従うためである。

### ./configureに環境変数を渡せる

いくつかの項目は、環境変数もしくは引数として渡せる。
```
$ ./configure CC=gcc
```
または
```
$ env CC=gcc ./configure
```

## 13 - configureでソフトウェア固有の設定を変更してみる

### --enable(--disable)と--with-foo(--without-foo)の違い
* enable/disable は、主にそのソフトウェアの機能や動作方法などを有効無効にするもの
* with/without は、主に外部のソフトウェアやライブラリを組み込む(まない)ように指示するもの




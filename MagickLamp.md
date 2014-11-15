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

# Apache httpd編

[14 - Apache HTTP Serverのビルドを始めよう](http://www.atmarkit.co.jp/ait/articles/1107/15/news124.html)
[15 - ライブラリが足りなくてビルドできないときは？](http://www.atmarkit.co.jp/ait/articles/1107/22/news142.html)

## 14 - Apache HTTP Serverのビルドを始めよう
### configureのポイント

* ダイナミックであれば、後から使いたくなったモジュールは、必要に応じて選択すればよいだけですから、「--enable-mods-shared=all」と指定します。
* モジュールは80個弱あり、いちいち引数で指定するのは面倒なので、一括で指定できる「--enable-modules」と「--enable-mods-shared」を検討します。前者はスタティック、後者はダイナミックの場合に使います。これらの引数にはモジュール名か、allまたはmostというキーワードが指定できます。
* with/withoutによる指定では、重要な設定としてMPM（Multi Processing Module）の選択があります。これはビルド時にだけ指定でき、実行時には変更できません。
* MPMとはクライアントからの接続を処理する部分で、LinuxではpreforkとworkerのどちらかのMPMを使います。簡単に違いを説明すると、preforkは1つの接続を1つのプロセスに割り当て、workerではプロセス内部のスレッドに割り当てます。workerの方が処理性能に優れていますが、PHPではpreforkを使うことが推奨されています。

### ./configureしてみる
```
./configure \
  --prefix=/opt/httpd-2.2.19 \
  --enable-mods-shared=all \
  --with-mpm=prefork
```
ここでzlibのエラーが出たので、いったんmod_deflateをdisableする。
これは、mod_deflate以外のエラーが出ないかを確認するため。

```
--disable-deflate
```

## 15 - ライブラリが足りなくてビルドできないときは？

心がまえ

> mod_deflateを使わないとはっきり確定しているなら、無効にしてそのままにしておく、というような判断もあるでしょうが、できるだけ問題を解決していくべき。
> 問題解決の作業を通じてスキルアップもできるでしょうし、ドキュメントに載っていないような実際の状況も把握できます。ソフトウェアをソースコードからビルドすることを覚えるということは、ビルド対象のソフトウェアをよく知り、コントロールできるようになるということです。スキルを上げるためには、問題から逃げるよりも積極的に対処し、原因を究明するべきです。




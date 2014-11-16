# Apache httpd編

[14 - Apache HTTP Serverのビルドを始めよう](http://www.atmarkit.co.jp/ait/articles/1107/15/news124.html)
[15 - ライブラリが足りなくてビルドできないときは？](http://www.atmarkit.co.jp/ait/articles/1107/22/news142.html)
[16 - proxyやsslのモジュールを使ってみる](http://www.atmarkit.co.jp/ait/articles/1107/29/news121.html)

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

外部ソフトウェアはconfigureのwith引数で指定できますので、ヘルプを参照すればどのような外部ソフトウェアに依存しているかを調べることができます。

zlibについては、ヘルプに次のような1行があります。--with-zで指定すれば良いことが分かります。

```
--with-z=DIR            use a specific zlib library
```

### ビルドするべきか、パッケージを使うべきか

外部ソフトウェアをソースコードからビルドするのか、それともOSやディストリビューションに入っているパッケージを使うか。

> まずはパッケージの利用を考えます。
> こういったこまごまとした外部ソフトウェアをすべてビルドしていくのは、分量的に面倒です。また、外部ソフトウェアは多くの場合ライブラリで、とくに掘り下げて把握する必要はないということがほとんどです。ライブラリはコンパイルしてインストールで終わりなので、設定や運用といった作業がありません。パッケージを使うメリットの方が大きいと判断できます。

パッケージがない場合は、当然ながらソースコードからビルドするしかない。

### ライブラリパッケージの探し方

yum searchする
```
$ yum search zlib
...結果...
zlib.i386 : The zlib compression and decompression library.
zlib.x86_64 : The zlib compression and decompression library.
zlib-devel.i386 : Header files and libraries for Zlib development.
zlib-devel.x86_64 : Header files and libraries for Zlib development.
```

zlibと、ヘッダファイルが必要なのでzlib-develも必要。

yum installする。

```
$ sudo yum install zlib zlib-devel
```

### 16 - proxyやsslのモジュールを使ってみる

実は、`--enable-mods-shared="all"`で含まれてないモジュールがある。
公式サイトを見ると下記のように説明されており。
```
--enable-mods-shared="all ssl ldap cache proxy authn_alias mem_cache file_cache authnz_ldap charset_lite dav_lock disk_cache"
```
allの右側に書いてあるものが、allに含まれていないものである。

このうち、sslとproxyを追加してみる。

`--enable-mods-shared="all ssl proxy"`のように書いてもいいのだが、行志向にした方が編集しやすいので下記のようにする。

```
./configure \
  --prefix=/opt/httpd-2.2.19 \
  --enable-mods-shared=all \
  --enable-ssl \
  --enable-proxy \
  --with-mpm=prefork
```

ここで、sslのエラーが出た場合はパッケージをインストーする。
```
$ sudo yum install openssl-devel
```

sslの場合はwith指定が必要。

```
./configure \
  --prefix=/opt/httpd-2.2.19 \
  --enable-mods-shared=all \
  --enable-ssl \
  --with-ssl \
  --enable-proxy \
  --with-mpm=prefork
```


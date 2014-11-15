# 仕事で使える魔法のLAMP

ビルド編目次

* [10 - ダウンロードファイルが真正なものであるかを確認](http://www.atmarkit.co.jp/ait/articles/1106/17/news138.html)
* [12 - configureの設定を変更してみる](http://www.atmarkit.co.jp/ait/articles/1107/01/news139.html)

## 10 - ダウンロードファイルが真正なものであるかを確認

GNU helloをダウンロードする
```
wget http://ftp.gnu.org/gnu/hello/hello-2.7.tar.gz
```

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

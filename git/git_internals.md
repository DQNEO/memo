# Gitの内部構造を知る。

## リンク集
* http://www.slideshare.net/youhei/git-12695573
* http://keijinsonyaban.blogspot.jp/2011/05/git.html

# メモ
### データ構造
* 差分ではなくスナップショット
* 3種類のオブジェクト
 * コミットオブジェクト
 * ツリーオブジェクト
 * Blobオブジェクト
* オブジェクトは全て読み取り専用。書き換え不可。

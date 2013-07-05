# Gitの内部構造を知る。

## リンク集
* [slideshare/実践 Git - 低レベルに知る Git](http://www.slideshare.net/youhei/git-12695573)
* [Git をボトムアップから理解する](http://keijinsonyaban.blogspot.jp/2011/05/git.html)
* [Chapter 9 Gitの内側](http://git-scm.com/book/ja/ch9-0.html)
* [サブコマンド一覧](http://git-scm.com/docs)
* [あなたの知らないGit Tips](http://keijinsonyaban.blogspot.jp/2010/11/git-tips.html)
* [gitrevisions(7)](https://www.kernel.org/pub/software/scm/git/docs/gitrevisions.html)
* [gitcore-tutorial(7)](http://schacon.github.io/git/gitcore-tutorial.html)


## メモ
### データ構造
* 差分ではなくスナップショット
* 3種類のオブジェクト
 * コミットオブジェクト
 * ツリーオブジェクト
 * Blobオブジェクト
* オブジェクトは全て読み取り専用。書き換え不可。

### 問いかけ
* コミットを特定する方法にはどんなものがありますか？
* Gitの本質を一言で言うと何でしょう？
* ブランチの正体（実体）は何だと思いますか？

# Berkshelfメモ

## 知ってること
* ver2はCygwinでインスコできなかった
* ver3はCygwinでインスコできた
* ver2は開発終了。ver3は鋭意開発中

## コマンド

```
berks vendor cookbooks
```
Berksfileをもとにcookbooksを取得して./cookbooks/ 内に設置してくれる

## Berksfileの書き方

gistをみよ https://gist.github.com/DQNEO/8188023

## BerksfileとBerksfile.lockの関係

Bundler/Composerなどと同じらしいのだが、イマイチわかってない


## Berkshelf対応Cookbookの作り方

ミニマムレポジトリを作った


## わからないこと

* ~/.berkshelf/cookbooks/ に大量のcookbookがダウンロードされているのだが、あれはなんなのか？
* berks updateだかberks installだかで、version番号の関係で失敗することがある。

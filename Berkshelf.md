# Berkshelfメモ

https://github.com/berkshelf/berkshelf

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

```Ruby
source "https://api.berkshelf.com/"
 
# use opscode cookbook
cookbook 'yum'
cookbook 'nginx'
cookbook 'memcached'
 
# git URL
cookbook 'chef-hostname' , git: 'git://github.com/lxmx/chef-hostname.git'
# github 
cookbook 'mongodb', github: 'edelight/chef-mongodb'
# github
cookbook 'berkshelf-minimum', github: 'DQNEO/cookbook-berkshelf-minimum'
 
# local path
cookbook 'berkshelf-minimum', path: '/tmp/cookbook-berkshelf-minimum'
 
# 別名で取得することもできる。
# knife solo cook -o hello $remote のように実行できる。
cookbook 'hello', github: 'DQNEO/cookbook-berkshelf-minimum'
```

## BerksfileとBerksfile.lockの関係

Bundler/Composerなどと同じらしいのだが、イマイチわかってない


## Berkshelf対応Cookbookの作り方

ミニマムレポジトリを作った


## わからないこと

* ~/.berkshelf/cookbooks/ に大量のcookbookがダウンロードされているのだが、あれはなんなのか？
* berks updateだかberks installだかで、version番号の関係で失敗することがある。

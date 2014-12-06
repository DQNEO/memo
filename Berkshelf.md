# Berkshelfメモ

https://github.com/berkshelf/berkshelf

## ver2とver3について
* ver2は開発終了。ver3は鋭意開発中
* Cygwinではver2はインスコできなかった。ver3はできた。
* knife soloはberkshelf連携機能があって、ver2,ver3両方対応している。


## コマンド

```
berks vendor cookbooks
```
Berksfileをもとにcookbooksを取得して./cookbooks/ 内に設置してくれる

## Berksfileの書き方

```Ruby
source "https://supermarket.chef.io"
 
# use opscode cookbook
cookbook 'yum'
cookbook 'nginx'
cookbook 'memcached'
 
# git URL
cookbook 'chef-hostname' , git: 'git://github.com/lxmx/chef-hostname.git'
# github 
cookbook 'mongodb', github: 'edelight/chef-mongodb'
# github
cookbook 'hello', github: 'DQNEO/cookbook-hello'
 
# local path
cookbook 'hello', path: '/tmp/cookbook-hello'
 
# 別名で取得することもできる。
# knife solo cook -o hello $remote のように実行できる。
cookbook 'hello', github: 'DQNEO/cookbook-hello'
```

## BerksfileとBerksfile.lockの関係

Bundler/Composerなどと同じらしいのだが、イマイチわかってない


## Berkshelf対応Cookbookの作り方

ミニマムレポジトリを作った

https://github.com/DQNEO/cookbook-hello


## わからないこと

* ~/.berkshelf/cookbooks/ に大量のcookbookがダウンロードされているのだが、あれはなんなのか？
* berks updateだかberks installだかで、version番号の関係で失敗することがある。

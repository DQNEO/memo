# Firewalld

## /usr/lib/firewalld と /etc/firewalld

* /usr/lib/ 以下のファイルはいじってはいけない
* /usr/lib/ 以下のファイルを /etc 以下にコピーして使う
* /etc/ 以下にファイルがあると、それが優先適用される。

## 例：sshdのポート番号変更
http://qiita.com/DQNEO/items/5780d81b2e0af4cc1544

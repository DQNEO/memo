# Chefに関するメモ

## the Omnibus Installer
これを使うと一発でChefをインストールできる。
```shell
curl -L https://www.opscode.com/chef/install.sh | sudo bash
```
http://docs.getchef.com/install_omnibus.html

## レシピ内でcookbook名を取得する


`cookbook_name.to_s`で取得できる。

同cookbook内の他のレシピを呼びたいときはこうする。

```
include_recipe cookbook_name.to_s + "::another_recipes"
```


## remote_directory

あくまでfilesリソースの拡張なので、templateは使えないことに注意。

```ruby
remote_directory "/etc/httpd/conf.d" do
  # ここのsourceは必要。
  # {cookbook_path}/files/default からの相対指定
  source "etc/httpd/conf.d"

  # ファイルの属性
  files_mode "0644"
  files_owner "root"
  files_group "root"

  # ディレクトリの属性
  group "root"
  owner "root"
  mode "0755"

end
```

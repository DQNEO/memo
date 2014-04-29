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

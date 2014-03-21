# Vagrantメモ

## わからないこと

* execute/bash resourceの違い

### DNS
DNSがらみのやつ、on/offどっちが速いのか不明

```
  config.vm.provider :virtualbox do |vb|
    # やたらネットワークが遅い現象の対策 (ipv6絡み)
    # on/offどっちが速いのか諸説あり？
    # offが速い説
    # see https://github.com/mitchellh/vagrant/issues/1172
    # Windowsだとonが速い説
    # see http://ooma.blog.jp/archives/vagrant-slow-internet-on-virtualbox
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "off"]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "off"]
  end
```

### Network / Port Forwarding

* :private_network と :forwarded_port は結局どっちがよいのか？
* :private_networkは "10.10.10.10"にすればいいのになんでみんな"192.168.33.*"みたいなわかりにくいのにしてるのか？


### Vagrantfileの書き方

よくVagrantfileの冒頭にRubyのコードを書いてるケースをみかけるが、あれは何だっけ？

## 内部的な動作モデル

* gem でvagrantを入れるのは古い。(ver1.0まで)
* 各種サブコマンド(up, reload,provisionなど)はプラグインになってるみたい
* ソースコードはGithubにある


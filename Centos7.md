# CentOS7に関するtips

サーバ構築一般に関する話題はこちら。[Serversetup.md](/Serversetup.md) 

## AWS公式AMIのSSHログイン方法

* KeyPairで自分のPCの公開鍵を登録しておいて、それをインスタンス起動時に指定する。
* ユーザ名centos,sshポート22でログインできる。
``` 
ssh -p 22 centos@$remote_id
```

## 最初にやること

### nano

```
sudo yum install -y nano
```


### [sshd](/sshd)設定変更 (ポート番号変更、root不許可、パスワード認証不許可
/etc/ssh/sshd_config を編集後、reloadする
```
sudo systemctl reload sshd.service
```
reloadに失敗するときはSELinuxが原因なので無効にする

```
setenforce 0
```
### yumまわり

* sudo yum update -y
* sudo yum install -y epel-release

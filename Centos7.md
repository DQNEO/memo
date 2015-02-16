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


### [sshd](/sshd.md)設定変更 (ポート番号変更、root不許可、パスワード認証不許可
/etc/ssh/sshd_config を編集後、reloadする
```
sudo systemctl reload sshd.service
```
reloadに失敗するときはSELinuxが原因なので無効にする

```
setenforce 0
```
### yumまわり

```
# なにはなくともupdate
sudo yum update -y
# epel導入
sudo yum install -y epel-release
```

### docker
```
sudo yum install -y docker
```

[sudoなしでdocker](/Docker.md#sudo-%E3%81%AA%E3%81%97%E3%81%A7docker%E3%82%B3%E3%83%9E%E3%83%B3%E3%83%89%E3%82%92%E5%8F%A9%E3%81%91%E3%82%8B%E3%82%88%E3%81%86%E3%81%AB%E3%81%99%E3%82%8B)

### nginx
インストール

```
rpm -Uvh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm
yum install --enablerepo=nginx -y nginx
```

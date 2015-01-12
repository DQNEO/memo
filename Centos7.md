# CentOS7に関するtips

サーバ構築一般に関する話題はこちら。[Serversetup.md](/Serversetup.md) 

## AWS公式AMIのSSHログイン方法

* KeyPairで自分のPCの公開鍵を登録しておいて、それをインスタンス起動時に指定する。
* ユーザ名centos,sshポート22でログインできる。
``` 
ssh -p 22 centos@$remote_id
```

## 最初にやること

[sshd](/sshd) (ポート番号変更、root不許可、パスワード認証不許可


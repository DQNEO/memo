# CentOS6のtips

## yumレポジトリを追加する

```
sudo rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
sudo rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
sudo rpm -Uvh http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.2-2.el6.rf.x86_64.rpm
```

※ 上のrpm -Uvhと下のyum installは同じものなのか？要確認

## epel,dockerを追加

```
sudo yum -y install http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
sudo yum -y install docker-io
sudo service docker start
sudo chkconfig docker on
```

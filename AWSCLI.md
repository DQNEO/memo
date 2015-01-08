# AWS CLIのtips集

instance-idからPublicDnsNameを調べる
```
aws ec2 describe-instances --instance-ids "i-a274efa4" | jq ".Reservations[0].Instances[0].PublicDnsName"
```

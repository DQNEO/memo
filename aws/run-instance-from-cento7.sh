#!/bin/bash

# CentOS7公式
ami_id="ami-89634988"
# 上記に付随するsnapshopt
snap_id='"snap-fad6987d"'

type="t2.micro"

# 以下は自分のアカウント固有の情報
## 初期立ち上げ用のSG(pingとsshのみ許可)
sg_id="sg-773d5a12"
## AWSに予め登録済みのkey pairの名前
key_name="dqneo_mba"
## 予め作成済みのSubnet
subnet_id="subnet-fb03eca2"

# 手元のマシンでのaws credentialsのprofile名
profile="dqneo"

aws --profile=$profile ec2 run-instances \
    --count 1\
    --image-id $ami_id\
    --subnet-id $subnet_id\
    --instance-type $type\
    --security-group-ids $sg_id\
    --key-name $key_name\
    --associate-public-ip-address\
    --block-device-mappings "[{\
        \"DeviceName\": \"/dev/sda1\", \
        \"Ebs\": {\
            \"DeleteOnTermination\": true,\
            \"SnapshotId\": $snap_id,\
            \"VolumeSize\": 8,\
            \"VolumeType\": \"gp2\"\
        }\
    }]" \
    | jq  --raw-output ".Instances[0].InstanceId"

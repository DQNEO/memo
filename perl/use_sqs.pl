#!/usr/bin/env perl
use v5.18;
use warnings;
use Config::Simple;
use Data::Dumper;
use Amazon::SQS::Simple;

my $q_url = shift or die "first argument must be a queu url";

# ~/.aws/configをパースしてcredentialsを取得
my $file = $ENV{'HOME'} . '/.aws/config';
my $cfg = new Config::Simple($file) or die "cannot parse config";

# ブロックにアクセスする
my $block =  $cfg->param(-block => 'default');

# Create an SQS object
my $sqs = Amazon::SQS::Simple->new($block->{aws_access_key_id}, $block->{aws_secret_access_key});

my $q = $sqs->GetQueue($q_url);

# ロングポーリング
# http://d.hatena.ne.jp/toritori0318/20130423/1366732268
# これはなぜかエラーが出る
# $q->SetAttribute('ReceiveMessageWaitTimeSeconds', 20);

# ロングポーリングしつつ無限ループ
while(1) {
    say "receiving...";
    my $msg = $q->ReceiveMessage();
    next unless $msg;
    say $msg->MessageBody();
    $q->DeleteMessage($msg);
}

#!/usr/bin/env perl
use v5.18;
use warnings;
use Config::Simple;
use Data::Dumper;

my $file = $ENV{'HOME'} . '/.aws/config';
my $cfg = new Config::Simple($file) or die "cannot parse config";

# ブロックにアクセスする
print Dumper $cfg->param(-block => 'default');
print Dumper $cfg->param(-block => 'profile 8122');

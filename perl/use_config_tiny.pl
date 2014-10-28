#!/usr/bin/env perl
use v5.18;
use warnings;
use Config::Tiny;
use Data::Dumper;

my $file = $ENV{'HOME'} . '/.aws/config';
my $cfg = Config::Tiny->read($file) or die "cannot parse config";

# 全体
print Dumper $cfg;

# ブロック
print Dumper $cfg->{default};

#!/usr/bin/perl

use strict;
use warnings;
use XMLRPC::Lite;

my $url = shift or die "usage $0 <url>";
our $EndPoint = 'http://b.hatena.ne.jp/xmlrpc';

my $count = XMLRPC::Lite
    ->proxy($EndPoint)
    ->call('bookmark.getTotalCount', $url)
    ->result;

print $count, "\n";

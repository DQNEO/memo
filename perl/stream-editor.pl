#!/usr/bin/env perl
use v5.22;

my $flag = 0;
while (<>) {

    if (/perform\(\)/) {
        $flag = 1;
        $_ = "--DUMMY--\n";
    } else {
        if ($flag == 1) {
            $flag = 0;
            next;
        }
    }

    print $_;
    
}

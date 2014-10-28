#!/usr/bin/perl

use strict;
use warnings;
{
    my $i = 1;

    sub f {
	print "$i\n";
	$i++;
    } 
}

f();
f();
f();


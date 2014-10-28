#!/usr/bin/perl

# http://perl-users.jp/articles/advent-calendar/2008/20.html
use List::Util qw/reduce/;

my $list = [1, 2, 3, 4, 5];

sub say { print @_,"\n" };

say reduce { say "$a,$b"; $a + $b } @$list;



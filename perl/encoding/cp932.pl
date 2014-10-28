use strict;
use warnings;

use utf8;
use Encode;
binmode(STDOUT,":encoding(cp932)") ;
binmode(STDERR,":encoding(cp932)") ;
use open IO => ":encoding(cp932)";

my $dir1 = "あ";
my $dir2 = '123を456表';
my $dir3 = "表①～";

#print $dir;
#__END__

opendir my $dh, encode('cp932',$dir2) or die $!;
my @dirs = readdir($dh);
closedir $dh;
print scalar @dirs, "\n";
print decode('cp932',$_)."\n" for @dirs;
my $str = shift;
my @chars = split //, $str;

while(@chars){
	$c1 = shift @chars;
	$c2 = shift @chars;
	$str = $c1.$c2;
	$byte = pack "H2", $str;
	print $byte;
}

print "\n";
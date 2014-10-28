my $str = shift;
print ( unpack "H2", $_ ) for split //,$str;
print "\n";
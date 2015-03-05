#!/usr/bin/env perl
use v5.20;
use warnings;
use Amazon::S3::Thin;
use Config::Tiny;
use XML::Simple;

sub parse_xml {
    my $response = shift;
    my $conf = shift;
    my $content  = $response->content;

    use XML::Thin;
    my $r = my $xml = XMLin($content, 'SuppressEmpty' => '', 'ForceArray' => ['Contents']);

    my $ret = {
        bucket       => $r->{Name},
        prefix       => $r->{Prefix},
        marker       => $r->{Marker},
        next_marker  => $r->{NextMarker},
        max_keys     => $r->{MaxKeys},
        is_truncated => (
            scalar $r->{IsTruncated} eq 'true'
            ? 1
            : 0
        ),
    };

    my @keys;
    foreach my $node (@{$r->{Contents}}) {
        my $etag = $node->{ETag};
        $etag =~ s{(^"|"$)}{}g if defined $etag;
        push @keys,
          { key               => $node->{Key},
            last_modified     => $node->{LastModified},
            etag              => $etag,
            size              => $node->{Size},
            storage_class     => $node->{StorageClass},
            owner_id          => $node->{Owner}{ID},
            owner_displayname => $node->{Owner}{DisplayName},
          };
    }
    $ret->{keys} = \@keys;

    if ($conf->{delimiter}) {
        my @common_prefixes;
        my $strip_delim = qr/$conf->{delimiter}$/;

        foreach my $node ($r->{CommonPrefixes}) {
            my $prefix = $node->{Prefix};

            # strip delimiter from end of prefix
            $prefix =~ s/$strip_delim//;

            push @common_prefixes, $prefix;
        }
        $ret->{common_prefixes} = \@common_prefixes;
    }

    return $ret;
}

my $config_file = $ENV{HOME} . "/.aws/credentials";

my $profile = "dqneo";
my $bucket = "tmpdqneo";

my $crd = Config::Tiny->read($config_file)->{$profile};
my $s3client = Amazon::S3::Thin->new($crd);

my $res = $s3client->list_objects($bucket, {prefix =>"1202", delimiter => "/"});
use Data::Dumper;
print $res->content;
exit;

my $struct = parse_xml($res);
exit;

for (sort @{$struct->{keys}}) {
    print $_->{key} . "\t" . $_->{last_modified} . "\n";
}

#!/usr/bin/perl

# http://x68000.q-e-d.net/~68user/net/echo-2.html
use strict;
use warnings;
use Socket;

my $port = 5000;

socket(CLIENT_WAITING, PF_INET, SOCK_STREAM, 0)
    or die "cannot make socket $!";

setsockopt(CLIENT_WAITING, SOL_SOCKET, SO_REUSEADDR, 1)
     or die "cannot setsockopt $!";

bind(CLIENT_WAITING, pack_sockaddr_in($port, INADDR_ANY))
     or die "cannot bind $!";

listen(CLIENT_WAITING, SOMAXCONN)
    or die "listen: $!";

print "listening port $port ...\n";

# while(1)することで、1つの接続が終っても次の接続に備える
while (1){
    my $paddr = accept(CLIENT, CLIENT_WAITING);

    # ホスト名、IPアドレス、クライアントのポート番号を取得
    my ($client_port, $client_iaddr) = unpack_sockaddr_in($paddr);
    my $client_hostname = gethostbyaddr($client_iaddr, AF_INET);
    my $client_ip = inet_ntoa($client_iaddr);

    print "connection: $client_hostname ($client_ip) port $client_port\n";

    # no buffer
    select(CLIENT); $|=1; select(STDOUT);

    my @data;
    while(<CLIENT>){
        warn $_;
        last if $_ eq "\r\n";
        push @data, $_;
    }
    print CLIENT http_header();

    close(CLIENT);

    warn "connection closed . watching port $port...\n";
}


sub http_header {

    my $text = <<EOF;
HTTP/1.1 200 OK
Date: Mon, 12 Jul 2010 16:26:53 GMT
Server: Apache
Last-Modified: Tue, 22 Sep 2009 18:12:36 GMT
Accept-Ranges: bytes
Connection: close
Content-Type: text/html

hello HTTP!!
EOF


}

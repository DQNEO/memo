#!/usr/bin/perl

use strict;
use warnings;
use DBI;

my $user = 'hoge';
my $passwd = 'fuga';
my $host = 'localhost';
my $dbname = 'mysample';
my $dbh = DBI->connect("DBI:mysql:$dbname:".$host, $user, $passwd);

my $sql;
my $sth;

# CREATE TABLE
$sql = "CREATE TABLE prefmaster ( id INT , name VARCHAR(255) ) ";
$dbh->do($sql);

# INSERT
$sql = " INSERT INTO prefmaster (id,name) values (1, 'hokkaido') ";
$dbh->do($sql);
$sql = " INSERT INTO prefmaster (id,name) values (2, 'akita') ";
$dbh->do($sql);

# SELECT
$sql = "SELECT * FROM prefmaster";

$sth = $dbh->prepare($sql);
$sth->execute;

print "SELECT\n";
while(my @a = $sth->fetchrow_array){
    print "@a\n";
}
print "\n";

# UPDATE
$sql = " UPDATE prefmaster SET name = 'iwate' WHERE id = 2 ";
$dbh->do($sql);

# DELETE 
$sql = " DELETE FROM prefmaster WHERE id = 1 ";
$dbh->do($sql);

# SELECT AGAIN
$sql = "SELECT * FROM prefmaster";

$sth = $dbh->prepare($sql);
$sth->execute;

print "SELECT\n";
while(my @a = $sth->fetchrow_array){
    print "@a\n";
}
print "\n";


# DROP TABLE
$sql = " DROP TABLE prefmaster ";
$dbh->do($sql);


$sth->finish;
$dbh->disconnect;


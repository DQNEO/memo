#!/usr/bin/env php
<?php
/* Connect to an ODBC database using driver invocation */
$dsn = 'mysql:dbname=mydb1;host=10.1.13.10';
$user = 'user1';
$password = 'MyS9L@hogehoge';

$dbh = new PDO($dsn, $user, $password);
$ret = $dbh->query('SELECT version()');
foreach ($ret as $row) {
    var_dump($row);
}

$dbh = null;

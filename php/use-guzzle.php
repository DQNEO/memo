#!/usr/bin/env php
<?php
require_once getenv('HOME') . '/.composer/vendor/autoload.php';

$client = new GuzzleHttp\Client;

// call request()
$res = $client->request('get' , 'https://httpbin.org/get', [
                            'query' => [
                                'name' => 'dqneo',
                                'age' => 20,
                                ], 
                            ]);
$res = $client->request('post' , 'https://httpbin.org/post', [
                            'form_params' => [
                                'name' => 'dqneo',
                                'age' => 20,
                                ], 
                            ]);


$res = $client->request('put' , 'https://httpbin.org/put', [
                            'json' => [
                                'name' => 'dqneo',
                                'age' => 20,
                                ], 
                            ]);

//echo $res->getBody();
// call send()

$params = [
    'name' => 'dqneo',
    'age' => 20,
    ];
$query = http_build_query($params, null, '&', PHP_QUERY_RFC3986);


$req = new GuzzleHttp\Psr7\Request('get', 'https://httpbin.org/get?' . $query);
echo $client->send($req)->getBody();
exit;

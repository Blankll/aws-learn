<?php
$host = 'redis';
$port = 6379;
$redis = new Redis();
$redis->connect($host, $port);
echo $redis->ping('redis connected')
?>


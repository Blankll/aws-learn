<?php
try{
  //$dsn "mysql:dbname=dbname;host=host";
  $dsn = 'mysql:host=mysql';
  $user = 'root';
  $pwd = '123456';
  $db = new PDO($dsn,$user,$pwd);
  $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  $db->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE,PDO::FETCH_ASSOC);
  var_dump($db);

  echo 'connect success! ';
}catch(PDOException $e)
{
  echo "error message：".$e->getMessage();
  echo "file：".$e->getFile();
  echo "line：".$e->getLine();
  echo "code：".$e->getCode();
}
?>


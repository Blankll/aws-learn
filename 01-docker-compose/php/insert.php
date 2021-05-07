<?php
try{
  //$dsn "mysql:dbname=dbname;host=host";
  $dsn = 'mysql:dbname=shop;host=mysql';
  $user = 'root';
  $pwd = '123456';
  $db = new PDO($dsn,$user,$pwd);
  $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  $db->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE,PDO::FETCH_ASSOC);
  $name = substr(base64_encode(random_bytes(10)),0, 5);
  $quantity= rand(); 
  $price= rand(); 
  $state = $db->prepare("INSERT INTO `goods`(`name`, `quantity`, `price`) VALUES(?, ?, ?)");
  $state->execute([$name, $quantity, $price]);

  echo "created name: $name, quantity: $quantity, price: $price";
}catch(PDOException $e)
{
  echo "error message：".$e->getMessage();
  echo "file：".$e->getFile();
  echo "line：".$e->getLine();
  echo "code：".$e->getCode();
}
?>


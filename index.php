<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link href="index.css" rel="stylesheet">
</head>
<body>
<div class="container">
<form method="post" action="handler.php">
    <label for="money">Яку суму бажаєте зняти?</label>
    <input id="money" type="text" value="1" name="money">
    <br>
    <input class="button" type="submit" value="Видати гроші">
</form>
<?php
$data = array();
include_once "funcdata.php";
jsonData($data);
include "answer.php";
printTable($data);
?>
</div>
</body>
</html>



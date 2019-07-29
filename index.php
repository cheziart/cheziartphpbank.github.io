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
if (file_exists("data.json")) {
    $handle = fopen('data.json', 'rb');
    $str = fread($handle, filesize('data.json'));
    fclose($handle);
    $data = json_decode($str, true);
}

include "answer.php";
printTable($data);
?>
</div>
</body>
</html>



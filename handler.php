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
<body><div class="container">
<?php
if (file_exists("data.json")) {
    $handle = fopen('data.json', 'rb');
    $str = fread($handle, filesize('data.json'));
    fclose($handle);
    $data = json_decode($str,true);
}
else {
    $data = ['500' => 10,
        '200' => 20,
        '100' => 10,
        '50' => 10,
        '20' => 20,
        '10' => 10,
        '5' => 20];
}
$quantity = 0;
$message = '';
$withdrawMoney = 0;
$result = array();
$multi = ($data['5']*5)+($data['10']*10)+($data['20']*20)+($data['50']*50)+($data['100']*100)+($data['200']*200)+($data['500']*500);
$money = $_POST["money"] ? $_POST["money"] :0;

$moneyErr = $_POST["money"] ? $_POST["money"] :0;

foreach ($data as $key => $value) {
    denominationErr($moneyErr, $data, $key);
}

$err = '';
if (filter_var($money, FILTER_VALIDATE_INT) == false && $money != '0') {
    $err = $err . "Введіть значення необхідної суми<br>";
}
if ($money < 5) {
    $err = $err . "Мінімальна сума для видачі 5 грн<br>";
}

if ($money > $multi) {
    $err = $err . "Введеної суми немає в наявності, ви можете зняти в межах цієї суми $multi<br>";
}
if (!is_int($money/5)) {
    $err = $err . "Сума повинна бути кратна 5<br>";
}

if ($moneyErr!==0) {
    $err = $err ."В банкоматі немає в найвності купюр для видачі даної суми";
}
if ($err != '') {
    echo $err;
    echo '<a href="index.php">Back</a>';
    die();
}
foreach ($data as $key => $value) {
    denomination($money, $data, $key, $quantity, $message, $withdrawMoney);
    $result[$key] = $message;
    $message = '';
    $quantity = 0;
}

$handle = fopen('data.json', 'wb');
$str = json_encode($data);
fwrite($handle, $str);
fclose($handle);

if ($withdrawMoney === 0) {
    echo "<h3>В банкоматі немає в найвності купюр для видачі даної суми</h3>";
} else {
    echo "<p>З рахунку знято:</p>";
    foreach ($result as $key => $value) {
        echo "<p>$value</p>";
    }
    echo "<h3>Разом $withdrawMoney у.о,</h3>";
}

function denomination(&$money, &$data, $faceValue, &$quantity, &$message, &$withdrawMoney) {
    $num = (string)$faceValue;
    if($data[$num]>0) {
        if ($money >= $faceValue) {
            $money -= $faceValue;
            $data[$num]--;
            $quantity++;
            $withdrawMoney += $faceValue;
            if($quantity > 0) {
                $message = " $quantity банкнот номіналом $faceValue,";
            } else {
                $message = '';
            }
            denomination($money, $data, $faceValue, $quantity, $message, $withdrawMoney);
        }
    }
}

function denominationErr(&$moneyErr, $data, $faceValue) {
    $num = (string)$faceValue;
    if($data[$num]>0) {
        if ($moneyErr >= $faceValue) {
            $moneyErr -= $faceValue;
            $data[$num]--;
            denominationErr($moneyErr, $data, $faceValue);
        }
    }
}

include "answer.php";
printTable($data);
?>

<br>
<a href="index.php">Back</a>
</div>
</body>

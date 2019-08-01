<?php
function jsonData(&$data) {
    if (file_exists("data.json")) {
        $handle = fopen('data.json', 'rb');
        $str = fread($handle, filesize('data.json'));
        fclose($handle);
        $data = json_decode($str, true);
    } else {
        $data = ['500' => 10,
            '200' => 20,
            '100' => 10,
            '50' => 10,
            '20' => 20,
            '10' => 10,
            '5' => 20];
    }
}

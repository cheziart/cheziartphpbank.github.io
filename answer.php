<?php
function printTable($data) {
    echo <<<EOL
<table>
<caption>Залишок купюр в банкоматі</caption>
    <tr>
        <th>[Номінал]</th>
        <th>[Кількість]</th>
    </tr>
EOL;
    foreach ($data as $key => $value) {
        echo "<tr>";
        echo "<td>$key</td>";
        echo "<td>$value</td>";
        echo "</tr>";
    }
    echo "</table>";
    echo "<h3>Залишок грошей в банкоматі</h3>";
    echo ($data['5']*5)+($data['10']*10)+($data['20']*20)+($data['50']*50)+($data['100']*100)+($data['200']*200)+($data['500']*500);
}

<?php

$handle = fopen('tx.csv', 'r');
$dataset = fopen('dataset.txt', 'w');

fwrite($dataset, "ano taxa\n");

$ratesGroupedByYear = [];

while ($data = fgetcsv($handle, 0, ';')) {
    $rate = $data[1];
    
    if (empty($rate)) {
        continue;
    }

    $date = DateTime::createFromFormat('d/m/Y', $data[0]);
    $year = $date->format('Y');

    $ratesGroupedByYear[$year][] = $rate;
}

foreach ($ratesGroupedByYear as $year => $rates) {
    $sum = 0;

    foreach ($rates as $rate) {
        $sum += $rate;
    }

    $average = $sum / count($rates);

    $line = "{$year} {$average}\n";
    fwrite($dataset, $line);
}

fclose($handle);
fclose($dataset);
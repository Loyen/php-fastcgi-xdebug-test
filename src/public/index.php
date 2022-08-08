<?php

header('Content-Type: application/json');

echo json_encode(
    [
        '$_SERVER' => $_SERVER['FOO'],
        'filter_input' => filter_input(INPUT_SERVER, 'FOO')
    ],
    128
) . PHP_EOL;

<?php
$DB_HOST = 'localhost';
$DB_USER = 'root';
$DB_PASS = '';
$DB_NAME = 'agro_localizacion';

if (is_readable(__DIR__ . '/config.local.php')) {
    require __DIR__ . '/config.local.php';
}

if (($env = getenv('DB_HOST')) !== false && $env !== '') {
    $DB_HOST = $env;
}
if (($env = getenv('DB_USER')) !== false && $env !== '') {
    $DB_USER = $env;
}
if (getenv('DB_PASS') !== false) {
    $DB_PASS = getenv('DB_PASS');
}
if (($env = getenv('DB_NAME')) !== false && $env !== '') {
    $DB_NAME = $env;
}

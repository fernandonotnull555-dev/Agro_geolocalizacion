<?php
$DB_HOST = 'localhost';
$DB_USER = 'root';
$DB_PASS = '';
$DB_NAME = 'agro_localizacion';

if (is_readable(__DIR__ . '/config.local.php')) {
    require __DIR__ . '/config.local.php';
}

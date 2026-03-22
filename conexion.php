<?php
require_once __DIR__ . '/config_db.php';

$conexion = new mysqli($DB_HOST, $DB_USER, $DB_PASS, $DB_NAME);

// Verificar conexión
if ($conexion->connect_error) {
    die("Error de conexión: " . $conexion->connect_error);
}

$conexion->set_charset('utf8mb4');

?>


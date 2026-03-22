<?php
header('Content-Type: application/json; charset=utf-8');

require_once __DIR__ . '/config_db.php';

$conn = new mysqli($DB_HOST, $DB_USER, $DB_PASS, $DB_NAME);

if ($conn->connect_error) {
    die(json_encode([
        "estado" => "error",
        "mensaje" => "Error de conexión: " . $conn->connect_error
    ]));
}

$conn->set_charset('utf8mb4');

// Obtener datos del formulario
$nombre = $_POST['nombre'] ?? '';
$direccion = $_POST['direccion'] ?? '';
$coordenadas = $_POST['coordenadas'] ?? '';

// Validar campos obligatorios
if (!$nombre || !$direccion || !$coordenadas) {
    die(json_encode([
        "estado" => "error",
        "mensaje" => "Datos incompletos"
    ]));
}

// Validar formato de coordenadas con una regex más flexible
if (!preg_match('/^POINT\s*\(\s*(-?\d+(\.\d+)?)\s+(-?\d+(\.\d+)?)\s*\)$/i', $coordenadas)) {
    die(json_encode([
        "estado" => "error",
        "mensaje" => "Formato de coordenadas inválido"
    ]));
}

// Preparar consulta SQL
$sql = "INSERT INTO lugares (nombre, direccion, ubicacion) VALUES (?, ?, ST_GeomFromText(?))";
$stmt = $conn->prepare($sql);

if (!$stmt) {
    die(json_encode([
        "estado" => "error",
        "mensaje" => "Error al preparar la consulta: " . $conn->error
    ]));
}

$stmt->bind_param("sss", $nombre, $direccion, $coordenadas);

if ($stmt->execute()) {
    echo json_encode([
        "estado" => "ok",
        "mensaje" => "Agromercado creado correctamente",
        "id" => $conn->insert_id
    ]);
} else {
    echo json_encode([
        "estado" => "error",
        "mensaje" => "Error al crear el agromercado: " . $stmt->error
    ]);
}

$stmt->close();
$conn->close();
?>
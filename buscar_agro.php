<?php
header('Content-Type: application/json; charset=utf-8');

require_once __DIR__ . '/config_db.php';

$conexion = new mysqli($DB_HOST, $DB_USER, $DB_PASS, $DB_NAME);

if ($conexion->connect_error) {
    die(json_encode([
        'estado' => 'error',
        'mensaje' => 'Error de conexión: ' . $conexion->connect_error,
    ]));
}

$conexion->set_charset('utf8mb4');

$listarTodos = isset($_GET['listar']) && $_GET['listar'] === 'todos';

if ($listarTodos) {
    $query = 'SELECT nombre, direccion, ST_AsText(ubicacion) AS ubicacion FROM lugares ORDER BY nombre';
    $resultado = $conexion->query($query);
    if (!$resultado) {
        echo json_encode(['estado' => 'error', 'mensaje' => $conexion->error]);
        $conexion->close();
        exit;
    }
    $lugares = [];
    while ($fila = $resultado->fetch_assoc()) {
        $punto = filaALugar($fila);
        if ($punto) {
            $lugares[] = $punto;
        }
    }
    $conexion->close();
    echo json_encode(['estado' => 'ok', 'lugares' => $lugares], JSON_UNESCAPED_UNICODE);
    exit;
}

$nombreLugar = isset($_GET['nombre_agro']) ? trim($_GET['nombre_agro']) : '';

if ($nombreLugar === '') {
    die(json_encode([
        'estado' => 'error',
        'mensaje' => 'Debe proporcionar el nombre del agromercado o una palabra de búsqueda.',
    ]));
}

$query = 'SELECT nombre, direccion, ST_AsText(ubicacion) AS ubicacion FROM lugares WHERE nombre LIKE ? OR direccion LIKE ?';
$stmt = $conexion->prepare($query);
$like = '%' . $nombreLugar . '%';
$stmt->bind_param('ss', $like, $like);
$stmt->execute();
$resultado = $stmt->get_result();

$lugares = [];
while ($fila = $resultado->fetch_assoc()) {
    $punto = filaALugar($fila);
    if ($punto) {
        $lugares[] = $punto;
    }
}

$stmt->close();
$conexion->close();

echo json_encode(['estado' => 'ok', 'lugares' => $lugares], JSON_UNESCAPED_UNICODE);

/**
 * @param array{nombre: string, direccion: string, ubicacion: string} $fila
 * @return array<string, mixed>|null
 */
function filaALugar(array $fila)
{
    if (!preg_match('/POINT\((-?\d+\.?\d*)\s+(-?\d+\.?\d*)\)/', $fila['ubicacion'], $coordenadas)) {
        return null;
    }

    return [
        'nombre' => $fila['nombre'],
        'direccion' => $fila['direccion'],
        'latitud' => floatval($coordenadas[2]),
        'longitud' => floatval($coordenadas[1]),
    ];
}

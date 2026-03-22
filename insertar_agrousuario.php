<?php
require_once __DIR__ . '/config_db.php';

$conexion = new mysqli($DB_HOST, $DB_USER, $DB_PASS, $DB_NAME);

if ($conexion->connect_error) {
    die("Error de conexión: " . $conexion->connect_error);
}

$conexion->set_charset('utf8mb4');

// Verificar si se han enviado los datos del formulario
if (isset($_POST['nombre'], $_POST['correo_electronico'], $_POST['contrasena'], $_POST['rol'])) {
    $nombre_completo = $_POST['nombre']; // Captura el nombre completo
    $correo = $_POST['correo_electronico']; // Captura el correo
    $contrasena = $_POST['contrasena']; // Captura la contraseña
    $rol_usuario = $_POST['rol']; // Captura el rol de usuario

    // Consulta SQL para insertar los datos del nuevo usuario
    $query = "INSERT INTO usuarios (nombre, correo_electronico, contrasena, rol) VALUES (?, ?, SHA2(?, 256), ?)";
    
    // Preparar la consulta
    $stmt = $conexion->prepare($query);

    // Verificar si la preparación fue exitosa
    if ($stmt === false) {
        die("Error en la preparación de la consulta: " . $conexion->error);
    }

    // Vincular parámetros a la consulta
    $stmt->bind_param('ssss', $nombre_completo, $correo, $contrasena, $rol_usuario);

    // Ejecutar la consulta y verificar si tuvo éxito
    if ($stmt->execute()) {
        echo "Usuario registrado exitosamente.";
    } else {
        echo "Error al registrar el usuario: " . $stmt->error; 
    }

    // Cerrar la declaración
    $stmt->close(); 
} else {
    echo "Por favor, completa todos los campos.";
}

// Cerrar la conexión a la base de datos
$conexion->close(); 
?>

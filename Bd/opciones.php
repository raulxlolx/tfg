<?php
require 'conn.php';

// Crear conexión

// Establecer encabezados para CORS y JSON

header('Access-Control-Allow-Origin: *');


// Obtener el método HTTP
$method = $_SERVER['REQUEST_METHOD'];

// Obtener datos del cuerpo de la solicitud
$input = json_decode(file_get_contents('php://input'), true);

switch ($method) {
    case 'GET':
        if (isset($_GET['producto'])) {
            $producto = $conn->real_escape_string($_GET['producto']);
            $sql = "SELECT marca FROM Marcas WHERE producto='$producto'";
            $result = $conn->query($sql);
            $marcas = [];
            while ($row = $result->fetch_assoc()) {
                $marcas[] = $row['marca'];
            }
            echo json_encode($marcas);
        }
        break;

    case 'POST':
        if (isset($input['producto']) && isset($input['marca'])) {
            $producto = $conn->real_escape_string($input['producto']);
            $marca = $conn->real_escape_string($input['marca']);
            $sql = "INSERT INTO Marcas (producto, marca) VALUES ('$producto', '$marca')";
            if ($conn->query($sql) === TRUE) {
                echo json_encode(["mensaje" => "Marca agregada exitosamente"]);
            } else {
                echo json_encode(["mensaje" => "Error: " . $conn->error]);
            }
        }
        break;

    case 'DELETE':
        if (isset($input['producto']) && isset($input['marca'])) {
            $producto = $conn->real_escape_string($input['producto']);
            $marca = $conn->real_escape_string($input['marca']);
            $sql = "DELETE FROM Marcas WHERE producto='$producto' AND marca='$marca'";
            if ($conn->query($sql) === TRUE) {
                echo json_encode(["mensaje" => "Marca eliminada exitosamente"]);
            } else {
                echo json_encode(["mensaje" => "Error: " . $conn->error]);
            }
        }
        break;

    default:
        echo json_encode(["mensaje" => "Método HTTP no soportado"]);
        break;
}

$conn->close();
?>

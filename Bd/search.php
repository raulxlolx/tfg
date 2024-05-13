<?php
require 'conn.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nombre = $_POST['nombre'];

    $sql = "SELECT * FROM clientes WHERE nombre LIKE '%$nombre%'";

    $result = $conn->query($sql);
    
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            echo "<button class='button' onclick='seleccionarCliente(" . $row['id'] . ")'>" . $row['nombre'] . "</button>";
        }
    } else {
        echo "0 resultados";
    }
}
?>

<?php 
    require 'conn.php';

    $id = $_POST['id'];
    $codigo_barras = $_POST['codigo_barras'];

    $query = "SELECT clientes.*, depositos.* 
              FROM clientes 
              INNER JOIN depositos ON clientes.id = depositos.id_cliente 
              WHERE clientes.id = $id AND depositos.codigo_barras = $codigo_barras";

    $result = mysqli_query($conn, $query);

    $row = mysqli_fetch_assoc($result);
    
    echo json_encode($row);

    $conn->close();
?>
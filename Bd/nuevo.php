<?php 

    require 'conn.php';

    $name = $_POST['name'];
    $email = $_POST['email'];
    $phone = $_POST['phone'];
    $fecha = $_POST['fecha'];

    $sql = "INSERT INTO `clientes`(`nombre`, `email`, `telefono`) VALUES ('$name', '$email', '$phone')";
    // $sql = "INSERT INTO `depositos`(`fecha_entrada`) VALUES ('$fecha')";
    if($conn->query($sql) === TRUE){
        echo "Cliente añadido";
    }else{
        echo "Error: " . $sql . "<br>" . $conn->error;
    }

?>
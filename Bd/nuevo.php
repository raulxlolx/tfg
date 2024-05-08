<?php 

    require 'conn.php';

    $name = $_POST['name'];
    $email = $_POST['email'];
    $phone = $_POST['phone'];
    $fecha = $_POST['fecha'];
    $codigo_barras = $_POST['codigo_barras'];
    $objeto = $_POST['Objeto'];
    $problema = $_POST['Problema'];
    $empleado = $_POST['Empleado'];
    $contraseña = $_POST['Contraseña'];
    $prioridad = $_POST['Prioridad'];
    $serie=$_POST['Nserie'];
    $albaran = $_POST['Albaran'];
    $presupuesto = $_POST['Presupuesto'];
    $adelantado = $_POST['Adelantado'];
    // value 1 del estado que es no reparado
    $estado = 1;
    $resultado=1;

    $sql = "INSERT INTO `clientes`(`nombre`, `email`, `telefono`) VALUES ('$name', '$email', '$phone')";
    if($conn->query($sql) === TRUE){
        $last_id = $conn->insert_id;
    }else{
        echo "Error: " . $sql . "<br>" . $conn->error;
    }

    $sql = "INSERT INTO `depositos`(`id_cliente`, `codigo_barras`,`fecha_entrada`,`datos_deposita`,`problemas`,`empleado`,`estado`,`resultado_reparacion`, 
    `contraseña_so`, `prioridad`, `nserie`, `albaran`, `presupuesto`, `adelantado`)
     VALUES ('$last_id', '$codigo_barras','$fecha','$objeto','$problema','$empleado','$estado','$resultado','$contraseña','$prioridad','$serie','$albaran','$presupuesto','$adelantado')";
    if($conn->query($sql) === TRUE){
        echo "Cliente añadido";
    }else{
        echo "Error: " . $sql . "<br>" . $conn->error;
    }

?>
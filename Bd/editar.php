<?php 

    require 'conn.php';
    $id = $_POST['id'];
    $codigo_barras = $_POST['codigo_barras'];
    $name = $_POST['name'];
    $email = $_POST['email'];
    $phone = $_POST['phone'];
    $fecha = $_POST['fecha'];
    $dni = $_POST['dni'];
    $poblacion = $_POST['poblacion'];
    $direccion = $_POST['Direccion'];
    $codigoP= $_POST['CodigoP'];

    $fecha = $_POST['fecha'];
    $fechaR = $_POST['fechaR'];
    $objeto = $_POST['DatosDeposita'];
    $problema = $_POST['Problemas'];
    $empleado = $_POST['Empleado'];
    $contraseña = $_POST['Contraseña'];
    $prioridad = $_POST['Prioridad'];
    $serie=$_POST['Nserie'];
    $albaran = $_POST['Albaran'];
    $presupuesto = $_POST['Presupuesto'];
    $adelantado = $_POST['Adelantado'];
    $estado = $_POST['estado'];
    $solucion=$_POST['Solucion'];
    $resultado=$_POST['Resultado'];

    
    $sql = "UPDATE `clientes` 
    INNER JOIN `depositos` ON `clientes`.`id` = `depositos`.`id_cliente`
    SET `nombre`='$name',`email`='$email',`telefono`='$phone',`dni`='$dni',`poblacion`='$poblacion',`direccion`='$direccion',`codigo_postal`='$codigoP' 
    WHERE `clientes`.`id`='$id' AND `depositos`.`codigo_barras`='$codigo_barras'";
if($conn->query($sql) === TRUE){
echo "Cliente actualizado";
}else{
echo "Error: " . $sql . "<br>" . $conn->error;
}

$sql2 = "UPDATE `depositos` 
     SET `fecha_entrada`='$fecha',`fecha_retirada`='$fechaR',`datos_deposita`='$objeto',`problemas`='$problema',`empleado`='$empleado',`contraseña_so`='$contraseña',`prioridad`='$prioridad',`nserie`='$serie',`albaran`='$albaran',`presupuesto`='$presupuesto',`adelantado`='$adelantado',`estado`='$estado',`solucion`='$solucion',`resultado_reparacion`='$resultado' 
     WHERE `id_cliente`='$id' AND `codigo_barras`='$codigo_barras'";
if($conn->query($sql2) === TRUE){
echo "Deposito actualizado";
}else{
echo "Error: " . $sql2 . "<br>" . $conn->error;
}
?>
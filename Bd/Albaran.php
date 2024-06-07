<?php 
require 'conn.php';

$codigo_barras = $_POST['codigo_barras'];
$descripcion = $_POST['descripcion'];
$num_serie = $_POST['num_serie'];
$precio = $_POST['precio'];
$precio_iva = $_POST['precio_iva'];
$cantidad = $_POST['cantidad'];
$importe = $_POST['importe'];
$base_imponible = $_POST['base_imponible'];

$total = $_POST['total'];


$sql = "INSERT INTO albaran (cod_barras, descripcion, numero_serie, precio, precio_iva, cantidad, importe, base_imponible, total) 
  VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?) 
  ON DUPLICATE KEY UPDATE 
  descripcion = VALUES(descripcion), 
  numero_serie = VALUES(numero_serie), 
  precio = VALUES(precio), 
  precio_iva = VALUES(precio_iva), 
  cantidad = VALUES(cantidad), 
  importe = VALUES(importe), 
  base_imponible = VALUES(base_imponible), 
  total = VALUES(total)";

$stmt = $conn->prepare($sql);
$stmt->bind_param("sssssssss", $codigo_barras, $descripcion, $num_serie, $precio, $precio_iva, $cantidad, $importe, $base_imponible, $total);
$stmt->execute();
?>

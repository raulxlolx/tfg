<?php
include 'conn.php';

$id = $_POST['id'];

$query = "SELECT * FROM clientes WHERE id = $id";
$result = mysqli_query($conn, $query);

$row = mysqli_fetch_assoc($result);

echo json_encode($row);
?>
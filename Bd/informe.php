<?php
 header('Aceess-Control-Allow-Origin: *');
    require 'conn.php';


    $sql ="SELECT fecha_entrada, fecha_retirada FROM depositos";

    $result = $conn->query($sql);

$data = array();
if ($result->num_rows > 0) {
    // Output data of each row
    while($row = $result->fetch_assoc()) {
        $data[] = $row;
    }
} 
echo json_encode($data);

$conn->close();


?>
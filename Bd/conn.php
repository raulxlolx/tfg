<?php 

    $localhost = "localhost";
    $username = "root";
    $password = "";
    $dbname = "tfg";


    $conn = new mysqli($localhost, $username, $password, $dbname);

    if($conn->connect_error){
        die("Connection failed: " . $conn->connect_error);
    }

    






?>
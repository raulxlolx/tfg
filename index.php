<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Index</title>

    <link rel="stylesheet" href="css/index.css">
</head>
<body>
    
<header>
<button class="sidebar-toggle">Toggle Sidbar</button>
      <h1>Gestion Taller Dynos</h1>

      <button class="button"><a href="Nuevo.html">Nuevo deposito</a></button>
</header>
<div class="container-wrapper">
<div class="asidebar">
    <nav>
        <ul class="asidebar-menu">
             <li class="asidebar-li"><img class="icon" src="images/depositoicon.png" alt=""><a href="#">Deposito</a></li>
            <li  class="asidebar-li"><a href="clientes.php">informes</a></li>
            <li  class="asidebar-li"><a href="vehiculos.php">Opciones</a></li>
      
        </ul>
    </nav>
</div>
<div class="container">
    <!-- aqui ira la tabla de donde se imprimen los datos del php -->
   <?php 
   
        
      
        require 'Bd/conn.php';

        $sql = "SELECT clientes.id, clientes.nombre, depositos.fecha_entrada, depositos.datos_deposita, depositos.estado 
                FROM clientes 
                INNER JOIN depositos ON clientes.id = depositos.id_cliente";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            echo "<table><tr><th>ID</th><th>Nombre</th><th>Fecha de entrada</th><th>Objeto depositado</th><th>Estado de la reparación</th></tr>";
            // output data of each row
            while($row = $result->fetch_assoc()) {
                echo "<tr><td>" . $row["id"]. "</td><td>" . $row["nombre"]. "</td><td>" . $row["fecha_entrada"]. "</td><td>" . $row["datos_deposita"]. "</td><td>" . $row["estado"]. "</td></tr>";
            }
            echo "</table>";
        } else {
            echo "0 results";
        }
        $conn->close();
  
   
   
    
   
   
   
   
   
   
   
   ?>
</div>
</div>

<script>
   document.addEventListener('DOMContentLoaded', (event) => {
    const sidebarToggle = document.querySelector('.sidebar-toggle');
    const asidebar = document.querySelector('.asidebar');

    sidebarToggle.addEventListener('click', () => {
        asidebar.classList.toggle('asidebar-hidden');
    });
});
</script>

</body>
</html>
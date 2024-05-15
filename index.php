<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Index</title>

    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/menu.css">
</head>
<body>
    
<header>

      <h1>Gestion Taller Dynos</h1>

      <a  <button  href="Nuevo.html" class="button">Nuevo deposito</button></a>
</header>

<div class="area">

</div><nav class="main-menu">
            <ul>
                <li>
                    <a href="index.php">
                        <i class="fa fa-home fa-2x"></i>
                        <span class="nav-text">
                           Depositos
                        </span>
                    </a>
                  
                </li>
                <li class="has-subnav">
                    <a href="grafica.html">
                        <i class="fa fa-globe fa-2x"></i>
                        <span class="nav-text">
                            Informes
                        </span>
                    </a>
                    
                </li>
                
                <li>
                   <a href="opciones.html">
                       <i class="fa fa-cogs fa-2x"></i>
                        <span class="nav-text">
                           Ajustes
                        </span>
                    </a>
                </li>
               
        </nav>
<div class="container">
    <!-- aqui ira la tabla de donde se imprimen los datos del php -->
    <?php 
    require 'Bd/conn.php';

    
    $estados = [
        1 => 'Pendiente de revisar',
        2 => 'En revision o reparacion',
        3 => 'Terminado, pendiente de recogida',
        4 => 'Pendiente piezas',
        5 => 'En servicio externo',
        6 => 'Pendiente aceptacion presupuesto',
        7 => 'Pendiente RMA',
        8 => 'Abonado',
        9 => 'Entregado'
    ];


    
    $sql = "SELECT clientes.id, clientes.nombre, depositos.fecha_entrada, depositos.datos_deposita, depositos.estado, depositos.codigo_barras
                FROM clientes 
                INNER JOIN depositos ON clientes.id = depositos.id_cliente";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        echo "<table><tr><th>ID</th><th>Nombre</th><th>Fecha de entrada</th><th>Objeto depositado</th><th>Estado de la reparación</th></tr>";
        // output data of each row
        while($row = $result->fetch_assoc()) {
            $estado = isset($estados[$row["estado"]]) ? $estados[$row["estado"]] : 'Desconocido';
           
            echo "<tr><td>" . $row["id"]. "</td><td><a href='depositos.html?codigo_barras=" . $row["codigo_barras"] . "&id=" . $row["id"] . "'>" . $row["nombre"]. "</a></td><td>" . $row["fecha_entrada"]. "</td><td>" . $row["datos_deposita"]. "</td><td>" . $estado . "</td></tr>";
            $row["codigo_barras"] . "'>" . $row["nombre"]. "</a></td><td>" . $row["fecha_entrada"]. "</td><td>" . $row["datos_deposita"]. "</td><td>" . $estado . "</td></tr>";
        }
        echo "</table>";
    } else {
        echo "0 results";
    }
    $conn->close();
    ?>

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
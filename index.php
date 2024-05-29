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
<div class="sidebar">
        <div class="sidebar-title">Menu</div>
        <a href="#deposito" class="sidebar-link">Deposito</a>
        <a href="informes.html" class="sidebar-link">Informes</a>
        <a href="opciones.html" class="sidebar-link">Opciones</a>
    </div>

    <div class="main-content">
        <!-- Existing content of the page -->
        <h1>Gestion Taller Dynos</h1>
        <p><a href="Nuevo.html">Nuevo deposito</a></p>
        <form method="GET" action="">
            <input type="text" id="search" name="barcode" placeholder="buscar">
        </form>
            </form>

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

            if(isset($_GET['barcode'])) {
                $barcode = $_GET['barcode'];
                if(isset($_GET['barcode'])) {
                    $barcode = $_GET['barcode'];
                    $sql .= " WHERE depositos.codigo_barras LIKE '%$barcode%'";                }
            }

            $result = $conn->query($sql);

            if ($result->num_rows > 0) {
                echo "<table><tr><th>ID</th><th>Nombre</th><th>Fecha de entrada</th><th>Objeto depositado</th><th>Estado de la reparación</th></tr>";
                while($row = $result->fetch_assoc()) {
                    $estado = isset($estados[$row["estado"]]) ? $estados[$row["estado"]] : 'Desconocido';
                    echo "<tr><td>" . $row["id"]. "</td><td><a href='depositos.html?codigo_barras=" . $row["codigo_barras"] . "&id=" . $row["id"] . "'>" . $row["nombre"]. "</a></td><td>" . $row["fecha_entrada"]. "</td><td>" . $row["datos_deposita"]. "</td><td>" . $estado . "</td></tr>";
                }
                echo "</table>";
            } else {
                echo "0 results";
            }
            $conn->close();
            ?>

        </div>
    </div>
</body>
</html>

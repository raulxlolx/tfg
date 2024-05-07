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
<button class="sidebar-toggle">Toggle Sidebar</button>
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
    <h1>sads</h1>
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
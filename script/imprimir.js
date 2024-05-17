// recuperamos el codigo de barras y la id de la url y los enviamos a la base de datos con un fetch, 
document.addEventListener("DOMContentLoaded", function() {
    var url = new URL(window.location.href);
    var id = url.searchParams.get("id");
    var codbarras = url.searchParams.get("codigoDeBarras");

    console.log(codbarras);
    console.log(id);


fetch("Bd/getClienteDeposito.php", {
    method: "POST",
    headers: {
        "Content-Type": "application/x-www-form-urlencoded"
    },
    body: "id=" + id + "&codigo_barras=" + codbarras
})
.then(response => {
    if (!response.ok) {
        throw new Error("Hubo un problema al obtener el cliente.");
    }
    return response.json();
})
.then(data =>{
    console.log(data);
    var f_recepcion = document.getElementById("f_recepcion");
    f_recepcion.innerHTML=data.fecha_entrada;
    var nombre = document.getElementById("nombre");
    nombre.innerHTML=data.nombre.toUpperCase();
    var telefono = document.getElementById("contacto");
    telefono.innerHTML=data.telefono;
    var producto = document.getElementById("producto");
    producto.innerHTML=data.datos_deposita.toUpperCase();
    var problema = document.getElementById("problema");
    problema.innerHTML=data.problemas.toUpperCase();
    var solucion = document.getElementById("solucion");
    solucion.innerHTML=data.solucion.toUpperCase();
    
   
});
});

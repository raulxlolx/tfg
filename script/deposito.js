// Iobtener la id de la url y enviarla con un fetch
   var url = new URLSearchParams(location.search);

    var id = url.get("id");
    var codbarras = url.get("codigo_barras");
    console.log(codbarras);
    console.log(id);

    fetch("Bd/getClienteDeposito.php", {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded"
        },
        body: "id=" + id  + "&codigo_barras=" + codbarras

    })
    .then(response => {
        if (!response.ok) {
            throw new Error("Hubo un problema al obtener el cliente.");
        }
        return response.json();
    })
    .then(data => {
        var cliente = data;
        console.log(data);
        var name = document.getElementById("name");
        var id = document.getElementById("idc").value=cliente.id;
        var codigo_barras = document.getElementById("codigo_barras").value=cliente.codigo_barras;
        var id2 = document.getElementById("id");
        id2.innerHTML = cliente.id;
        name.value = cliente.nombre;
        email.value = cliente.email;
        phone.value = cliente.telefono;
        dni.value = cliente.dni;
        Problemas.value = cliente.problemas;
        DatosDeposita.value = cliente.datos_deposita;
        poblacion.value = cliente.poblacion;
        CodigoP.value = cliente.codigo_postal;
        estado.value = cliente.estado;
        Resultado.value = cliente.resultado_reparacion;
        fecha.value = cliente.fecha_entrada;
        fechaR.value = cliente.fecha_retirada;
        Solucion.value = cliente.solucion;
        Empleado.value = cliente.empleado;
        Contraseña.value = cliente.contraseña_so;
        Prioridad.value = cliente.prioridad;

       
    })



    function actualizarbd() {
       
            var form = document.getElementById("Myform");
            var formData = new FormData(form);
            fetch('Bd/editar.php', {
                method: 'POST',
                body: formData
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Hubo un problema al enviar los datos.');
                }
                return response.text();
            })
            .then(data => {
                console.log(data); // Puedes hacer algo con la respuesta del servidor aquí
            })
            .catch(error => {
                console.error('Error:', error);
            });
          
        window.location.href = "index.php";
    }
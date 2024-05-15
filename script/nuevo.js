function  deposito(nombre)
{

    var texarea = document.getElementById('Objeto');
    texarea.value = nombre;
    
}

function enviarDatos( ){
    var form = document.getElementById("myForm");
    var formData = new FormData(form);
    fetch('Bd/nuevo.php', {
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
    window.location.href = 'index.php';
}
function deposito(producto, marca) {
    var contenedor = document.getElementById('botones');
    contenedor.innerHTML = ''; // Eliminar los botones existentes

    if (marca) {
        // Si se ha hecho clic en una marca, mostrar el producto y la marca en el textarea
        document.getElementById('Objeto').value = producto + ' ' + marca;
    } else if (producto === 'PORTATIL') {
        var marcas = ['HP', 'LENOVO', 'ASUS']; // Aquí puedes agregar las marcas de portátiles

        marcas.forEach(function(marca) {
            var boton = document.createElement('button');
            boton.type = 'button';
            boton.className = 'button';
            boton.innerHTML = marca;
            boton.onclick = function() {
                deposito(producto, this.innerHTML);
            };
            contenedor.appendChild(boton);
        });
    }
      else  if (producto==="TORRE"){
            var marcas = ['CLONICA', 'GAMING']; // Aquí puedes agregar las marcas de portátiles

            marcas.forEach(function(marca) {
                var boton = document.createElement('button');
                boton.type = 'button';
                boton.className = 'button';
                boton.innerHTML = marca;
                boton.onclick = function() {
                    deposito(producto, this.innerHTML);
                };
                contenedor.appendChild(boton);
            });
        
    }

    // Aquí puedes agregar más condiciones para otros productos si es necesario

}

window.onload = function() {
    var productos = ['PORTATIL', 'TORRE', 'MOVIL', 'IMPRESORA', 'MONITOR', 'CONSOLA', 'DISCO DURO'];
    var contenedor = document.getElementById('botones');

    productos.forEach(function(producto) {
        var boton = document.createElement('button');
        boton.type = 'button';
        boton.className = 'button';
        boton.innerHTML = producto;
        boton.onclick = function() {
            deposito(this.innerHTML);
        };
        contenedor.appendChild(boton);
    });
};


function nombre(nombre) {
    var nombre = document.getElementById("name").value;
    document.getElementById("nombre_cliente").innerHTML = nombre;

    // Enviar el nombre a través de fetch
    fetch("Bd/search.php", {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded"
        },
        body: "nombre=" + nombre
    })
    .then(response => {
        if (!response.ok) {
            throw new Error("Hubo un problema al enviar el nombre.");
        }
        console.log("Nombre enviado correctamente");
        return response.text();
    })
    .then(data => {
        resultado.innerHTML=data;
    })
    .catch(error => {
        console.error("Error:", error);
    });

   
}


function seleccionarCliente(id) {
    fetch("Bd/getCliente.php", {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded"
        },
        body: "id=" + id
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
         name.value = cliente.nombre;
        email.value = cliente.email;
        phone.value = cliente.telefono;
        nombre(cliente.nombre);
    })
    .catch(error => {
        console.error("Error:", error);
    });
}
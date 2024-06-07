function agregarMarca() {
    const producto = document.getElementById('producto').value;
    const marca = document.getElementById('marca').value;

    if (marca) {
        fetch('Bd/opciones.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ producto, marca })
        })
        .then(response => response.json())
        .then(data => {
            console.log(data.mensaje);
            cargarMarcas();
            document.getElementById('marca').value = ''; // Limpiar el campo de marca
        })
        .catch(error => console.error('Error:', error));
    }
}

function eliminarMarca(producto, marca) {
    fetch('Bd/opciones.php', {
        method: 'DELETE',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ producto, marca })
    })
    .then(response => response.json())
    .then(data => {
        console.log(data.mensaje);
        cargarMarcas();
    })
    .catch(error => console.error('Error:', error));
}

function cargarMarcas() {
    const producto = document.getElementById('producto').value;
    fetch(`Bd/opciones.php?producto=${producto}`)
        .then(response => response.json())
        .then(marcas => {
            const listaMarcas = document.getElementById('lista-marcas');
            listaMarcas.innerHTML = '';
            marcas.forEach(marca => {
                const li = document.createElement('li');
                li.innerHTML = `${marca} <button class="eliminar" onclick="eliminarMarca('${producto}', '${marca}')">Eliminar</button>`;
                listaMarcas.appendChild(li);
            });
        })
        .catch(error => console.error('Error:', error));
}

window.onload = cargarMarcas;
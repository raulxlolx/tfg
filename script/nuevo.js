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
}

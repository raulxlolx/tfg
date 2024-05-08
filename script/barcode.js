   window.addEventListener('load', function() {
            // Obtener la fecha actual
            var fecha = new Date();
            var año = fecha.getFullYear();
            var mes = fecha.getMonth();

            // Generar el resto con número autoincremental
            var numero = Math.floor(Math.random() * 100000) + 1;
            var codigo = año.toString() + mes.toString() + numero.toString();

            // Tamaño personalizado del código de barras
            var options = {
                format: "CODE128",
                displayValue: true,
                width: 2, // Ancho en pixeles
                height: 60, // Altura en pixeles
                fontSize: 12,
                margin: 0
            };

            // Generar código de barras con opciones personalizadas
            JsBarcode("#barcode", codigo, options);

            // Función para imprimir el código de barras
            var codigobarras=document.getElementById("codigo_barras");
            codigobarras.value = codigo;
        });
    function nombre(){
        var nombre = document.getElementById("name").value;
        document.getElementById("nombre_cliente").innerHTML = nombre;
    }
 

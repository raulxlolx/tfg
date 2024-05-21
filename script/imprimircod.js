window.addEventListener('load', function() {
    var url = new URL(window.location.href);
    var codbarras = url.searchParams.get("codigoDeBarras");
    
    var nombrecli = url.searchParams.get("name").toUpperCase();
    console.log(codbarras);

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
    JsBarcode("#barcode", codbarras, options);

    // Función para imprimir el código de barras
    var nombre=document.getElementById("nombrecli");
    nombre.innerHTML = nombrecli;
    var codigobarras=document.getElementById("codigo_barras");
    codigobarras.value = codigo;
});

function enviar(destino) {
    let palavra1 = document.getElementById('palavra1').value;
    let form = document.getElementById('form');
    document.getElementById('inputPalavra').value = palavra1;
    let palavra2 = document.getElementById('palavra2').value;
    document.getElementById('inputPalavra').value = palavra2;
    form.action = destino;
    form.submit();
    console.log(form,palavra1,palavra2)
}

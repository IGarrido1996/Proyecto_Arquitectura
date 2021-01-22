var tipo = ["empresa", "proyecto", "empleado"];
var periodo = ["semanal", "mensual", "anual"];


var selectTipo = document.getElementById("seleccionaTipo");

const fragment = document.createDocumentFragment();


for (i = 0; i < tipo.length; i++) {
    var opt = document.createElement("option");
    opt.setAttribute("value", tipo[i]);
    opt.text = tipo[i];
    selectTipo.appendChild(opt);
}

selectTipo.appendChild(fragment);


var selectPeriodo = document.getElementById("seleccionaPeriodo");

for (i = 0; i < periodo.length; i++) {
    var opt = document.createElement("option");
    opt.setAttribute("value", periodo[i]);
    opt.text = periodo[i];
    selectPeriodo.appendChild(opt);
    console.log("hola");
}

selectPeriodo.appendChild(fragment);


var divTextoInforme = document.getElementById("textoInforme");

var texto = document.createElement("textarea");
texto.readOnly = true;
texto.setAttribute("id", "miInforme");
texto.setAttribute("rows", "10");
texto.setAttribute("cols", "40");
texto.setAttribute("style", "width:180px");

divTextoInforme.appendChild(texto);



function generaInforme() {
    var informe

    var indiceTipo = document.getElementById("seleccionaTipo").selectedIndex;

    var valorTipo = document.getElementById("seleccionaTipo").options[indiceTipo].value;
    informe = "Tipo: " + valorTipo;

    var indicePeriodo = document.getElementById("seleccionaTipo").selectedIndex;
    var valorPeriodo = document.getElementById("seleccionaPeriodo").options[indicePeriodo].value;
    informe += "\n" + "Periodo: " + valorPeriodo;

    var muestra = document.getElementById("miInforme");
    muestra.textContent = informe;
    console.log(informe);
}
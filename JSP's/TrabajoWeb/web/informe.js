
var tipo = ["empresa", "proyecto", "empleado"];
var periodo = ["semanal", "mensual", "anual"];
var nombreInforme = ["Pruebas"];



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

}


selectPeriodo.appendChild(fragment);

var selectNombre = document.getElementById("seleccionaNombre");
for (i = 0; i < nombreInforme.length; i++) {
    var opt = document.createElement("option");
    opt.setAttribute("value", nombreInforme[i]);
    opt.text = nombreInforme[i];
    selectNombre.appendChild(opt);

}
selectNombre.appendChild(fragment);


var divTextoInforme = document.getElementById("textoInforme");

var texto = document.createElement("textarea");
texto.readOnly = true;
texto.setAttribute("id", "miInforme");
texto.setAttribute("rows", "10");
texto.setAttribute("cols", "40");
texto.setAttribute("style", "width:180px");
divTextoInforme.appendChild(texto);






function generaInforme() {

    var informe;

    var indiceTipo = document.getElementById("seleccionaTipo").selectedIndex;

    var valorTipo = document.getElementById("seleccionaTipo").options[indiceTipo].value;
    informe = "Tipo: " + valorTipo;

    var indicePeriodo = document.getElementById("seleccionaTipo").selectedIndex;
    var valorPeriodo = document.getElementById("seleccionaPeriodo").options[indicePeriodo].value;
    informe += "\n" + "Periodo: " + valorPeriodo + "\n";
    informe += "Datos Empleado";
    informe += "\n" + "Nombre: prueba";
    informe += "\n" + "Empresa: circuitos";
    var muestra = document.getElementById("textoInforme");
    muestra.textContent = informe;
    console.log(informe);

}

let meses = ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'];

let fechaActual = new Date();
let diaActual = fechaActual.getDate();
let numeroMes = fechaActual.getMonth();
let añoActual = fechaActual.getFullYear();

let fechas = document.getElementById('dates');
let mes = document.getElementById('month');
let año = document.getElementById('year');

let mesAnterior = document.getElementById('prev-month');
let mesSiguiente = document.getElementById('next-month');

mes.textContent = meses[numeroMes];
año.textContent = añoActual.toString();

mesAnterior.addEventListener('click', () => ultimoMes());
mesSiguiente.addEventListener('click', () => proximoMes());



const escribeMes = (mes) => {

    for (let i = comienzaDia(); i > 0; i--) {
        fechas.innerHTML += ` <div class="calendar__date calendar__item calendar__last-days">
            ${getTotalDias(numeroMes-1)-(i-1)}
        </div>`;
    }

    for (let i = 1; i <= getTotalDias(mes); i++) {
        if (i === diaActual) {
            fechas.innerHTML += ` <div class="calendar__date calendar__item calendar__today">${i}</div>`;
        } else {
            fechas.innerHTML += ` <div class="calendar__date calendar__item">${i}</div>`;
        }
    }
}

const getTotalDias = mes => {
    if (mes === -1) mes = 11;

    if (mes == 0 || mes == 2 || mes == 4 || mes == 6 || mes == 7 || mes == 9 || mes == 11) {
        return 31;

    } else if (mes == 3 || mes == 5 || mes == 8 || mes == 10) {
        return 30;

    } else {

        return esBisiesto() ? 29 : 28;
    }
}

const esBisiesto = () => {
    return ((añoActual % 100 !== 0) && (añoActual % 4 === 0) || (añoActual % 400 === 0));
}

const comienzaDia = () => {
    let start = new Date(añoActual, numeroMes, 1);
    return ((start.getDay() - 1) === -1) ? 6 : start.getDay() - 1;
}

const ultimoMes = () => {
    if (numeroMes !== 0) {
        numeroMes--;
    } else {
        numeroMes = 11;
        añoActual--;
    }

    setNuevaFecha();
}

const proximoMes = () => {
    if (numeroMes !== 11) {
        numeroMes++;
    } else {
        numeroMes = 0;
        añoActual++;
    }

    setNuevaFecha();
}

const setNuevaFecha = () => {
    fechaActual.setFullYear(añoActual, numeroMes, diaActual);
    mes.textContent = meses[numeroMes];
    año.textContent = añoActual.toString();
    fechas.textContent = '';
    escribeMes(numeroMes);
}

escribeMes(numeroMes);



let fechaLabel = document.getElementById('labelFecha');
let textoEvento = document.getElementById("textEvento");

const fecha_evento = document.getElementById('dates');

var anterior = null;

const borra_evento = document.getElementById("dates");

borra_evento.addEventListener('click', (e) => {
    anterior.classList.remove("dia_evento");
})

let diaVariable = document.getElementById('diaVariable');
let mesVariable = document.getElementById('mesVariable');
let añoVariable = document.getElementById('añoVariable');

fecha_evento.addEventListener('click', (e) => {
    console.log(e.target.textContent);

    anterior = e.target;

    e.target.classList.add("dia_evento");

    pie = document.getElementById("labelFecha");
  
    fechaLabel.textContent = "Evento para el " + e.target.textContent + " de " + meses[numeroMes] + " de " + añoActual +"||"+"Evento de la base de datos" +"\n";
	
	diaVariable.setAttribute("value", e.target.textContent);
    mesVariable.setAttribute("value", meses[numeroMes]);
    añoVariable.setAttribute("value", añoActual);

})


//No se generara funcion desde aqui
function enviaEvento() {
    document.getElementById("textEvento") = " ";

}
//Funcion que seleccione los dias de evento

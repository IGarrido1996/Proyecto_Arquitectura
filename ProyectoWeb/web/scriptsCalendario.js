/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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



//document.getElementById('dates').addEventListener("click", creaEvento(this.MouseEvent));

/*
let divEvento = document.getElementById("text_event");
let textEvento = document.createElement("textarea");
textEvento.setAttribute("id", "evento");
textEvento.setAttribute("row", "260");
textEvento.setAttribute("cols", "60");
textEvento.setAttribute("style", "resize:none; text-align:right");
divEvento.appendChild(textEvento);*/


let fechaLabel = document.getElementById('labelFecha');
let textoEvento = document.getElementById("textEvento");

const fecha_evento = document.getElementById('dates');


fecha_evento.addEventListener('click', (e) => {
    console.log(e.target.textContent);
    e.target.classList.add("dia_evento");
    //pie = document.getElementById("text_event");
    pie = document.getElementById("labelFecha");
    //pie.innerHTML += diaActual + " de " + meses[numeroMes] + " de " + añoActual + "\n";
    fechaLabel.textContent = "Evento para el " + e.target.textContent + " de " + meses[numeroMes] + " de " + añoActual + "\n";

})


function enviaEvento() {
    document.getElementById("textEvento") = " ";   //conectarlo con la base de datos
}



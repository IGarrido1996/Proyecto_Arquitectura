<%-- 
    Document   : Informes
    Created on : 22-ene-2021, 19:07:50
    Author     : Michael Villacis
--%>


<%@page import="RegistroDatos.CrearArchivo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="RegistroDatos.CrearArchivo.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Informe</title>
    </head>
    <body>
        <h1>Generador de Informes.</h1>
        

        <form>

            <label> Tipo de informe</label> <br>
            <div id="divTipo">
                <select id="seleccionaTipo">

                </select>

            </div>

            <br>
            <label> Periodo</label> <br>
            <div id="divPeriodo">
                <select id="seleccionaPeriodo">

                </select>

            </div>

            <br>
            <button id="botonInforme" onclick="mostrarPrueba();return false"> Genera Informe</button>

            <br>
            <br>
            <div id="textoInforme"> </div>

        </form>
        <%= CrearArchivo.generartxt(" ")%>
    </body>
    <script>
        var tipo = ["empresa", "proyecto", "empleado"];
        var periodo = ["semanal", "mensual", "anual"];
        var prueba = "Esto es una prueba";
 

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
            
            var informe;

            var indiceTipo = document.getElementById("seleccionaTipo").selectedIndex;

            var valorTipo = document.getElementById("seleccionaTipo").options[indiceTipo].value;
            informe = "Tipo: " + valorTipo;

            var indicePeriodo = document.getElementById("seleccionaTipo").selectedIndex;
            var valorPeriodo = document.getElementById("seleccionaPeriodo").options[indicePeriodo].value;
            informe += "\n" + "Periodo: " + valorPeriodo;

            var muestra = document.getElementById("textoInforme");
            muestra.textContent = informe;
            console.log(informe);
            

            
           
        }
        function generaDatos() {
            var dato;
            dato= "\n"+"Tipo de dato"
            dato="\n"+"Lugar"
            var mostrar = document.getElementById("textoInforme");
            mostrar.textContent = dato;
            console.log(dato);
        }
    </script>

</html>

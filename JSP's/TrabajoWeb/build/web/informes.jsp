<%-- 
    Document   : informes
    Created on : 23-ene-2021, 14:28:32
    Author     : david
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <title>Informe</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="informe.css">
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
        <button id="botonInforme" onclick="generaInforme()"> Genera Informe</button>

        <br>
        <div id="textoInforme"> </div>

    </form>

    <script type="text/javascript" src="informe.js"></script>

</body>

</html>

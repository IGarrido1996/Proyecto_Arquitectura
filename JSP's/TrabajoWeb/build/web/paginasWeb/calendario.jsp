<%-- 
    Document   : calendario
    Created on : 22-ene-2021, 20:46:55
    Author     : david
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!doctype html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="../css/styles.css">

    <title>Calendario Laboral</title>
</head>
    <h1 class="title">Calendario Laboral</h1>

    <div class="calendar">
        <div class="calendar__info">
            <div class="calendar__prev" id="prev-month">&#9664;</div>
            <div class="calendar__month" id="month"></div>
            <div class="calendar__year" id="year"></div>
            <div class="calendar__next" id="next-month">&#9654;</div>
        </div>

        <div class="calendar__week">
            <div class="calendar__day calendar__item">Lun</div>
            <div class="calendar__day calendar__item">Mar</div>
            <div class="calendar__day calendar__item">Mie</div>
            <div class="calendar__day calendar__item">Jue</div>
            <div class="calendar__day calendar__item">Vie</div>
            <div class="calendar__day calendar__item">Sab</div>
            <div class="calendar__day calendar__item">Dom</div>
        </div>

        <div class="calendar__dates" id="dates">

        </div>
    </div>

    <br>
    <div class="calendar_event" id="text_event">
        <form id="formEvento">
            <label id="labelFecha"></label><br>
            <input type="textarea" id="textEvento"><br>
            <input type="submit" value="Enviar" onclick="enviaEvento()">
        </form>

    </div>

    <script src="../js/scripts.js"></script>


</html>
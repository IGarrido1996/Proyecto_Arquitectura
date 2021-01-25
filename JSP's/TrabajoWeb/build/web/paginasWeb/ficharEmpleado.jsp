<%-- 
    Document   : ficharEmpleado
    Created on : 22-ene-2021, 20:17:33
    Author     : david
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>
           Pagina registro de horas trabajadores
        </title> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
         <!-- CSS -->
        <link rel="stylesheet" type="text/css" href="../css/plantilla.css" media="screen" /> 
        
        <!--JavaScript-->
        <script src="funciones.js"></script>

        <!-- Titulos -->
        <header> 
          <div class="title">Portal de Informes</div>
        </header> 

        <!-- Barra del menu -->
        <div class="menu"> 
            <a href="inicioEmpleados.jsp">INICIO</a> 
            <a href="calendario.jsp">CALENDARIO</a> 
            <a href="../operaciones/peticiones.jsp">PETICIONES</a>
            <a href="ficharEmpleado.jsp">FICHAR</a> 
        </div> 
        <a href="../controladores/fichar.jsp" class="boton">Fichar entrada</a>
        <br>
        <br>
        <a href="../controladores/ficharSalida.jsp" class="boton">Fichar salida</a>
    </body>
</html>


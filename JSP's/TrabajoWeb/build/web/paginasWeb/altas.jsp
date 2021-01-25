<%-- 
    Document   : altas
    Created on : 15-ene-2021, 14:06:17
    Author     : david
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Página principal de Altas</title>
    </head>
    <body>
        <!-- CSS -->
        <link rel="stylesheet" type="text/css" href="../css/plantilla.css" media="screen" /> 
        
        <!--JavaScript-->
        <script src="funciones.js"></script>

        <!-- Titulos -->
        <header> 
          <div class="title">Portal de RRHH</div>
        </header> 

        <!-- Barra del menu -->
        <div class="menu"> 
            <a href="inicioRRHH.jsp">INICIO</a> 
            <a href="calendario.jsp">CALENDARIO</a> 
            <a href="altas.jsp">ALTAS</a> 
            <a href="peticionesRRHH.jsp">PETICIONES</a>
            <a href="../informes.jsp">INFORMES</a>   
        </div> 

        <div> <a href="../operaciones/agregarEmpresa.jsp">Altas Empresas</a> </div> 
        <div> <a href="../operaciones/AgregarProyecto.jsp">Altas Proyectos</a> </div> 
        <div> <a href="../operaciones/Agregar.jsp">Altas Trabajador</a> </div> 

    </body>
</html>

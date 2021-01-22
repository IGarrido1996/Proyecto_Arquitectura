<%-- 
    Document   : peticionesRRHH
    Created on : 15-ene-2021, 13:45:43
    Author     : david
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página de recepción y validación de peticiones de RRHH</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">

    </head>
    <body>
        <!-- CSS -->
        <link rel="stylesheet" type="text/css" href="plantilla.css" media="screen" /> 
        <!-- Titulos -->
        <header> 
          <div class="title">Portal de RRHH</div>
        </header> 

        <!-- Barra del menu -->
        <div class="menu"> 
            <a href="inicioRRHH.jsp">INICIO</a> 
            <a href="calendario.html">CALENDARIO</a> 
            <a href="altas.jsp">ALTAS</a> 
            <a href="peticionesRRHH.jsp">PETICIONES</a>
            <a href="informes.html">INFORMES</a> 
        </div>
        <%
            Connection con;
            String url="jdbc:mysql://localhost:3306/arquitecturaweb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
            String driver="com.mysql.jdbc.Driver";
            String user="root";
            String pass="contraseña";
            Class.forName(driver);
            con=DriverManager.getConnection(url,user,pass);
            PreparedStatement ps;
            ResultSet rs;
            %>
        <div class="container">
                <h1>Peticiones</h1>
                <br>
                <table class="table table-bordered">
                    <tr>
                    <th class="text-center">Código de la petición</th>
                    <th class="text-center">Fecha</th>
                    <th class="text-center">Categoria</th>
                    <th class="text-center">Texto</th>
                    <th class="text-center">Estado</th>
                    <th class="text-center">Acciones</th>
                </tr>
            <%
                ps=con.prepareStatement("select * from peticiones");
                rs=ps.executeQuery();
                while(rs.next()){
            %>
            
                    <tr>
                        <td class="text-center"><%= rs.getString("peticionesID")%></td>
                        <td class="text-center"><%= rs.getString("fecha")%></td>
                        <td class="text-center"><%= rs.getString("categoria")%></td>
                        <td class="text-center"><%= rs.getString("texto")%></td>
                        <td class="text-center"><%= rs.getString("estado")%></td>
                        <td class="text-center">
                        <a href="editarPeticion.jsp?peticionesID=<%= rs.getString("peticionesID")%>" class="btn btn-warning btn-sm">Editar</a>
                        <a href="eliminarPeticion.jsp?peticionesID=<%= rs.getString("peticionesID")%>" class="btn btn-danger btn-sm">Borrar</a>
                        </td>
                    </tr>
                    <%}%>
                </table>
            </div>
    </body>
</html>

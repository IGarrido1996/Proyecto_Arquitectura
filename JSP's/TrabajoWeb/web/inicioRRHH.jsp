<%-- 
    Document   : inicioRRHH
    Created on : 12-ene-2021, 19:38:06
    Author     : david
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title></title>
    </head>
    <body>
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
            
            ps=con.prepareStatement("select * from trabajadores");
            rs=ps.executeQuery();
        %>
            <div class="container">
            <h1>Trabajadores</h1>
            <hr>
            <a class="btn btn-success btn-lg" href="Agregar.jsp">Nuevo trabajador</a>
            <br>
            <br>
            <table class="table table-bordered">
                <tr>
                    <th class="text-center">Name</th>
                    <th class="text-center">TrabajadorID</th>
                    <th class="text-center">Usuario</th>
                    <th class="text-center">Hora inicio</th>
                    <th class="text-center">Hora fin</th>
                    <th class="text-center">Horas totales</th>
                    <th class="text-center">PeticionesID</th>
                    <th class="text-center">Acciones</th>
                </tr>
                <%
                    while(rs.next()){
                %>
                <tr>
                    <td class="text-center"><%= rs.getString("name")%></td>
                    <td class="text-center"><%= rs.getString("trabajadorID")%></td>
                    <td class="text-center"><%= rs.getString("usuario")%></td>
                    <td class="text-center"><%= rs.getString("horaInicio")%></td>
                    <td class="text-center"><%= rs.getString("horaFin")%></td>
                    <td class="text-center"><%= rs.getInt("horasTotales")%></td>
                    <td class="text-center"><%= rs.getString("peticionesID")%></td>
                    <td class="text-center">
                    <a href="editar.jsp?trabajadorID=<%= rs.getString("trabajadorID")%>" class="btn btn-warning btn-sm">Editar</a>
                    <a href="eliminar.jsp?trabajadorID=<%= rs.getString("trabajadorID")%>" class="btn btn-danger btn-sm">Borrar</a>
                    </td>
                </tr>
                <%}%>
            </table>
        </div>
            <div class="container">
            <h1>Empresas</h1>
            <hr>
            <a class="btn btn-success btn-lg" href="agregarEmpresa.jsp">Nueva empresa</a>
            <br>
            <br>
            <table class="table table-bordered">
                <tr>
                    <th class="text-center">Name</th>
                    <th class="text-center">EmpresaID</th>
                    <th class="text-center">Acciones</th>
                </tr>
                <%
                    ps=con.prepareStatement("select * from empresa");
                    rs=ps.executeQuery();
                    while(rs.next()){
                %>
                <tr>
                    <td class="text-center"><%= rs.getString("name")%></td>
                    <td class="text-center"><%= rs.getString("empresaID")%></td>
                    <td class="text-center">
                    <a href="editarEmpresa.jsp?empresaID=<%= rs.getString("empresaID")%>" class="btn btn-warning btn-sm">Editar</a>
                    <a href="eliminarEmpresa.jsp?empresaID=<%= rs.getString("empresaID")%>" class="btn btn-danger btn-sm">Borrar</a>
                    </td>
                </tr>
                <%}%>
            </table>
        </div>
            <div class="container">
            <h1>Proyectos</h1>
            <hr>
            <a class="btn btn-success btn-lg" href="AgregarProyecto.jsp">Nuevo proyecto</a>
            <br>
            <br>
            <table class="table table-bordered">
                <tr>
                    <th class="text-center">Name</th>
                    <th class="text-center">ProyectoID</th>
                    <th class="text-center">EmpresaID</th>
                    <th class="text-center">Acciones</th>
                </tr>
                <%
                    ps=con.prepareStatement("select * from proyecto");
                    rs=ps.executeQuery();
                    while(rs.next()){
                %>
                <tr>
                    <td class="text-center"><%= rs.getString("name")%></td>
                    <td class="text-center"><%= rs.getString("proyectoID")%></td>
                    <td class="text-center"><%= rs.getString("empresaID")%></td>
                    <td class="text-center">
                    <a href="editarProyecto.jsp?proyectoID=<%= rs.getString("proyectoID")%>" class="btn btn-warning btn-sm">Editar</a>
                    <a href="eliminarProyecto.jsp?proyectoID=<%= rs.getString("proyectoID")%>" class="btn btn-danger btn-sm">Borrar</a>
                    </td>
                </tr>
                <%}%>
            </table>
        </div>
    </body>
</html>


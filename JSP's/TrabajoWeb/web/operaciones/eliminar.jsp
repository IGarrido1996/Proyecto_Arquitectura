<%-- 
    Document   : eliminar
    Created on : 10-ene-2021, 18:57:54
    Author     : david
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

        String trabajadorID=request.getParameter("trabajadorID");
        ps=con.prepareStatement("delete from trabajadores where trabajadorID="+trabajadorID);
        ps.executeUpdate();
        ps=con.prepareStatement("delete from proyectoTrabajadores where trabajadorID="+trabajadorID);
        ps.executeUpdate();
        ps=con.prepareStatement("delete from peticionesTrabajadores where trabajadorID="+trabajadorID);
        ps.executeUpdate();
        ps=con.prepareStatement("delete from horasProyectoTrabajador where trabajadorID="+trabajadorID);
        ps.executeUpdate();
        response.sendRedirect("../paginasWeb/inicioRRHH.jsp");
        %>
    </body>
</html>

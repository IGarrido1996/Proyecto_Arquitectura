<%-- 
    Document   : eliminarPeticion
    Created on : 14-ene-2021, 19:05:14
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

        String peticionesID=request.getParameter("peticionesID");
        ps=con.prepareStatement("delete from peticiones where peticionesID="+peticionesID);
        ps.executeUpdate();
        ps=con.prepareStatement("delete from peticionesTrabajadores where peticionesID="+peticionesID);
        ps.executeUpdate();
        response.sendRedirect("../paginasWeb/inicioRRHH.jsp");
        %>
    </body>
</html>

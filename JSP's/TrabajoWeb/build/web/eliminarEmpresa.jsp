<%-- 
    Document   : eliminarEmpresa
    Created on : 11-ene-2021, 22:47:42
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

        String empresaID=request.getParameter("empresaID");
        ps=con.prepareStatement("delete from empresa where empresaID="+empresaID);
        ps.executeUpdate();
        response.sendRedirect("inicioRRHH.jsp");
        %>
    </body>
</html>

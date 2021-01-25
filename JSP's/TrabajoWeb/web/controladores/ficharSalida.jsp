<%-- 
    Document   : ficharSalida
    Created on : 16-ene-2021, 16:13:29
    Author     : david
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
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
        int rs;
        
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS"); 
        Calendar cal = Calendar.getInstance(); 
        java.sql.Timestamp timestamp = new java.sql.Timestamp(cal.getTimeInMillis());
        
        String usuario=(String) request.getSession().getAttribute("usuario");        
        ps=con.prepareStatement("UPDATE trabajadores SET horaFin='"+timestamp+"' WHERE trabajadores.usuario='"+usuario+"'");
        rs=ps.executeUpdate();
        response.sendRedirect("../paginasWeb/inicioEmpleados.jsp");
        %>
    </body>
</html>

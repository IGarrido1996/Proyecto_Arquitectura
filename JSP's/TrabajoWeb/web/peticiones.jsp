<%-- 
    Document   : peticiones
    Created on : 13-ene-2021, 17:50:47
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
            String usuario=(String) request.getSession().getAttribute("usuario"); 
            ps=con.prepareStatement("select * from peticiones inner join ");
            rs=ps.executeQuery();
        %>
    </body>
</html>

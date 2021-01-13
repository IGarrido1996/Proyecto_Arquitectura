<%-- 
    Document   : index
    Created on : 09-ene-2021, 22:45:49
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
        ps=con.prepareStatement("select * from usuarios");
        rs=ps.executeQuery();
        %>
        <div class="container">
            <h1>Introduzca usuario y contraseña</h1>
            <hr>
            <form action="validarUsuario.jsp" method="GET" class="form-control" style="width: 400px; height: 250px">
                Usuario:
                <input type="text" name="txtusuario" class="form-control"/>
                Contraseña:
                <input type="password" name="txtcontraseña" class="form-control"/>
                <br>
                <br>
                
                    <input type="submit" value="Iniciar sesión" name="botonInicio"/>                 
                    <br>
                    <br>
            </form>
        </div>
    </body>
</html>

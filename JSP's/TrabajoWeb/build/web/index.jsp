<%-- 
    Document   : index
    Created on : 09-ene-2021, 22:45:49
    Author     : david
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <div align="center"><img src="css/logo.png" alt=""></div>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <!-- CSS -->
        <link rel="stylesheet" type="text/css" href="css/plantilla.css" media="screen" />
        <header> 
            <div class="title">Inicio de Sesión</div>
        </header>
        <%
        Connection con;
        String url="jdbc:mysql://localhost:3306/arquitecturaweb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
        String driver="com.mysql.jdbc.Driver";
        String user="root";
        String pass="Mvplovemylive007";
        Class.forName(driver);
        con=DriverManager.getConnection(url,user,pass);
        
        PreparedStatement ps;
        ResultSet rs;
        ps=con.prepareStatement("select * from usuarios");
        rs=ps.executeQuery();
        %>
        <div class="contenido"> 
            <form action="controladores/validarUsuario.jsp" method="GET" name="miniformualario"> 
                <button class="restablecer" type="reset">Restablecer campos</button><br>
                <label for="nombre">Nombre de usuario:</label><br><br>
                <input type="text" id="nombre" class="casilla" name="txtusuario" required><br><br>
                <label for="pwd">Contraseña:</label><br><br>
                <input type="password" id="pwd" class="casilla" name="txtcontraseña" required><br><br> 
                <button type="submit" class="boton">Iniciar sesión</button>
            </form>
        </div>
    </body>
</html>

<%-- 
    Document   : AgregarProyecto
    Created on : 11-ene-2021, 22:15:08
    Author     : david
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <h1>Agregar usuario</h1>
            <hr>
            <form action="" method="post" class="form-control" style="width: 500px; height: 400px">
                Nombre:
                <input type="text" name="txtnombre" class="form-control"/>
                ProyectoID:
                <input type="text" name="txtproyectoID" class="form-control"/>
                EmpresaID:
                <input type="text" name="txtempresaID" class="form-control"/>
                <br>
                <br>
                <input type="submit" value="Guardar" class="btn btn-primary btn-lg" onclick="javascript:history.back()"/>
                <br>
                <a href="inicioRRHH.jsp"> Volver Atrás</a>
            </form>
        </div>
        
    </body>
</html>
<%
        Connection con;
        String url="jdbc:mysql://localhost:3306/arquitecturaweb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
        String driver="com.mysql.jdbc.Driver";
        String user="root";
        String pass="contraseña";
        Class.forName(driver);
        con=DriverManager.getConnection(url,user,pass);
        
        PreparedStatement ps;
        String name,proyectoID,empresaID;
        name=request.getParameter("txtnombre");
        proyectoID=request.getParameter("txtproyectoID");
        empresaID=request.getParameter("txtempresaID");

        if(name!=null && proyectoID!=null && empresaID!=null){
            ps=con.prepareStatement("insert into proyecto(name,proyectoID,empresaID) values ('"+name+"','"+proyectoID+"','"+empresaID+"')");
            ps.executeUpdate();
            response.sendRedirect("inicioRRHH.jsp");
        }       
%>

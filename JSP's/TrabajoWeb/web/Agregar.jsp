<%-- 
    Document   : Agregar
    Created on : 10-ene-2021, 0:18:01
    Author     : david
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
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
                TrabajadorID:
                <input type="text" name="txttrabajadorID" class="form-control"/>
                Usuario:
                <input type="text" name="txtusuario" class="form-control"/>
                Hora inicio:
                <input type="text" name="txthorainicio" class="form-control"/>
                PeticionesID:
                <input type="text" name="txtpeticionesID" class="form-control"/>
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
        String name,trabajadorID,usuario,proyectoID,peticionesID,horainicio;
        name=request.getParameter("txtnombre");
        trabajadorID=request.getParameter("txttrabajadorID");
        usuario=request.getParameter("txtusuario");
        peticionesID=request.getParameter("txtpeticionesID");
        horainicio=request.getParameter("txthorainicio");
        
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS"); 
        String text = String.valueOf(horainicio);
        //Calendar cal = Calendar.getInstance(); 
        //java.sql.Timestamp timestamp = new java.sql.Timestamp(cal.getTimeInMillis());
        
        //java.util.Date date2 = dateFormat.parse(text);
        //java.sql.Timestamp ts = new Timestamp(date2.getTime());

        if(name!=null && trabajadorID!=null){
            java.util.Date date2 = dateFormat.parse(text);
            java.sql.Timestamp ts = new Timestamp(date2.getTime());
            ps=con.prepareStatement("insert into trabajadores(name,trabajadorID,usuario,horaInicio,horaFin,horasTotales,peticionesID) values ('"+name+"','"+trabajadorID+"','"+usuario+"','"+ts+"',"+null+","+null+","+null+")");
            ps.executeUpdate();
            response.sendRedirect("inicioRRHH.jsp");
        }       
%>
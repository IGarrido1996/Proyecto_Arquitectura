<%-- 
    Document   : editar
    Created on : 10-ene-2021, 18:55:40
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
        String trabajadorID=request.getParameter("trabajadorID");
        ps=con.prepareStatement("select * from trabajadores where trabajadorID="+trabajadorID);
        rs=ps.executeQuery();
        while(rs.next()){
        %>
        <div class="container">
            <h1>Modificar trabajador</h1>
            <hr>
            <form action="" method="post" class="form-control" style="width: 500px; height: 400px">
                Nombre:
                <input type="text" name="txtnombre" class="form-control" value="<%=rs.getString("name")%>"/>
                TrabajadorID:
                <input type="text" readonly="" class="form-control" value="<%=rs.getString("trabajadorID")%>"/>
                Usuario:
                <input type="text" readonly="" class="form-control" value="<%=rs.getString("usuario")%>"/>
                Hora inicio:
                <input type="text" name="txthorainicio" class="form-control" value="<%=rs.getString("horaInicio")%>"/>
                Hora fin:
                <input type="text" name="txthorafin" class="form-control" value="<%=rs.getString("horaFin")%>"/>
                Horas totales:
                <input type="text" name="txthorastotales" class="form-control" value="<%=rs.getString("horasTotales")%>"/>
                PeticionesID:
                <input type="text" name="txtpeticionesID" class="form-control" value="<%=rs.getString("peticionesID")%>"/>
                <br>
                <br>
                <input type="submit" value="Guardar" class="btn btn-primary btn-lg" onclick="javascript:history.back()"/>
                <br>
                <a href="inicioRRHH.jsp"> Volver Atrás</a>
            </form>
            <%}%>
        </div>
    </body>
</html>
<%
        String name,peticionesID,horasTotales;
        name=request.getParameter("txtnombre");
        peticionesID=request.getParameter("txtpeticionesID");
        horasTotales=request.getParameter("txthorastotales");
        
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS"); 
        Calendar cal = Calendar.getInstance(); 
        java.sql.Timestamp timestamp = new java.sql.Timestamp(cal.getTimeInMillis());

        
        if(name!=null){
            ps=con.prepareStatement("update trabajadores set name='"+name+"',horaInicio='"+timestamp+"',horaFin='"+timestamp+"',horasTotales='"+horasTotales+"',peticionesID="+null+" where trabajadorID="+trabajadorID);
            ps.executeUpdate();
            response.sendRedirect("inicioRRHH.jsp");
        }   
%>

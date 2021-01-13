<%-- 
    Document   : editarProyecto
    Created on : 11-ene-2021, 22:59:22
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
        String proyectoID=request.getParameter("proyectoID");
        ps=con.prepareStatement("select * from proyecto where proyectoID="+proyectoID);
        rs=ps.executeQuery();
        while(rs.next()){
        %>
        <div class="container">
            <h1>Modificar proyecto</h1>
            <hr>
            <form action="" method="post" class="form-control" style="width: 500px; height: 400px">
                Nombre:
                <input type="text" name="txtnombre" class="form-control" value="<%=rs.getString("name")%>"/>
                ProyectoID:
                <input type="text" readonly="" class="form-control" value="<%=rs.getString("proyectoID")%>"/>
                EmpresaID:
                <input type="text" name="txtempresaID" class="form-control" value="<%=rs.getString("empresaID")%>"/>
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
        String name,empresaID;
        name=request.getParameter("txtnombre");
        empresaID=request.getParameter("txtempresaID");
        
        if(name!=null && empresaID!=null && proyectoID!=null){
            ps=con.prepareStatement("update proyecto set name='"+name+"',empresaID='"+empresaID+"' where proyectoID="+proyectoID);
            ps.executeUpdate();
            response.sendRedirect("inicioRRHH.jsp");
        }   
%>

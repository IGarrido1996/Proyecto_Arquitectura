<%-- 
    Document   : editarEmpresa
    Created on : 11-ene-2021, 22:59:32
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
        String usuario=request.getParameter("txtusuario");
        String contraseña=request.getParameter("txtcontraseña");
        System.out.println(usuario);
        System.out.println(contraseña);
        PreparedStatement ps;
        ResultSet rs;
        String empresaID=request.getParameter("empresaID");
        ps=con.prepareStatement("select * from empresa where empresaID="+empresaID);
        rs=ps.executeQuery();
        while(rs.next()){
        %>
        <div class="container">
            
            <h1>Modificar empresa</h1>
            <hr>
            <form action="" method="post" class="form-control" style="width: 500px; height: 400px">
                Nombre:
                <input type="text" name="txtnombre" class="form-control" value="<%=rs.getString("name")%>"/>
                EmpresaID:
                <input type="text" readonly="" class="form-control" value="<%=rs.getString("empresaID")%>"/>
                <br>
                <br>
                <input type="submit" value="Guardar" class="btn btn-primary btn-lg"/>
                <br>
                <a href="inicioRRHH.jsp"> Volver Atrás</a>
            </form>
            <%}%>
        </div>
    </body>
</html>
<%
        String name;
        name=request.getParameter("txtnombre");
        
        if(name!=null && empresaID!=null){
            ps=con.prepareStatement("update empresa set name='"+name+"' where empresaID="+empresaID);
            ps.executeUpdate();
            response.sendRedirect("inicioRRHH.jsp");
        }   
%>


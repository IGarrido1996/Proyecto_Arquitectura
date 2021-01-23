<%-- 
    Document   : editarEmpresa
    Created on : 11-ene-2021, 22:59:32
    Author     : david
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>
            Página para editar una empresa
        </title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body>
        <!-- CSS -->
        <link rel="stylesheet" type="text/css" href="plantilla.css" media="screen" />
        <!-- Titulos -->
        <header> 
          <div class="title">Portal de empresas</div>
        </header> 
        <!-- Barra del menu -->
        <div class="menu"> 
            <a href="inicioRRHH.jsp">INICIO</a> 
            <a href="calendario.html">CALENDARIO</a> 
            <a href="altas.jsp">ALTAS</a> 
            <a href="peticionesRRHH.jsp">PETICIONES</a>
            <a href="informes.jsp">INFORMES</a>
        </div>
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

        PreparedStatement ps;
        ResultSet rs;
        String empresaID=request.getParameter("empresaID");
        ps=con.prepareStatement("select * from empresa where empresaID="+empresaID);
        rs=ps.executeQuery();
        while(rs.next()){
        %>
        <div class="cardMedio">
            <form action="" method="post">
                <h2>Modificar Empresa</h2>
                <label>Nombre de la empresa:</label><br><br>
                <input type="text" value="<%=rs.getString("name")%>" id="nombre" class="casilla" name="txtnombre" required maxlength="15" pattern="[A-Za-z0-9]+"><br><br>
                <label>Código de la empresa del proyecto:</label><br><br>
                <input type="text" readonly="" value="<%=rs.getString("empresaID")%>" id="codigoEmpresa" class="casilla" name="txtempresaID" required min = "1" max = "1000000" pattern="[0-9]+"><br><br>
                <button onsubmit class="button">Modificar Proyecto</button>
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


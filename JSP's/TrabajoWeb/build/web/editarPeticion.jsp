<%-- 
    Document   : editarPeticion
    Created on : 14-ene-2021, 19:04:51
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
        String peticionesID=request.getParameter("peticionesID");
        ps=con.prepareStatement("select * from peticiones where peticionesID="+peticionesID);
        rs=ps.executeQuery();
        while(rs.next()){
        %>
        <div class="cardMedio">
            <form action="" method="post">
                <h2>Modificar Peticiones</h2>
                <label>Código de la petición:</label><br><br>
                <input type="text" readonly="" value="<%=rs.getString("peticionesID")%>" id="peticionesID" class="casilla" name="txtpeticionesID" required min = "1" max = "1000000" pattern="[0-9]+"><br><br>
                <label>Fecha:</label><br><br>
                <input type="text" readonly="" value="<%=rs.getString("fecha")%>" id="fecha" class="casilla" name="txtfecha" required maxlength="15"><br><br>
                <label>Categoría:</label><br><br>
                <input type="text" readonly="" value="<%=rs.getString("categoria")%>" id="categoria" class="casilla" name="txtcategoria" required maxlength="15"><br><br>
                <label>Motivo:</label><br><br>
                <input type="text" readonly="" value="<%=rs.getString("texto")%>" id="motivo" class="casilla" name="txtmotivo" required maxlength="15" pattern="[A-Za-z0-9]+"><br><br>
                <label>Estado:</label><br><br>
                <input type="text" value="<%=rs.getString("estado")%>" id="estado" class="casilla" name="txtestado" required maxlength="15" pattern="[A-Za-z0-9]+"><br><br>
                <button onsubmit class="button">Modificar Petición</button>
            </form>
        <%}%>
        </div>
    </body>
</html>
<%
        String categoria,estado;
        categoria=request.getParameter("txtcategoria");
        estado=request.getParameter("txtestado");
        
        if(categoria!=null && estado!=null){
            ps=con.prepareStatement("update peticiones set estado='"+estado+"' where peticionesID="+peticionesID);
            ps.executeUpdate();
            response.sendRedirect("inicioRRHH.jsp");
        }   
%>
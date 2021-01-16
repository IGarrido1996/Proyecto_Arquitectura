<%-- 
    Document   : editarProyecto
    Created on : 11-ene-2021, 22:59:22
    Author     : david
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>
            Página para editar un proyecto
        </title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <!-- CSS -->
        <link rel="stylesheet" type="text/css" href="plantilla.css" media="screen" />
        <!-- Titulos -->
        <header> 
          <div class="title">Portal de proyectos</div>
        </header> 
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
        <div class="cardMedio">
            <form action="" method="post">
                <h2>Modificar Proyecto</h2>
                <label>Nombre del proyecto:</label><br><br>
                <input type="text" value="<%=rs.getString("name")%>" id="nombre" class="casilla" name="txtnombre" required maxlength="15" pattern="[A-Za-z][a-z]+[0-9]*"><br><br>
                <label>Código del proyecto:</label><br><br>
                <input type="text" readonly="" value="<%=rs.getString("proyectoID")%>" id="codigo" class="casilla" name="txtproyectoID" required min = "1" max = "1000000" pattern="[0-9]+"><br><br>
                <label>Código de la empresa del proyecto:</label><br><br>
                <input type="text" value="<%=rs.getString("empresaID")%>" id="codigoEmpresa" class="casilla" name="txtempresaID" required min = "1" max = "1000000" pattern="[0-9]+"><br><br>
                <button onsubmit class="button">Modificar Proyecto</button>
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

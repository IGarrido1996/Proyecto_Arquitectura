<%-- 
    Document   : AgregarProyecto
    Created on : 11-ene-2021, 22:15:08
    Author     : david
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>
           Pagina para dar de alta un proyecto
        </title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="plantilla.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <!-- CSS -->
        <link rel="stylesheet" type="text/css" href="plantilla.css" media="screen" />
        <!-- Titulos -->
        <header> 
          <div class="title">Portal de Informes</div>
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
            PreparedStatement ps;
            ResultSet rs;
            ArrayList<Integer> identificadores = new ArrayList<Integer>();
            ps=con.prepareStatement("select proyectoID from proyecto");
            rs=ps.executeQuery();
            while(rs.next()){
                identificadores.add(Integer.parseInt(rs.getString("proyectoID")));
            }
        %>
        <div class="card"> En esta página podrás dar de alta a Empresas</div> 
        <div class="cardMedio">
        <form action="AgregarProyecto.jsp" method="post">
            <button class="restablecer" type="reset">Restablecer campos</button><br>
            <h2>Escriba los campos del proyecto</h2>
            <label>Nombre del proyecto:</label><br><br>
            <input type="text" id="nombre" class="casilla" name="txtnombre" required maxlength="15" pattern="[A-Za-z0-9]+"><br><br>
            <label>Código de la empresa del proyecto:</label><br><br>
            <input type="text" id="codigoEmpresa" class="casilla" name="txtempresaID" required min = "1" max = "1000000" pattern="[0-9]+"><br><br>
            <button onsubmit class="button">Añadir Proyecto</button>

        </form>
        </div>                
    </body>
</html>
<%
        String name,empresaID;
        name=request.getParameter("txtnombre");
        empresaID=request.getParameter("txtempresaID");
        int proyectoID=1;
        while(identificadores.contains(proyectoID)){
            proyectoID++;
        }

        if(name!=null && empresaID!=null){
            ps=con.prepareStatement("insert into proyecto(name,proyectoID,empresaID) values ('"+name+"','"+proyectoID+"','"+empresaID+"')");
            ps.executeUpdate();
            response.sendRedirect("inicioRRHH.jsp");
        }       
%>

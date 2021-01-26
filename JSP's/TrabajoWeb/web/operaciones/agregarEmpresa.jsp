<%-- 
    Document   : agregarEmpresa
    Created on : 11-ene-2021, 22:41:21
    Author     : david
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <div align="center"><img src="../css/logo.png" alt=""></div>
        <title>
           Pagina para dar de alta a una empresa
        </title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="plantilla.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <!-- CSS -->
        <link rel="stylesheet" type="text/css" href="../css/plantilla.css" media="screen" /> 
        <!-- Titulos -->
        <header> 
          <div class="title">Portal de Altas</div>
        </header> 
        <div class="menu"> 
            <a href="../paginasWeb/inicioRRHH.jsp">INICIO</a> 
            <a href="../paginasWeb/calendario.jsp">CALENDARIO</a> 
            <a href="../paginasWeb/altas.jsp">ALTAS</a> 
            <a href="../paginasWeb/peticionesRRHH.jsp">PETICIONES</a>
            <a href="../informes.jsp">INFORMES</a>   
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
            ps=con.prepareStatement("select empresaID from empresa");
            rs=ps.executeQuery();
            while(rs.next()){
                identificadores.add(Integer.parseInt(rs.getString("empresaID")));
            }
        %>
        <div class="card"> En esta página podrás dar de alta a Empresas</div> 
        <div class="cardMedio">
        <form action="" method="post">
            <button class="restablecer" type="reset">Restablecer campos</button><br>
            <h2>Escriba los campos de la Empresa</h2>
            <label>Nombre de la Empresa:</label><br><br>
            <input type="text" id="nombre" class="casilla" name="txtnombre" required  maxlength="15" pattern="[A-Za-z0-9]+"><br><br>
            <button onsubmit class="button">Añadir Empresa</button>
        </form>
        </div>
        
    </body>
</html>
<%
        
        String name;
        name=request.getParameter("txtnombre");
        int empresaID=1;
        while(identificadores.contains(empresaID)){
            empresaID++;
        }
        
        if(name!=null){
            ps=con.prepareStatement("insert into empresa(name,empresaID) values ('"+name+"','"+empresaID+"')");
            ps.executeUpdate();
            response.sendRedirect("../paginasWeb/inicioRRHH.jsp");
        }       
%>


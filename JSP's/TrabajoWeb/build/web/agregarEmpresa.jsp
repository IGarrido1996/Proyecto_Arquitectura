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
        <title>
           Pagina para dar de alta a una empresa
        </title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title></title>
    </head>
    <body>
        <!-- CSS -->
        <link rel="stylesheet" type="text/css" href="plantilla.css" media="screen" /> 
        <!-- Titulos -->
        <header> 
          <div class="title">Portal de Informes</div>
        </header> 
        <div class="menu"> 
            <a href="inicioRRHH.jsp">INICIO</a> 
            <a href="calendario.html">CALENDARIO</a> 
            <a href="altas.html">ALTAS</a> 
            <a href="peticionesRRHH.jsp">PETICIONES</a>
            <a href="informes.html">INFORMES</a>   
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
            <input type="text" id="nombre" class="casilla" name="txtnombre" required  maxlength="15" pattern="[A-Z][a-z]+(\s[A-Za-z]+)*"><br><br>
            <button onsubmit class="button">Añadir Empresa</button>
            <a href="altas.jsp"> Volver Atrás</a>
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
            response.sendRedirect("inicioRRHH.jsp");
        }       
%>

<%-- 
    Document   : Agregar
    Created on : 10-ene-2021, 0:18:01
    Author     : david
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>
           Pagina para dar de alta un trabajador
        </title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
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
            ps=con.prepareStatement("select trabajadorID from trabajadores");
            rs=ps.executeQuery();
            while(rs.next()){
                identificadores.add(Integer.parseInt(rs.getString("trabajadorID")));
            }
        %>
        <div class="card"> En esta página podrás dar de alta a un Trabajador</div> 
        <div class="cardMedio">
        <form action="Agregar.jsp" method="post">
            <button class="restablecer" type="reset">Restablecer campos</button><br>
            <h2>Escriba los campos del trabajador</h2>
            <label>Nombre del trabajador:</label><br><br>
            <input type="text" id="nombre" class="casilla" name="txtnombre" required maxlength="15" pattern="[A-Za-z][a-z]+[0-9]*"><br><br>
            <label>Usuario:</label><br><br>
            <input type="text" id="usuario" class="casilla" name="txtusuario" required min = "1" max = "1000000" pattern="[A-Za-z][a-z]+[0-9]*"><br><br>
            <button onsubmit class="button">Añadir Trabajador</button>
            <a href="altas.jsp"> Volver Atrás</a>
        </form>
        </div> 
    </body>
</html>
<%
        String name,usuario,horainicio;
        name=request.getParameter("txtnombre");
        usuario=request.getParameter("txtusuario");
        horainicio=request.getParameter("txthorainicio");
        
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS"); 
        String text = String.valueOf(horainicio);

        int trabajadorID=1;
        while(identificadores.contains(trabajadorID)){
            trabajadorID++;
        }

        if(name!=null){
            java.util.Date date2 = dateFormat.parse(text);
            java.sql.Timestamp ts = new Timestamp(date2.getTime());
            ps=con.prepareStatement("insert into trabajadores(name,trabajadorID,usuario,horaInicio,horaFin) values ('"+name+"','"+trabajadorID+"','"+usuario+"',"+null+","+null+")");
            ps.executeUpdate();
            response.sendRedirect("inicioRRHH.jsp");
        }       
%>
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
<html lang="es">
    <head>
        <title>
            Página para editar un trabajador
        </title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title></title>
    </head>
    <body>
        <!-- CSS -->
        <link rel="stylesheet" type="text/css" href="../css/plantilla.css" media="screen" />
        <!-- Titulos -->
        <header> 
          <div class="title">Portal de trabajadores</div>
        </header> 
        <!-- Barra del menu -->
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
        String trabajadorID=request.getParameter("trabajadorID");
        ps=con.prepareStatement("select * from trabajadores where trabajadorID="+trabajadorID);
        rs=ps.executeQuery();
        while(rs.next()){
        %>
        <div class="cardMedio">
            <form action="" method="post">
                <h2>Modificar Trabajador</h2>
                <label>Nombre del trabajador:</label><br><br>
                <input type="text" value="<%=rs.getString("name")%>" id="nombre" class="casilla" name="txtnombre" required maxlength="15" pattern="[A-Za-z0-9]+"><br><br>
                <label>Código del trabajador:</label><br><br>
                <input type="text" readonly="" value="<%=rs.getString("trabajadorID")%>" id="codigoTrabajador" class="casilla" name="txttrabajadorID" required min = "1" max = "1000000" pattern="[0-9]+"><br><br>
                <label>Usuario:</label><br><br>
                <input type="text" value="<%=rs.getString("usuario")%>" id="usuario" class="casilla" name="txtusuario" required min = "1" max = "1000000" pattern="[A-Za-z0-9]+"><br><br>
                <label>Hora de inicio:</label><br><br>
                <input type="text" value="<%=rs.getString("horaInicio")%>" id="horaInicio" class="casilla" name="txthorainicio" required min = "1" max = "1000000"><br><br>
                <label>Hora final:</label><br><br>
                <input type="text" value="<%=rs.getString("horaFin")%>" id="horaFin" class="casilla" name="txthorafin" required min = "1" max = "1000000"><br><br>
                <button onsubmit class="button">Modificar Trabajador</button>
            </form>
        <%}%>
        </div>
    </body>
</html>
<%
        String name,usuario;
        name=request.getParameter("txtnombre");
        usuario=request.getParameter("txtusuario");
        
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS"); 
        Calendar cal = Calendar.getInstance(); 
        java.sql.Timestamp timestamp = new java.sql.Timestamp(cal.getTimeInMillis());

        
        if(name!=null){
            ps=con.prepareStatement("update trabajadores set name='"+name+"',usuario='"+usuario+"',horaInicio='"+timestamp+"',horaFin='"+timestamp+"' where trabajadorID="+trabajadorID);
            ps.executeUpdate();
            response.sendRedirect("../paginasWeb/inicioRRHH.jsp");
        }   
%>

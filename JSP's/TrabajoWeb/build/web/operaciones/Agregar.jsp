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
        <div align="center"><img src="../css/logo.png" alt=""></div>
        <title>
           Pagina para dar de alta un trabajador
        </title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body>
        <!-- CSS -->
        <link rel="stylesheet" type="text/css" href="../css/plantilla.css" media="screen" />
        <!-- Titulos -->
        <header> 
          <div class="title">Portal de Altas</div>
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
            ArrayList<Integer> identificadores = new ArrayList<Integer>();
            ArrayList<Integer> identificadoresProyecto = new ArrayList<Integer>();
            ps=con.prepareStatement("select trabajadorID from trabajadores");
            rs=ps.executeQuery();
            while(rs.next()){
                identificadores.add(Integer.parseInt(rs.getString("trabajadorID")));
            }
        %>
        <div class="card"> En esta página podrás dar de alta a un Trabajador</div> 
        <div class="container">
            <h1>Proyectos</h1>
            <hr>
            <br>
            <br>
            <table class="table table-bordered">
                <tr>
                    <th class="text-center">Name</th>
                    <th class="text-center">ProyectoID</th>
                    <th class="text-center">EmpresaID</th>
                </tr>
                <%
                    ps=con.prepareStatement("select * from proyecto");
                    rs=ps.executeQuery();
                    while(rs.next()){
                    identificadoresProyecto.add(Integer.parseInt(rs.getString("proyectoID")));
                %>
                <tr>
                    <td class="text-center"><%= rs.getString("name")%></td>
                    <td class="text-center"><%= rs.getString("proyectoID")%></td>
                    <td class="text-center"><%= rs.getString("empresaID")%></td>
                </tr>
                <%}%>
            </table>
        </div>
        <div class="cardMedio">
        <form action="Agregar.jsp" method="post">
            <button class="restablecer" type="reset">Restablecer campos</button><br>
            <h2>Escriba los campos del trabajador</h2>
            <label>Nombre del trabajador:</label><br><br>
            <input type="text" id="nombre" class="casilla" name="txtnombre" required maxlength="15" pattern="[A-Za-z0-9]+"><br><br>
            <label>Código del proyecto en el que trabaja el trabajador:</label><br><br>
            <input type="text" id="codigoEProyecto" class="casilla" name="txtproyectoID" required min = "1" max = "1000000" pattern="[0-9]+"><br><br>    
            <label>Usuario:</label><br><br>
            <input type="text" id="usuario" class="casilla" name="txtusuario" required min = "1" max = "1000000" pattern="[A-Za-z0-9]+"><br><br>
            <label>Tipo:</label>
            <br>
            <br>
            <select id="peticionTipo" name="peticionTipo">
              <option value="recursos humanos">Recursos humanos</option>
              <option value="empleado">Empleado</option>
            </select>
            <br>
            <br>
            <label>Contraseña:</label><br><br>
            <input type="text" id="contraseña" class="casilla" name="txtcontrasena" required min = "1" max = "1000000" pattern="[A-Za-z0-9]+"><br><br>
            <button onsubmit class="button">Añadir Trabajador</button>

        </form>
        </div> 
    </body>
</html>
<%
        String name,usuario,tipo,contrasena,proyectoID;
        name=request.getParameter("txtnombre");
        usuario=request.getParameter("txtusuario");
        contrasena=request.getParameter("txtcontrasena");
        tipo=request.getParameter("peticionTipo");
        proyectoID=request.getParameter("txtproyectoID");
        
        int trabajadorID=1;
        while(identificadores.contains(trabajadorID)){
            trabajadorID++;
        }

        if(name!=null){
            if(identificadoresProyecto.contains(Integer.parseInt(proyectoID))){
            ps=con.prepareStatement("insert into usuarios(usuario,tipo,contraseña) values ('"+usuario+"','"+tipo+"','"+contrasena+"')");
            ps.executeUpdate();
            ps=con.prepareStatement("insert into trabajadores(name,trabajadorID,usuario,horaInicio,horaFin) values ('"+name+"','"+trabajadorID+"','"+usuario+"',"+null+","+null+")");
            ps.executeUpdate();
            ps=con.prepareStatement("insert into proyectoTrabajadores(trabajadorID,proyectoID) values ('"+trabajadorID+"','"+proyectoID+"')");
            ps.executeUpdate();
            response.sendRedirect("../paginasWeb/inicioRRHH.jsp");
            }else{
                response.sendRedirect("../errores/error400.html");
            }
        }       
%>
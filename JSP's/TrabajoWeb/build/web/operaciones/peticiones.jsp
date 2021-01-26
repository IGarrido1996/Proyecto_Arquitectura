<%-- 
    Document   : peticiones
    Created on : 13-ene-2021, 17:50:47
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <div align="center"><img src="../css/logo.png" alt=""></div>
        <title>Pagina peticiones empleados</title>
    </head>
    <body>
        <!-- CSS -->
        <link rel="stylesheet" type="text/css" href="../css/plantilla.css" media="screen" /> 
        <!-- Titulos -->
        <header> 
          <div class="title">Portal de Peticiones</div>
        </header> 

        <!-- Barra del menu -->
        <div class="menu"> 
            <a href="../paginasWeb/inicioEmpleados.jsp">INICIO</a> 
            <a href="../paginasWeb/calendario.jsp">CALENDARIO</a> 
            <a href="peticiones.jsp">PETICIONES</a>
            <a href="../paginasWeb/ficharEmpleado.jsp">FICHAR</a> 
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
            String usuario=(String) request.getSession().getAttribute("usuario"); 
            ps=con.prepareStatement("select trabajadores.name,trabajadores.trabajadorID,peticiones.peticionesID, peticiones.fechaInicio, peticiones.fechaFin,peticiones.categoria, peticiones.texto, peticiones.estado from peticiones inner join peticionesTrabajadores inner join trabajadores where peticionesTrabajadores.peticionesID=peticiones.peticionesID and trabajadores.usuario='"+usuario+"' and peticionesTrabajadores.trabajadorID=trabajadores.trabajadorID");
            rs=ps.executeQuery();
        %>

            <div class="container">

                        <h1>Peticiones</h1>
                        <hr>
                        <p>Consulte el estado de sus peticiones</p>
                        <table class="table table-bordered">
                            <tr>
                                <th class="text-center">Código de la petición</th>
                                <th class="text-center">Fecha de inicio</th>
                                <th class="text-center">Fecha final</th>
                                <th class="text-center">Categoría</th>
                                <th class="text-center">Motivo</th>
                                <th class="text-center">Estado</th>
                            </tr>
                <%
                    while(rs.next()){
                %>
                <tr>
                    <td class="text-center"><%= rs.getString("peticionesID")%></td>
                    <td class="text-center"><%= rs.getString("fechaInicio")%></td>
                    <td class="text-center"><%= rs.getString("fechaFin")%></td>
                    <td class="text-center"><%= rs.getString("categoria")%></td>
                    <td class="text-center"><%= rs.getString("texto")%></td>
                    <td class="text-center"><%= rs.getString("estado")%></td>
                </tr>
                <%}%>
            </table>
            <div class="card"> Aquí podrás hacer una petición</div> 
        <div class="cardMedio">
        <form action="" method="post">
            <button class="restablecer" type="reset">Restablecer campos</button><br>
            <h2>Escriba los campos de la petición</h2>
            <label>Elige una categoría:</label>
            <br>
            <br>
            <select id="peticionCategoria" name="peticionCategoria">
              <option value="dia libre">Día libre</option>
              <option value="vacaciones">Vacaciones</option>
              <option value="horas libres">Horas libres</option>
              <option value="deberes">Deberes</option>
            </select>
            <br>
            <br>
            <label>Fecha de inicio:</label><br><br>
            <input type="text" id="fechaInicio" class="casilla" name="txtfechaInicio" required  maxlength="200"><br><br>
            <label>Fecha del fin:</label><br><br>
            <input type="text" id="fechaFin" class="casilla" name="txtfechaFin" required  maxlength="200"><br><br>
            <label>Justificación:</label><br><br>
            <input type="text" id="justificacion" class="casilla" name="txttexto" required  maxlength="200" pattern="[A-Z][a-z]+(\s[A-Za-z]+)*"><br><br>
            <button onsubmit class="button">Enviar Petición</button>
        </form>
        </div>
            <br>
                    </div>
    </body>
</html>
<%
        ArrayList<Integer> identificadores = new ArrayList<Integer>();
        ps=con.prepareStatement("select peticionesID from peticiones");
        rs=ps.executeQuery();
        while(rs.next()){
            identificadores.add(Integer.parseInt(rs.getString("peticionesID")));
        }
        int peticionesID=1;
        while(identificadores.contains(peticionesID)){
            peticionesID++;
        }
        String categoria,texto,fechaInicio,fechaFin;
        categoria=request.getParameter("peticionCategoria");
        texto=request.getParameter("txttexto");
        fechaInicio=request.getParameter("txtfechaInicio");
        fechaFin=request.getParameter("txtfechaFin");
        
        if(categoria!=null && texto!=null){
            ps=con.prepareStatement("insert into peticiones(peticionesID,fechaInicio,fechaFin,categoria,texto,estado)values('"+peticionesID+"','"+fechaInicio+"','"+fechaFin+"','"+categoria+"','"+texto+"','en espera')");
            ps.executeUpdate();
            ps=con.prepareStatement("select trabajadores.trabajadorID from trabajadores where usuario='"+usuario+"'");
            rs=ps.executeQuery();
            if(rs.next()){
                String auxiliar=rs.getString("trabajadorID");
                ps=con.prepareStatement("insert into peticionesTrabajadores(trabajadorID,peticionesID)values('"+auxiliar+"','"+peticionesID+"')");
                ps.executeUpdate();
            }
            response.sendRedirect("../paginasWeb/inicioEmpleados.jsp");
        }       
%>
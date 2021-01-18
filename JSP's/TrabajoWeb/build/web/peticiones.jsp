<%-- 
    Document   : peticiones
    Created on : 13-ene-2021, 17:50:47
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>Pagina peticiones empleados</title>
    </head>
    <body>
        <!-- CSS -->
        <link rel="stylesheet" type="text/css" href="plantilla.css" media="screen" /> 
        <!-- Titulos -->
        <header> 
          <div class="title">Portal Empleado</div>
        </header> 

        <!-- Barra del menu -->
        <div class="menu"> 
            <a href="inicioEmpleados.jsp">INICIO</a> 
            <a href="calendario.html">CALENDARIO</a> 
            <a href="peticiones.jsp">PETICIONES</a>
            <a href="fichar.html">FICHAR</a> 
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
            ps=con.prepareStatement("select trabajadores.name,trabajadores.trabajadorID,peticiones.peticionesID, peticiones.fecha, peticiones.categoria, peticiones.texto, peticiones.estado from peticiones inner join peticionesTrabajadores inner join trabajadores where peticionesTrabajadores.peticionesID=peticiones.peticionesID and trabajadores.usuario='"+usuario+"' and peticionesTrabajadores.trabajadorID=trabajadores.trabajadorID");
            rs=ps.executeQuery();
        %>
            <div class="fila">
            <div class="contenido">
                <div class="card">
                    <div class="registro">
                        <h1>Peticiones</h1>
                        <hr>
                        <p>Consulte el estado de sus peticiones</p>
                        <table class="table table-bordered">
                            <tr>
                                <th class="text-center">Código de la petición</th>
                                <th class="text-center">Fecha</th>
                                <th class="text-center">Categoría</th>
                                <th class="text-center">Motivo</th>
                                <th class="text-center">Estado</th>
                            </tr>
                <%
                    while(rs.next()){
                %>
                <tr>
                    <td class="text-center"><%= rs.getString("peticionesID")%></td>
                    <td class="text-center"><%= rs.getString("fecha")%></td>
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
            <label>Código de la petición:</label><br><br>
            <input type="text" id="codigo" class="casilla" name="txtpeticionesID" required max = "1000000" pattern="[0-9]+"><br><br>
            <label>Fecha:</label><br><br>
            <input type="text" id="fecha" class="casilla" name="txtfecha" required  maxlength="15"><br><br>
            <label>Categoría:</label><br><br>
            <input type="text" id="categoria" class="casilla" name="txtcategoria" required  maxlength="30"><br><br>
            <label>Justificación:</label><br><br>
            <input type="text" id="justificacion" class="casilla" name="txttexto" required  maxlength="15" pattern="[A-Z][a-z]+(\s[A-Za-z]+)*"><br><br>
            <button onsubmit class="button">Enviar Petición</button>
        </form>
        </div>
            <br>
            <input type="button" onclick="history.back()" name="volver atrás" value="volver atrás">
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
<%
        String peticionesID,categoria,texto;
        peticionesID=request.getParameter("txtpeticionesID");
        categoria=request.getParameter("txtcategoria");
        texto=request.getParameter("txttexto");
        
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); 
        Calendar cal = Calendar.getInstance(); 
        
        
        java.util.Date date = new java.util.Date();  
        String tiempo = dateFormat.format(date);
        java.sql.Date date2 = new java.sql.Date(date.getTime());
        
        if(categoria!=null && peticionesID!=null){
            ps=con.prepareStatement("insert into peticiones(peticionesID,fecha,categoria,texto,estado)values('"+peticionesID+"','"+date2+"','"+categoria+"','"+texto+"','en espera')");
            ps.executeUpdate();
            response.sendRedirect("inicioEmpleados.jsp");
        }       
%>
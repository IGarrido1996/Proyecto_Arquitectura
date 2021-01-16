<%-- 
    Document   : inicioEmpleados
    Created on : 12-ene-2021, 18:16:48
    Author     : david
--%>
<%@page import="java.sql.*"%>
<html lang="es">
    <head>
        <title>
           Pagina principal empleados
        </title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title></title>
    </head>
    <body>
        <!-- CSS -->
        <link rel="stylesheet" type="text/css" href="plantilla.css" media="screen" />
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
        request.getSession().setAttribute("usuario", usuario);
        ps=con.prepareStatement("select proyecto.name, proyecto.proyectoID, proyecto.empresaID from trabajadores inner join proyectoTrabajadores inner join proyecto where trabajadores.usuario='"+usuario+"' and  proyectoTrabajadores.trabajadorID=trabajadores.trabajadorID and proyectoTrabajadores.proyectoID=proyecto.proyectoID");
        rs=ps.executeQuery();
        %>
        <div class="fila">
            <div class="contenido">
                <div class="card">
                    <div class="registro">
                        <h1>Proyectos</h1>
                        <hr>
                        <p>Seleccione el número de horas empleado en cada proyecto</p>
                        <table class="table table-bordered">
                            <tr>
                                <th class="text-center">Name</th>
                                <th class="text-center">ProyectoID</th>
                                <th class="text-center">EmpresaID</th>
                            </tr>
                <%
                    while(rs.next()){
                %>
                <tr>
                    <td class="text-center"><%= rs.getString("name")%></td>
                    <td class="text-center"><%= rs.getString("proyectoID")%></td>
                    <td class="text-center"><%= rs.getString("empresaID")%></td>
                </tr>
                <%}%>
            </table>
            <br>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

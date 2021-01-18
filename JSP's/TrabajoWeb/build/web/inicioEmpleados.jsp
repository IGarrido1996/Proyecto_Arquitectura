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
                                <th class="text-center">Indicar número de horas dedicadas al proyecto</th>
                                <th class="text-center">Enviar</th>
                            </tr>
                <%
                    while(rs.next()){
                %>

                    <form action="" method="POST">
                         <tr>
                            <td class="text-center"><%= rs.getString("name")%></td>
                            <td class="text-center"><input type="text" readonly="" name="txtproyectoID" value="<%= rs.getString("proyectoID")%>"/></td>
                            <td class="text-center"><%= rs.getString("empresaID")%></td>
                            <td><input type="text" name="txthoras"></td>
                            <td><input type="submit" value="Enviar"/></td>
                        </tr>
                    </form>

                <%}%>
            </table>
            <br>
                    </div>
                </div>
            </div>
        </div>
            <a href="fichar.jsp" class="btn btn-warning btn-sm">Fichar entrada</a>
            <br>
            <br>
            <a href="ficharSalida.jsp" class="btn btn-warning btn-sm">Fichar salida</a>
    </body>
</html>
<%
    int rs2;
    String proyectoID,horasTotales;
    horasTotales=request.getParameter("txthoras");
    System.out.println("ProyectoID:");    
    proyectoID=request.getParameter("txtproyectoID");
    System.out.println(proyectoID);
    Boolean entrar=false;
    System.out.println("HorasTotales:");
    System.out.println(horasTotales);
    System.out.println("Usuario:");
    System.out.println(usuario);
    if(horasTotales!=null){
        ps=con.prepareStatement("select horasproyectotrabajador.trabajadorID, horasproyectotrabajador.proyectoID, horasproyectotrabajador.horasTotales from horasproyectotrabajador inner join trabajadores where trabajadores.trabajadorID=horasproyectotrabajador.trabajadorID and trabajadores.usuario='"+usuario+"'");
        rs=ps.executeQuery();
        while(rs.next()){
            if(rs.getString("proyectoID").equals(proyectoID)){
                ps=con.prepareStatement("update horasProyectoTrabajador set horasTotales='"+horasTotales+"' where proyectoID='"+proyectoID+"'");
                rs2=ps.executeUpdate();
                entrar=true;
            }
        }
        
        if(!entrar){
            ps=con.prepareStatement("select trabajadorID from trabajadores where usuario='"+usuario+"'");
            rs=ps.executeQuery();
            if(rs.next()){
                String auxiliar=rs.getString("trabajadorID");
                ps=con.prepareStatement("insert into horasproyectotrabajador(trabajadorID,proyectoID,horasTotales) values ('"+auxiliar+"','"+proyectoID+"','"+horasTotales+"')");
                rs2=ps.executeUpdate();
            }
        }
    }
%>
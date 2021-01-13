<%-- 
    Document   : inicioEmpleados
    Created on : 12-ene-2021, 18:16:48
    Author     : david
--%>
<%@page import="java.sql.*"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title></title>
    </head>
    <body>
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
        ps=con.prepareStatement("select proyecto.name, proyecto.proyectoID, proyecto.empresaID from trabajadores inner join proyectoTrabajadores inner join proyecto where trabajadores.usuario='"+usuario+"' and  proyectoTrabajadores.trabajadorID=trabajadores.trabajadorID and proyectoTrabajadores.proyectoID=proyecto.proyectoID");
        rs=ps.executeQuery();
        %>
        <div class="container">
            <h1>Proyectos</h1>
            <hr>
            <p>Seleccione indica el número de horas empleado en cada proyecto</p>
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
            <a   href="peticiones.jsp" class="btn btn-danger btn-sm" >Hacer o ver el estado de una petición</a> 
        </div>
    </body>
</html>

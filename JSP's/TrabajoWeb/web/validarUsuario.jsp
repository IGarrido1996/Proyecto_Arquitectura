<%-- 
    Document   : validarUsuario
    Created on : 13-ene-2021, 2:46:46
    Author     : david
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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
            String usuario=request.getParameter("txtusuario");
            String contraseña=request.getParameter("txtcontraseña");
            String tipo="";
            PreparedStatement ps;
            ResultSet rs;
            ps=con.prepareStatement("select * from usuarios");
            rs=ps.executeQuery();
            while(rs.next()){
                if(rs.getString("usuario").equals(usuario) && rs.getString("contraseña").equals(contraseña)){
                    tipo=rs.getString("tipo");
                }
            }
        if(tipo.equals("recursos humanos")){
            response.sendRedirect("inicioRRHH.jsp");
        }else if(tipo.equals("empleado")){
            request.getSession().setAttribute("usuario", usuario);
            response.sendRedirect("inicioEmpleados.jsp");
        }else{
            //out.println("Usuario o contraseña erróneos");
            response.sendRedirect("error400.html");
        }
        %>
        <br>
        <br>
        <a href="javascript:history.back()"> Volver Atrás</a>
    </body>
</html>


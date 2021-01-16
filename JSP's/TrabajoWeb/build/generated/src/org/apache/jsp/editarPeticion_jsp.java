package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class editarPeticion_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"es\">\n");
      out.write("    <head>\n");
      out.write("        <title>\n");
      out.write("            Página para editar una empresa\n");
      out.write("        </title>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link href=\"css/bootstrap.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <!-- CSS -->\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"plantilla.css\" media=\"screen\" />\n");
      out.write("        <!-- Titulos -->\n");
      out.write("        <header> \n");
      out.write("          <div class=\"title\">Portal de empresas</div>\n");
      out.write("        </header> \n");
      out.write("        ");

        Connection con;
        String url="jdbc:mysql://localhost:3306/arquitecturaweb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
        String driver="com.mysql.jdbc.Driver";
        String user="root";
        String pass="contraseña";
        Class.forName(driver);
        con=DriverManager.getConnection(url,user,pass);
        String usuario=request.getParameter("txtusuario");
        String contraseña=request.getParameter("txtcontraseña");

        PreparedStatement ps;
        ResultSet rs;
        String peticionesID=request.getParameter("peticionesID");
        ps=con.prepareStatement("select * from peticiones where peticionesID="+peticionesID);
        rs=ps.executeQuery();
        while(rs.next()){
        
      out.write("\n");
      out.write("        <div class=\"cardMedio\">\n");
      out.write("            <form action=\"\" method=\"post\">\n");
      out.write("                <h2>Modificar Peticiones</h2>\n");
      out.write("                <label>Código de la petición:</label><br><br>\n");
      out.write("                <input type=\"text\" readonly=\"\" value=\"");
      out.print(rs.getString("peticionesID"));
      out.write("\" id=\"peticionesID\" class=\"casilla\" name=\"txtpeticionesID\" required min = \"1\" max = \"1000000\" pattern=\"[0-9]+\"><br><br>\n");
      out.write("                <label>Fecha:</label><br><br>\n");
      out.write("                <input type=\"text\" readonly=\"\" value=\"");
      out.print(rs.getString("fecha"));
      out.write("\" id=\"fecha\" class=\"casilla\" name=\"txtfecha\" required maxlength=\"15\"><br><br>\n");
      out.write("                <label>Categoría:</label><br><br>\n");
      out.write("                <input type=\"text\" readonly=\"\" value=\"");
      out.print(rs.getString("categoria"));
      out.write("\" id=\"categoria\" class=\"casilla\" name=\"txtcategoria\" required maxlength=\"15\"><br><br>\n");
      out.write("                <label>Motivo:</label><br><br>\n");
      out.write("                <input type=\"text\" readonly=\"\" value=\"");
      out.print(rs.getString("motivo"));
      out.write("\" id=\"motivo\" class=\"casilla\" name=\"txtmotivo\" required maxlength=\"15\" pattern=\"[A-Za-z][a-z]+[0-9]*\"><br><br>\n");
      out.write("                <label>Estado:</label><br><br>\n");
      out.write("                <input type=\"text\" value=\"");
      out.print(rs.getString("estado"));
      out.write("\" id=\"estado\" class=\"casilla\" name=\"txtestado\" required maxlength=\"15\" pattern=\"[A-Za-z][a-z]+[0-9]*\"><br><br>\n");
      out.write("                <button onsubmit class=\"button\">Modificar Petición</button>\n");
      out.write("                <a href=\"inicioRRHH.jsp\"> Volver Atrás</a>\n");
      out.write("            </form>\n");
      out.write("        ");
}
      out.write("\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");

        String categoria,estado;
        categoria=request.getParameter("txtcategoria");
        estado=request.getParameter("txtestado");
        
        if(categoria!=null && estado!=null){
            ps=con.prepareStatement("update peticiones set estado='"+estado+"' where peticionesID="+peticionesID);
            ps.executeUpdate();
            response.sendRedirect("inicioRRHH.jsp");
        }   

    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}

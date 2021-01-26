package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class editarProyecto_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"es\">\r\n");
      out.write("    <head>\r\n");
      out.write("        <title>\r\n");
      out.write("            Página para editar un proyecto\r\n");
      out.write("        </title>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        <!-- CSS -->\r\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"plantilla.css\" media=\"screen\" />\r\n");
      out.write("        <!-- Titulos -->\r\n");
      out.write("        <header> \r\n");
      out.write("          <div class=\"title\">Portal de proyectos</div>\r\n");
      out.write("        </header> \r\n");
      out.write("        <!-- Barra del menu -->\r\n");
      out.write("        <div class=\"menu\"> \r\n");
      out.write("            <a href=\"inicioRRHH.jsp\">INICIO</a> \r\n");
      out.write("            <a href=\"calendario.html\">CALENDARIO</a> \r\n");
      out.write("            <a href=\"altas.jsp\">ALTAS</a> \r\n");
      out.write("            <a href=\"peticionesRRHH.jsp\">PETICIONES</a>\r\n");
      out.write("            <a href=\"informes.jsp\">INFORMES</a>\r\n");
      out.write("        </div>\r\n");
      out.write("        ");

        Connection con;
        String url="jdbc:mysql://localhost:3306/arquitecturaweb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
        String driver="com.mysql.jdbc.Driver";
        String user="root";
        String pass="contraseña";
        Class.forName(driver);
        con=DriverManager.getConnection(url,user,pass);
        
        PreparedStatement ps;
        ResultSet rs;
        String proyectoID=request.getParameter("proyectoID");
        ps=con.prepareStatement("select * from proyecto where proyectoID="+proyectoID);
        rs=ps.executeQuery();
        while(rs.next()){
        
      out.write("\r\n");
      out.write("        <div class=\"cardMedio\">\r\n");
      out.write("            <form action=\"\" method=\"post\">\r\n");
      out.write("                <h2>Modificar Proyecto</h2>\r\n");
      out.write("                <label>Nombre del proyecto:</label><br><br>\r\n");
      out.write("                <input type=\"text\" value=\"");
      out.print(rs.getString("name"));
      out.write("\" id=\"nombre\" class=\"casilla\" name=\"txtnombre\" required maxlength=\"15\" pattern=\"[A-Za-z0-9]+\"><br><br>\r\n");
      out.write("                <label>Código del proyecto:</label><br><br>\r\n");
      out.write("                <input type=\"text\" readonly=\"\" value=\"");
      out.print(rs.getString("proyectoID"));
      out.write("\" id=\"codigo\" class=\"casilla\" name=\"txtproyectoID\" required min = \"1\" max = \"1000000\" pattern=\"[0-9]+\"><br><br>\r\n");
      out.write("                <label>Código de la empresa del proyecto:</label><br><br>\r\n");
      out.write("                <input type=\"text\" value=\"");
      out.print(rs.getString("empresaID"));
      out.write("\" id=\"codigoEmpresa\" class=\"casilla\" name=\"txtempresaID\" required min = \"1\" max = \"1000000\" pattern=\"[0-9]+\"><br><br>\r\n");
      out.write("                <button onsubmit class=\"button\">Modificar Proyecto</button>\r\n");
      out.write("            </form>\r\n");
      out.write("        ");
}
      out.write("\r\n");
      out.write("        </div>\r\n");
      out.write("    </body>\r\n");
      out.write("</html>\r\n");

        String name,empresaID;
        name=request.getParameter("txtnombre");
        empresaID=request.getParameter("txtempresaID");
        
        if(name!=null && empresaID!=null && proyectoID!=null){
            ps=con.prepareStatement("update proyecto set name='"+name+"',empresaID='"+empresaID+"' where proyectoID="+proyectoID);
            ps.executeUpdate();
            response.sendRedirect("inicioRRHH.jsp");
        }   

      out.write('\r');
      out.write('\n');
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

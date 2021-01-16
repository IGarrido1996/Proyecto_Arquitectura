package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class inicioEmpleados_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
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
      out.write("<html lang=\"es\">\n");
      out.write("    <head>\n");
      out.write("        <title>\n");
      out.write("           Pagina principal empleados\n");
      out.write("        </title>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link href=\"css/bootstrap.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <title></title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <!-- CSS -->\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"plantilla.css\" media=\"screen\" />\n");
      out.write("        <header> \n");
      out.write("          <div class=\"title\">Portal Empleado</div>\n");
      out.write("        </header>\n");
      out.write("        <!-- Barra del menu -->\n");
      out.write("        <div class=\"menu\"> \n");
      out.write("            <a href=\"inicioEmpleados.jsp\">INICIO</a> \n");
      out.write("            <a href=\"calendario.html\">CALENDARIO</a> \n");
      out.write("            <a href=\"peticiones.html\">PETICIONES</a>\n");
      out.write("            <a href=\"fichar.html\">FICHAR</a> \n");
      out.write("        </div>\n");
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
        String usuario=(String) request.getSession().getAttribute("usuario"); 
        ps=con.prepareStatement("select proyecto.name, proyecto.proyectoID, proyecto.empresaID from trabajadores inner join proyectoTrabajadores inner join proyecto where trabajadores.usuario='"+usuario+"' and  proyectoTrabajadores.trabajadorID=trabajadores.trabajadorID and proyectoTrabajadores.proyectoID=proyecto.proyectoID");
        rs=ps.executeQuery();
        
      out.write("\n");
      out.write("        <div class=\"fila\">\n");
      out.write("            <div class=\"contenido\">\n");
      out.write("                <div class=\"card\">\n");
      out.write("                    <div class=\"registro\">\n");
      out.write("                        <h1>Proyectos</h1>\n");
      out.write("                        <hr>\n");
      out.write("                        <p>Seleccione el número de horas empleado en cada proyecto</p>\n");
      out.write("                        <table class=\"table table-bordered\">\n");
      out.write("                            <tr>\n");
      out.write("                                <th class=\"text-center\">Name</th>\n");
      out.write("                                <th class=\"text-center\">ProyectoID</th>\n");
      out.write("                                <th class=\"text-center\">EmpresaID</th>\n");
      out.write("                            </tr>\n");
      out.write("                ");

                    while(rs.next()){
                
      out.write("\n");
      out.write("                <tr>\n");
      out.write("                    <td class=\"text-center\">");
      out.print( rs.getString("name"));
      out.write("</td>\n");
      out.write("                    <td class=\"text-center\">");
      out.print( rs.getString("proyectoID"));
      out.write("</td>\n");
      out.write("                    <td class=\"text-center\">");
      out.print( rs.getString("empresaID"));
      out.write("</td>\n");
      out.write("                </tr>\n");
      out.write("                ");
}
      out.write("\n");
      out.write("            </table>\n");
      out.write("            <br>\n");
      out.write("            <a   href=\"peticiones.jsp\" class=\"btn btn-danger btn-sm\" >Hacer o ver el estado de una petición</a> \n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class inicioRRHH_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("            Página principal de RRHH\n");
      out.write("        </title>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link href=\"css/bootstrap.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("         <!-- CSS -->\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"plantilla.css\" media=\"screen\" /> \n");
      out.write("        <!-- Titulos -->\n");
      out.write("        <header> \n");
      out.write("          <div class=\"title\">Portal de RRHH</div>\n");
      out.write("        </header> \n");
      out.write("\n");
      out.write("        <!-- Barra del menu -->\n");
      out.write("        <div class=\"menu\"> \n");
      out.write("            <a href=\"inicioRRHH.jsp\">INICIO</a> \n");
      out.write("            <a href=\"calendario.html\">CALENDARIO</a> \n");
      out.write("            <a href=\"altas.html\">ALTAS</a> \n");
      out.write("            <a href=\"peticiones.html\">PETICIONES</a>\n");
      out.write("            <a href=\"informes.html\">INFORMES</a>\n");
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
            
            ps=con.prepareStatement("select * from trabajadores");
            rs=ps.executeQuery();
        
      out.write("\n");
      out.write("            <div class=\"container\">\n");
      out.write("            <h1>Trabajadores</h1>\n");
      out.write("            <hr>\n");
      out.write("            <a class=\"btn btn-success btn-lg\" href=\"Agregar.jsp\">Nuevo trabajador</a>\n");
      out.write("            <br>\n");
      out.write("            <br>\n");
      out.write("            <table class=\"table table-bordered\">\n");
      out.write("                <tr>\n");
      out.write("                    <th class=\"text-center\">Name</th>\n");
      out.write("                    <th class=\"text-center\">TrabajadorID</th>\n");
      out.write("                    <th class=\"text-center\">Usuario</th>\n");
      out.write("                    <th class=\"text-center\">Hora inicio</th>\n");
      out.write("                    <th class=\"text-center\">Hora fin</th>\n");
      out.write("                    <th class=\"text-center\">Horas totales</th>\n");
      out.write("                    <th class=\"text-center\">Acciones</th>\n");
      out.write("                </tr>\n");
      out.write("                ");

                    while(rs.next()){
                
      out.write("\n");
      out.write("                <tr>\n");
      out.write("                    <td class=\"text-center\">");
      out.print( rs.getString("name"));
      out.write("</td>\n");
      out.write("                    <td class=\"text-center\">");
      out.print( rs.getString("trabajadorID"));
      out.write("</td>\n");
      out.write("                    <td class=\"text-center\">");
      out.print( rs.getString("usuario"));
      out.write("</td>\n");
      out.write("                    <td class=\"text-center\">");
      out.print( rs.getString("horaInicio"));
      out.write("</td>\n");
      out.write("                    <td class=\"text-center\">");
      out.print( rs.getString("horaFin"));
      out.write("</td>\n");
      out.write("                    <td class=\"text-center\">");
      out.print( rs.getInt("horasTotales"));
      out.write("</td>\n");
      out.write("                    <td class=\"text-center\">\n");
      out.write("                    <a href=\"editar.jsp?trabajadorID=");
      out.print( rs.getString("trabajadorID"));
      out.write("\" class=\"btn btn-warning btn-sm\">Editar</a>\n");
      out.write("                    <a href=\"eliminar.jsp?trabajadorID=");
      out.print( rs.getString("trabajadorID"));
      out.write("\" class=\"btn btn-danger btn-sm\">Borrar</a>\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("                ");
}
      out.write("\n");
      out.write("            </table>\n");
      out.write("        </div>\n");
      out.write("            <div class=\"container\">\n");
      out.write("            <h1>Empresas</h1>\n");
      out.write("            <hr>\n");
      out.write("            <a class=\"btn btn-success btn-lg\" href=\"agregarEmpresa.jsp\">Nueva empresa</a>\n");
      out.write("            <br>\n");
      out.write("            <br>\n");
      out.write("            <table class=\"table table-bordered\">\n");
      out.write("                <tr>\n");
      out.write("                    <th class=\"text-center\">Name</th>\n");
      out.write("                    <th class=\"text-center\">EmpresaID</th>\n");
      out.write("                    <th class=\"text-center\">Acciones</th>\n");
      out.write("                </tr>\n");
      out.write("                ");

                    ps=con.prepareStatement("select * from empresa");
                    rs=ps.executeQuery();
                    while(rs.next()){
                
      out.write("\n");
      out.write("                <tr>\n");
      out.write("                    <td class=\"text-center\">");
      out.print( rs.getString("name"));
      out.write("</td>\n");
      out.write("                    <td class=\"text-center\">");
      out.print( rs.getString("empresaID"));
      out.write("</td>\n");
      out.write("                    <td class=\"text-center\">\n");
      out.write("                    <a href=\"editarEmpresa.jsp?empresaID=");
      out.print( rs.getString("empresaID"));
      out.write("\" class=\"btn btn-warning btn-sm\">Editar</a>\n");
      out.write("                    <a href=\"eliminarEmpresa.jsp?empresaID=");
      out.print( rs.getString("empresaID"));
      out.write("\" class=\"btn btn-danger btn-sm\">Borrar</a>\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("                ");
}
      out.write("\n");
      out.write("            </table>\n");
      out.write("        </div>\n");
      out.write("            <div class=\"container\">\n");
      out.write("            <h1>Proyectos</h1>\n");
      out.write("            <hr>\n");
      out.write("            <a class=\"btn btn-success btn-lg\" href=\"AgregarProyecto.jsp\">Nuevo proyecto</a>\n");
      out.write("            <br>\n");
      out.write("            <br>\n");
      out.write("            <table class=\"table table-bordered\">\n");
      out.write("                <tr>\n");
      out.write("                    <th class=\"text-center\">Name</th>\n");
      out.write("                    <th class=\"text-center\">ProyectoID</th>\n");
      out.write("                    <th class=\"text-center\">EmpresaID</th>\n");
      out.write("                    <th class=\"text-center\">Acciones</th>\n");
      out.write("                </tr>\n");
      out.write("                ");

                    ps=con.prepareStatement("select * from proyecto");
                    rs=ps.executeQuery();
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
      out.write("                    <td class=\"text-center\">\n");
      out.write("                    <a href=\"editarProyecto.jsp?proyectoID=");
      out.print( rs.getString("proyectoID"));
      out.write("\" class=\"btn btn-warning btn-sm\">Editar</a>\n");
      out.write("                    <a href=\"eliminarProyecto.jsp?proyectoID=");
      out.print( rs.getString("proyectoID"));
      out.write("\" class=\"btn btn-danger btn-sm\">Borrar</a>\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("                ");
}
      out.write("\n");
      out.write("            </table>\n");
      out.write("        </div>\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <h1>Peticiones</h1>\n");
      out.write("                <br>\n");
      out.write("                <table class=\"table table-bordered\">\n");
      out.write("                    <tr>\n");
      out.write("                    <th class=\"text-center\">Código de la petición</th>\n");
      out.write("                    <th class=\"text-center\">Fecha</th>\n");
      out.write("                    <th class=\"text-center\">Categoria</th>\n");
      out.write("                    <th class=\"text-center\">Texto</th>\n");
      out.write("                    <th class=\"text-center\">Estado</th>\n");
      out.write("                    <th class=\"text-center\">Acciones</th>\n");
      out.write("                </tr>\n");
      out.write("            ");

                ps=con.prepareStatement("select * from peticiones");
                rs=ps.executeQuery();
                while(rs.next()){
            
      out.write("\n");
      out.write("            \n");
      out.write("                    <tr>\n");
      out.write("                        <td class=\"text-center\">");
      out.print( rs.getString("peticionesID"));
      out.write("</td>\n");
      out.write("                        <td class=\"text-center\">");
      out.print( rs.getString("fecha"));
      out.write("</td>\n");
      out.write("                        <td class=\"text-center\">");
      out.print( rs.getString("categoria"));
      out.write("</td>\n");
      out.write("                        <td class=\"text-center\">");
      out.print( rs.getString("texto"));
      out.write("</td>\n");
      out.write("                        <td class=\"text-center\">");
      out.print( rs.getString("estado"));
      out.write("</td>\n");
      out.write("                        <td class=\"text-center\">\n");
      out.write("                        <a href=\"editarPeticion.jsp?peticionesID=");
      out.print( rs.getString("peticionesID"));
      out.write("\" class=\"btn btn-warning btn-sm\">Editar</a>\n");
      out.write("                        <a href=\"eliminarPeticion.jsp?peticionesID=");
      out.print( rs.getString("peticionesID"));
      out.write("\" class=\"btn btn-danger btn-sm\">Borrar</a>\n");
      out.write("                        </td>\n");
      out.write("                    </tr>\n");
      out.write("                    ");
}
      out.write("\n");
      out.write("                </table>\n");
      out.write("            </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
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

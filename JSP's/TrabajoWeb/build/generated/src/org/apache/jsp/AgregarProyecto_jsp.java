package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.ArrayList;
import java.sql.*;

public final class AgregarProyecto_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("           Pagina para dar de alta un proyecto\n");
      out.write("        </title>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link href=\"css/bootstrap.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <!-- CSS -->\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"plantilla.css\" media=\"screen\" />\n");
      out.write("        <!-- Titulos -->\n");
      out.write("        <header> \n");
      out.write("          <div class=\"title\">Portal de Informes</div>\n");
      out.write("        </header> \n");
      out.write("\n");
      out.write("        <!-- Barra del menu -->\n");
      out.write("        <div class=\"menu\"> \n");
      out.write("            <a href=\"inicioRRHH.jsp\">INICIO</a> \n");
      out.write("            <a href=\"calendario.html\">CALENDARIO</a> \n");
      out.write("            <a href=\"altas.jsp\">ALTAS</a> \n");
      out.write("            <a href=\"peticionesRRHH.jsp\">PETICIONES</a>\n");
      out.write("            <a href=\"informes.html\">INFORMES</a>   \n");
      out.write("        </div> \n");
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
            ArrayList<Integer> identificadores = new ArrayList<Integer>();
            ps=con.prepareStatement("select proyectoID from proyecto");
            rs=ps.executeQuery();
            while(rs.next()){
                identificadores.add(Integer.parseInt(rs.getString("proyectoID")));
            }
        
      out.write("\n");
      out.write("        <div class=\"card\"> En esta página podrás dar de alta a Empresas</div> \n");
      out.write("        <div class=\"cardMedio\">\n");
      out.write("        <form action=\"AgregarProyecto.jsp\" method=\"post\">\n");
      out.write("            <button class=\"restablecer\" type=\"reset\">Restablecer campos</button><br>\n");
      out.write("            <h2>Escriba los campos del proyecto</h2>\n");
      out.write("            <label>Nombre del proyecto:</label><br><br>\n");
      out.write("            <input type=\"text\" id=\"nombre\" class=\"casilla\" name=\"txtnombre\" required maxlength=\"15\" pattern=\"[A-Za-z][a-z]+[0-9]*\"><br><br>\n");
      out.write("            <label>Código del proyecto:</label><br><br>\n");
      out.write("            <input type=\"text\" id=\"codigo\" class=\"casilla\" name=\"txtproyectoID\" required min = \"1\" max = \"1000000\" pattern=\"[0-9]+\"><br><br>\n");
      out.write("            <label>Código de la empresa del proyecto:</label><br><br>\n");
      out.write("            <input type=\"text\" id=\"codigoEmpresa\" class=\"casilla\" name=\"txtempresaID\" required min = \"1\" max = \"1000000\" pattern=\"[0-9]+\"><br><br>\n");
      out.write("            <button onsubmit class=\"button\">Añadir Proyecto</button>\n");
      out.write("            <a href=\"altas.jsp\"> Volver Atrás</a>\n");
      out.write("        </form>\n");
      out.write("        </div>                \n");
      out.write("    </body>\n");
      out.write("</html>\n");

        String name,proyectoID,empresaID;
        name=request.getParameter("txtnombre");
        proyectoID=request.getParameter("txtproyectoID");
        empresaID=request.getParameter("txtempresaID");
        int proyectoID2=1;
        while(identificadores.contains(proyectoID2)){
            proyectoID2++;
        }

        if(name!=null && proyectoID!=null && empresaID!=null){
            ps=con.prepareStatement("insert into proyecto(name,proyectoID,empresaID) values ('"+name+"','"+proyectoID2+"','"+empresaID+"')");
            ps.executeUpdate();
            response.sendRedirect("inicioRRHH.jsp");
        }       

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

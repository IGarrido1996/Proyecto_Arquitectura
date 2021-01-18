package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.ArrayList;
import java.sql.*;

public final class agregarEmpresa_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"es\">\n");
      out.write("    <head>\n");
      out.write("        <title>\n");
      out.write("           Pagina para dar de alta a una empresa\n");
      out.write("        </title>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link href=\"css/bootstrap.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <title></title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <!-- CSS -->\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"plantilla.css\" media=\"screen\" /> \n");
      out.write("        <!-- Titulos -->\n");
      out.write("        <header> \n");
      out.write("          <div class=\"title\">Portal de Informes</div>\n");
      out.write("        </header> \n");
      out.write("        <div class=\"menu\"> \n");
      out.write("            <a href=\"inicioRRHH.jsp\">INICIO</a> \n");
      out.write("            <a href=\"calendario.html\">CALENDARIO</a> \n");
      out.write("            <a href=\"altas.html\">ALTAS</a> \n");
      out.write("            <a href=\"peticionesRRHH.jsp\">PETICIONES</a>\n");
      out.write("            <a href=\"informes.html\">INFORMES</a>   \n");
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
            ArrayList<Integer> identificadores = new ArrayList<Integer>();
            ps=con.prepareStatement("select empresaID from empresa");
            rs=ps.executeQuery();
            while(rs.next()){
                identificadores.add(Integer.parseInt(rs.getString("empresaID")));
            }
        
      out.write("\n");
      out.write("        <div class=\"card\"> En esta página podrás dar de alta a Empresas</div> \n");
      out.write("        <div class=\"cardMedio\">\n");
      out.write("        <form action=\"\" method=\"post\">\n");
      out.write("            <button class=\"restablecer\" type=\"reset\">Restablecer campos</button><br>\n");
      out.write("            <h2>Escriba los campos de la Empresa</h2>\n");
      out.write("            <label>Nombre de la Empresa:</label><br><br>\n");
      out.write("            <input type=\"text\" id=\"nombre\" class=\"casilla\" name=\"txtnombre\" required  maxlength=\"15\" pattern=\"[A-Z][a-z]+(\\s[A-Za-z]+)*\"><br><br>\n");
      out.write("            <label>Código de la Empresa:</label><br><br>\n");
      out.write("            <input type=\"text\" id=\"codigo\" class=\"casilla\" name=\"txtempresaID\" required max = \"1000000\" pattern=\"[0-9]+\"><br><br>\n");
      out.write("            <button onsubmit class=\"button\">Añadir Empresa</button>\n");
      out.write("            <a href=\"altas.jsp\"> Volver Atrás</a>\n");
      out.write("        </form>\n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("    </body>\n");
      out.write("</html>\n");

        
        String name,empresaID;
        name=request.getParameter("txtnombre");
        empresaID=request.getParameter("txtempresaID");
        int empresaID2=00001;
        while(identificadores.contains(empresaID2)){
            empresaID2++;
        }
        
        if(name!=null && empresaID!=null){
            ps=con.prepareStatement("insert into empresa(name,empresaID) values ('"+name+"','"+empresaID2+"')");
            ps.executeUpdate();
            response.sendRedirect("inicioRRHH.jsp");
        }       

      out.write('\n');
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

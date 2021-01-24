package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.ArrayList;
import java.util.Calendar;
import java.text.SimpleDateFormat;
import java.text.DateFormat;
import java.sql.*;

public final class Agregar_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"es\">\n");
      out.write("    <head>\n");
      out.write("        <title>\n");
      out.write("           Pagina para dar de alta un trabajador\n");
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
      out.write("        </div>\n");
      out.write("       ");

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
            ps=con.prepareStatement("select trabajadorID from trabajadores");
            rs=ps.executeQuery();
            while(rs.next()){
                identificadores.add(Integer.parseInt(rs.getString("trabajadorID")));
}     
      out.write(" \n");
      out.write("        <div class=\"card\"> En esta página podrás dar de alta a un Trabajador</div> \n");
      out.write("        <div class=\"cardMedio\">\n");
      out.write("        <form action=\"Agregar.jsp\" method=\"post\">\n");
      out.write("            <button class=\"restablecer\" type=\"reset\">Restablecer campos</button><br>\n");
      out.write("            <h2>Escriba los campos del trabajador</h2>\n");
      out.write("            <label>Nombre del trabajador:</label><br><br>\n");
      out.write("            <input type=\"text\" id=\"nombre\" class=\"casilla\" name=\"txtnombre\" required maxlength=\"15\" pattern=\"[A-Za-z][a-z]+[0-9]*\"><br><br>\n");
      out.write("            <label>Usuario:</label><br><br>\n");
      out.write("            <input type=\"text\" id=\"usuario\" class=\"casilla\" name=\"txtusuario\" required min = \"1\" max = \"1000000\" pattern=\"[A-Za-z][a-z]+[0-9]*\"><br><br>\n");
      out.write("            <button onsubmit class=\"button\">Añadir Trabajador</button>\n");
      out.write("            <a href=\"altas.jsp\"> Volver Atrás</a>\n");
      out.write("        </form>\n");
      out.write("        </div> \n");
      out.write("    </body>\n");
      out.write("</html>\n");

        String name,usuario,horainicio;
        name=request.getParameter("txtnombre");
        usuario=request.getParameter("txtusuario");
        horainicio=request.getParameter("txthorainicio");
        
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS"); 
        String text = String.valueOf(horainicio);

        int trabajadorID=1;
        while(identificadores.contains(trabajadorID)){
            trabajadorID++;
        }

        if(name!=null){
            java.util.Date date2 = dateFormat.parse(text);
            java.sql.Timestamp ts = new Timestamp(date2.getTime());
            ps=con.prepareStatement("insert into trabajadores(name,trabajadorID,usuario,horaInicio,horaFin) values ('"+name+"','"+trabajadorID+"','"+usuario+"',"+null+","+null+")");
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

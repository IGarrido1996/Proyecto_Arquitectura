package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.Calendar;
import java.text.SimpleDateFormat;
import java.text.DateFormat;
import java.sql.*;

public final class peticiones_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link href=\"css/bootstrap.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <title></title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
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
            ps=con.prepareStatement("select trabajadores.name,trabajadores.trabajadorID,peticiones.peticionesID, peticiones.fecha, peticiones.categoria, peticiones.texto, peticiones.estado from peticiones inner join peticionesTrabajadores inner join trabajadores where peticionesTrabajadores.peticionesID=peticiones.peticionesID and trabajadores.usuario='"+usuario+"' and peticionesTrabajadores.trabajadorID=trabajadores.trabajadorID");
            rs=ps.executeQuery();
        
      out.write("\n");
      out.write("            <div class=\"fila\">\n");
      out.write("            <div class=\"contenido\">\n");
      out.write("                <div class=\"card\">\n");
      out.write("                    <div class=\"registro\">\n");
      out.write("                        <h1>Peticiones</h1>\n");
      out.write("                        <hr>\n");
      out.write("                        <p>Consulte el estado de sus peticiones</p>\n");
      out.write("                        <table class=\"table table-bordered\">\n");
      out.write("                            <tr>\n");
      out.write("                                <th class=\"text-center\">Código de la petición</th>\n");
      out.write("                                <th class=\"text-center\">Fecha</th>\n");
      out.write("                                <th class=\"text-center\">Categoría</th>\n");
      out.write("                                <th class=\"text-center\">Motivo</th>\n");
      out.write("                                <th class=\"text-center\">Estado</th>\n");
      out.write("                            </tr>\n");
      out.write("                ");

                    while(rs.next()){
                
      out.write("\n");
      out.write("                <tr>\n");
      out.write("                    <td class=\"text-center\">");
      out.print( rs.getString("peticionesID"));
      out.write("</td>\n");
      out.write("                    <td class=\"text-center\">");
      out.print( rs.getString("fecha"));
      out.write("</td>\n");
      out.write("                    <td class=\"text-center\">");
      out.print( rs.getString("categoria"));
      out.write("</td>\n");
      out.write("                    <td class=\"text-center\">");
      out.print( rs.getString("texto"));
      out.write("</td>\n");
      out.write("                    <td class=\"text-center\">");
      out.print( rs.getString("estado"));
      out.write("</td>\n");
      out.write("                </tr>\n");
      out.write("                ");
}
      out.write("\n");
      out.write("            </table>\n");
      out.write("            <div class=\"card\"> Aquí podrás hacer una petición</div> \n");
      out.write("        <div class=\"cardMedio\">\n");
      out.write("        <form action=\"\" method=\"post\">\n");
      out.write("            <button class=\"restablecer\" type=\"reset\">Restablecer campos</button><br>\n");
      out.write("            <h2>Escriba los campos de la petición</h2>\n");
      out.write("            <label>Código de la petición:</label><br><br>\n");
      out.write("            <input type=\"text\" id=\"codigo\" class=\"casilla\" name=\"txtpeticionesID\" required max = \"1000000\" pattern=\"[0-9]+\"><br><br>\n");
      out.write("            <label>Fecha:</label><br><br>\n");
      out.write("            <input type=\"text\" id=\"fecha\" class=\"casilla\" name=\"txtfecha\" required  maxlength=\"15\"><br><br>\n");
      out.write("            <label>Categoría:</label><br><br>\n");
      out.write("            <input type=\"text\" id=\"categoria\" class=\"casilla\" name=\"txtcategoria\" required  maxlength=\"30\"><br><br>\n");
      out.write("            <label>Justificación:</label><br><br>\n");
      out.write("            <input type=\"text\" id=\"justificacion\" class=\"casilla\" name=\"txttexto\" required  maxlength=\"15\" pattern=\"[A-Z][a-z]+(\\s[A-Za-z]+)*\"><br><br>\n");
      out.write("            <button onsubmit class=\"button\">Enviar Petición</button>\n");
      out.write("        </form>\n");
      out.write("        </div>\n");
      out.write("            <br>\n");
      out.write("            <input type=\"button\" onclick=\"history.back()\" name=\"volver atrás\" value=\"volver atrás\">\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");

        String peticionesID,categoria,texto;
        peticionesID=request.getParameter("txtpeticionesID");
        categoria=request.getParameter("txtcategoria");
        texto=request.getParameter("txttexto");
        
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); 
        Calendar cal = Calendar.getInstance(); 
        
        
        java.util.Date date = new java.util.Date();  
        String tiempo = dateFormat.format(date);
        java.sql.Date date2 = new java.sql.Date(date.getTime());
        
        if(categoria!=null && peticionesID!=null){
            ps=con.prepareStatement("insert into peticiones(peticionesID,fecha,categoria,texto,estado)values('"+peticionesID+"','"+date2+"','"+categoria+"','"+texto+"','en espera')");
            ps.executeUpdate();
            response.sendRedirect("inicioEmpleados.jsp");
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

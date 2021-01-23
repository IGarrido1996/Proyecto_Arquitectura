package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class calendario_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!doctype html>\n");
      out.write("<html lang=\"es\">\n");
      out.write("\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0\">\n");
      out.write("    <meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"css/styles.css\">\n");
      out.write("\n");
      out.write("    <title>Calendario Laboral</title>\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("    <h1 class=\"title\">Calendario Laboral</h1>\n");
      out.write("\n");
      out.write("    <div class=\"calendar\">\n");
      out.write("        <div class=\"calendar__info\">\n");
      out.write("            <div class=\"calendar__prev\" id=\"prev-month\">&#9664;</div>\n");
      out.write("            <div class=\"calendar__month\" id=\"month\"></div>\n");
      out.write("            <div class=\"calendar__year\" id=\"year\"></div>\n");
      out.write("            <div class=\"calendar__next\" id=\"next-month\">&#9654;</div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <div class=\"calendar__week\">\n");
      out.write("            <div class=\"calendar__day calendar__item\">Lun</div>\n");
      out.write("            <div class=\"calendar__day calendar__item\">Mar</div>\n");
      out.write("            <div class=\"calendar__day calendar__item\">Mie</div>\n");
      out.write("            <div class=\"calendar__day calendar__item\">Jue</div>\n");
      out.write("            <div class=\"calendar__day calendar__item\">Vie</div>\n");
      out.write("            <div class=\"calendar__day calendar__item\">Sab</div>\n");
      out.write("            <div class=\"calendar__day calendar__item\">Dom</div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <div class=\"calendar__dates\" id=\"dates\">\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <br>\n");
      out.write("    <div class=\"calendar_event\" id=\"text_event\">\n");
      out.write("        <form id=\"formEvento\">\n");
      out.write("            <label id=\"labelFecha\"></label><br>\n");
      out.write("            <input type=\"textarea\" id=\"textEvento\"><br>\n");
      out.write("            <input type=\"submit\" value=\"Enviar\" onclick=\"enviaEvento()\">\n");
      out.write("        </form>\n");
      out.write("\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <script src=\"js/scripts.js\"></script>\n");
      out.write("</body>\n");
      out.write("\n");
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

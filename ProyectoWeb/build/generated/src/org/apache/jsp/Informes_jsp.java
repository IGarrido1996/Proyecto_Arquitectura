package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import RegistroDatos.CrearArchivo;
import RegistroDatos.CrearArchivo.*;

public final class Informes_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <title>Informe</title>\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        <h1>Generador de Informes.</h1>\r\n");
      out.write("        \r\n");
      out.write("\r\n");
      out.write("        <form>\r\n");
      out.write("\r\n");
      out.write("            <label> Tipo de informe</label> <br>\r\n");
      out.write("            <div id=\"divTipo\">\r\n");
      out.write("                <select id=\"seleccionaTipo\">\r\n");
      out.write("\r\n");
      out.write("                </select>\r\n");
      out.write("\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("            <br>\r\n");
      out.write("            <label> Periodo</label> <br>\r\n");
      out.write("            <div id=\"divPeriodo\">\r\n");
      out.write("                <select id=\"seleccionaPeriodo\">\r\n");
      out.write("\r\n");
      out.write("                </select>\r\n");
      out.write("\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("            <br>\r\n");
      out.write("            <button id=\"botonInforme\" onclick=\"mostrarPrueba();return false\"> Genera Informe</button>\r\n");
      out.write("\r\n");
      out.write("            <br>\r\n");
      out.write("            <br>\r\n");
      out.write("            <div id=\"textoInforme\"> </div>\r\n");
      out.write("\r\n");
      out.write("        </form>\r\n");
      out.write("        ");
      out.print( CrearArchivo.generartxt(" "));
      out.write("\r\n");
      out.write("    </body>\r\n");
      out.write("    <script>\r\n");
      out.write("        var tipo = [\"empresa\", \"proyecto\", \"empleado\"];\r\n");
      out.write("        var periodo = [\"semanal\", \"mensual\", \"anual\"];\r\n");
      out.write("        var prueba = \"Esto es una prueba\";\r\n");
      out.write(" \r\n");
      out.write("\r\n");
      out.write("        var selectTipo = document.getElementById(\"seleccionaTipo\");\r\n");
      out.write("\r\n");
      out.write("        const fragment = document.createDocumentFragment();\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        for (i = 0; i < tipo.length; i++) {\r\n");
      out.write("            var opt = document.createElement(\"option\");\r\n");
      out.write("            opt.setAttribute(\"value\", tipo[i]);\r\n");
      out.write("            opt.text = tipo[i];\r\n");
      out.write("            selectTipo.appendChild(opt);\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        selectTipo.appendChild(fragment);\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        var selectPeriodo = document.getElementById(\"seleccionaPeriodo\");\r\n");
      out.write("\r\n");
      out.write("        for (i = 0; i < periodo.length; i++) {\r\n");
      out.write("            var opt = document.createElement(\"option\");\r\n");
      out.write("            opt.setAttribute(\"value\", periodo[i]);\r\n");
      out.write("            opt.text = periodo[i];\r\n");
      out.write("            selectPeriodo.appendChild(opt);\r\n");
      out.write("            console.log(\"hola\");\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        selectPeriodo.appendChild(fragment);\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        var divTextoInforme = document.getElementById(\"textoInforme\");\r\n");
      out.write("\r\n");
      out.write("        var texto = document.createElement(\"textarea\");\r\n");
      out.write("        texto.readOnly = true;\r\n");
      out.write("        texto.setAttribute(\"id\", \"miInforme\");\r\n");
      out.write("        texto.setAttribute(\"rows\", \"10\");\r\n");
      out.write("        texto.setAttribute(\"cols\", \"40\");\r\n");
      out.write("        texto.setAttribute(\"style\", \"width:180px\");\r\n");
      out.write("        divTextoInforme.appendChild(texto);\r\n");
      out.write("        \r\n");
      out.write("       \r\n");
      out.write("        \r\n");
      out.write("        \r\n");
      out.write("       \r\n");
      out.write("\r\n");
      out.write("        function generaInforme() {\r\n");
      out.write("            \r\n");
      out.write("            var informe;\r\n");
      out.write("\r\n");
      out.write("            var indiceTipo = document.getElementById(\"seleccionaTipo\").selectedIndex;\r\n");
      out.write("\r\n");
      out.write("            var valorTipo = document.getElementById(\"seleccionaTipo\").options[indiceTipo].value;\r\n");
      out.write("            informe = \"Tipo: \" + valorTipo;\r\n");
      out.write("\r\n");
      out.write("            var indicePeriodo = document.getElementById(\"seleccionaTipo\").selectedIndex;\r\n");
      out.write("            var valorPeriodo = document.getElementById(\"seleccionaPeriodo\").options[indicePeriodo].value;\r\n");
      out.write("            informe += \"\\n\" + \"Periodo: \" + valorPeriodo;\r\n");
      out.write("\r\n");
      out.write("            var muestra = document.getElementById(\"textoInforme\");\r\n");
      out.write("            muestra.textContent = informe;\r\n");
      out.write("            console.log(informe);\r\n");
      out.write("            \r\n");
      out.write("\r\n");
      out.write("            \r\n");
      out.write("           \r\n");
      out.write("        }\r\n");
      out.write("        function generaDatos() {\r\n");
      out.write("            var dato;\r\n");
      out.write("            dato= \"\\n\"+\"Tipo de dato\"\r\n");
      out.write("            dato=\"\\n\"+\"Lugar\"\r\n");
      out.write("            var mostrar = document.getElementById(\"textoInforme\");\r\n");
      out.write("            mostrar.textContent = dato;\r\n");
      out.write("            console.log(dato);\r\n");
      out.write("        }\r\n");
      out.write("    </script>\r\n");
      out.write("\r\n");
      out.write("</html>\r\n");
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

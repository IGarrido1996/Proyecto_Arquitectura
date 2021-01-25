package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class informes_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Informe</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1>Generador de Informes.</h1>\n");
      out.write("        \n");
      out.write("\n");
      out.write("        <form>\n");
      out.write("\n");
      out.write("            <label> Tipo de informe</label> <br>\n");
      out.write("            <div id=\"divTipo\">\n");
      out.write("                <select id=\"seleccionaTipo\">\n");
      out.write("\n");
      out.write("                </select>\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <br>\n");
      out.write("            <label> Periodo</label> <br>\n");
      out.write("            <div id=\"divPeriodo\">\n");
      out.write("                <select id=\"seleccionaPeriodo\">\n");
      out.write("\n");
      out.write("                </select>\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <br>\n");
      out.write("            <button id=\"botonInforme\" onclick=\"mostrarPrueba();return false\"> Genera Informe</button>\n");
      out.write("\n");
      out.write("            <br>\n");
      out.write("            <br>\n");
      out.write("            <div id=\"textoInforme\"> </div>\n");
      out.write("\n");
      out.write("        </form>\n");
      out.write("        ");
      out.print( CrearArchivo.generartxt(" "));
      out.write("\n");
      out.write("    </body>\n");
      out.write("    <script>\n");
      out.write("        var tipo = [\"empresa\", \"proyecto\", \"empleado\"];\n");
      out.write("        var periodo = [\"semanal\", \"mensual\", \"anual\"];\n");
      out.write("        var prueba = \"Esto es una prueba\";\n");
      out.write(" \n");
      out.write("\n");
      out.write("        var selectTipo = document.getElementById(\"seleccionaTipo\");\n");
      out.write("\n");
      out.write("        const fragment = document.createDocumentFragment();\n");
      out.write("\n");
      out.write("\n");
      out.write("        for (i = 0; i < tipo.length; i++) {\n");
      out.write("            var opt = document.createElement(\"option\");\n");
      out.write("            opt.setAttribute(\"value\", tipo[i]);\n");
      out.write("            opt.text = tipo[i];\n");
      out.write("            selectTipo.appendChild(opt);\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        selectTipo.appendChild(fragment);\n");
      out.write("\n");
      out.write("\n");
      out.write("        var selectPeriodo = document.getElementById(\"seleccionaPeriodo\");\n");
      out.write("\n");
      out.write("        for (i = 0; i < periodo.length; i++) {\n");
      out.write("            var opt = document.createElement(\"option\");\n");
      out.write("            opt.setAttribute(\"value\", periodo[i]);\n");
      out.write("            opt.text = periodo[i];\n");
      out.write("            selectPeriodo.appendChild(opt);\n");
      out.write("            console.log(\"hola\");\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        selectPeriodo.appendChild(fragment);\n");
      out.write("\n");
      out.write("\n");
      out.write("        var divTextoInforme = document.getElementById(\"textoInforme\");\n");
      out.write("\n");
      out.write("        var texto = document.createElement(\"textarea\");\n");
      out.write("        texto.readOnly = true;\n");
      out.write("        texto.setAttribute(\"id\", \"miInforme\");\n");
      out.write("        texto.setAttribute(\"rows\", \"10\");\n");
      out.write("        texto.setAttribute(\"cols\", \"40\");\n");
      out.write("        texto.setAttribute(\"style\", \"width:180px\");\n");
      out.write("        divTextoInforme.appendChild(texto);\n");
      out.write("        \n");
      out.write("       \n");
      out.write("        \n");
      out.write("        \n");
      out.write("       \n");
      out.write("\n");
      out.write("        function generaInforme() {\n");
      out.write("            \n");
      out.write("            var informe;\n");
      out.write("\n");
      out.write("            var indiceTipo = document.getElementById(\"seleccionaTipo\").selectedIndex;\n");
      out.write("\n");
      out.write("            var valorTipo = document.getElementById(\"seleccionaTipo\").options[indiceTipo].value;\n");
      out.write("            informe = \"Tipo: \" + valorTipo;\n");
      out.write("\n");
      out.write("            var indicePeriodo = document.getElementById(\"seleccionaTipo\").selectedIndex;\n");
      out.write("            var valorPeriodo = document.getElementById(\"seleccionaPeriodo\").options[indicePeriodo].value;\n");
      out.write("            informe += \"\\n\" + \"Periodo: \" + valorPeriodo;\n");
      out.write("\n");
      out.write("            var muestra = document.getElementById(\"textoInforme\");\n");
      out.write("            muestra.textContent = informe;\n");
      out.write("            console.log(informe);\n");
      out.write("            \n");
      out.write("\n");
      out.write("            \n");
      out.write("           \n");
      out.write("        }\n");
      out.write("        function generaDatos() {\n");
      out.write("            var dato;\n");
      out.write("            dato= \"\\n\"+\"Tipo de dato\"\n");
      out.write("            dato=\"\\n\"+\"Lugar\"\n");
      out.write("            var mostrar = document.getElementById(\"textoInforme\");\n");
      out.write("            mostrar.textContent = dato;\n");
      out.write("            console.log(dato);\n");
      out.write("        }\n");
      out.write("    </script>\n");
      out.write("\n");
      out.write("</html>");
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

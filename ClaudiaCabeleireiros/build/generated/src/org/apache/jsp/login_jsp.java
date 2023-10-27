package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<html lang='pt-br'>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Tela Login</title>\n");
      out.write("        <style type=\"text/css\">\n");
      out.write("            \n");
      out.write("            .cor{\n");
      out.write("                color: #e31e6e;\n");
      out.write("            }\n");
      out.write("            img{\n");
      out.write("                margin-right: 25px;\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("        </style>\n");
      out.write("        <script language=\"javascript\" >\n");
      out.write("            function validaForm(){\n");
      out.write("                formulario = document.formularioLogin;\n");
      out.write("                if(formulario.login.value==\"\"){\n");
      out.write("                    alert(\"O campo Login deve ser preenchido!\");\n");
      out.write("                    formulario.login.focus();\n");
      out.write("                    return false;\n");
      out.write("                }\n");
      out.write("                if(formulario.senha.value==\"\"){\n");
      out.write("                    alert(\"O campo Senha deve ser preenchido!\");\n");
      out.write("                    formulario.senha.focus();\n");
      out.write("                    return false;\n");
      out.write("                }\n");
      out.write("\n");
      out.write("\n");
      out.write("                return true;\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <br><br><br><br>   \n");
      out.write("    <center>\n");
      out.write("        <form action=\"efetuarLogin.do\" method=\"post\" name=\"formularioLogin\" onsubmit=\"return validaForm();\">\n");
      out.write("            <table width=\"300\" border=\"0\">\n");
      out.write("                <tr>\n");
      out.write("                    <td rowspan=\"4\" width=\"150\"><br>\n");
      out.write("                        <img src=\"imagens/cadeado.png\">\n");
      out.write("                    </td>\n");
      out.write("                    <td>\n");
      out.write("                        <br><br><br>\n");
      out.write("                    </td>\n");
      out.write("                    <td>\n");
      out.write("\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td class=\"cor\">\n");
      out.write("                        Login:\n");
      out.write("                    </td>\n");
      out.write("                    <td>\n");
      out.write("                        <input type=\"text\" name=\"login\" size=\"20\">\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td class=\"cor\">\n");
      out.write("                        Senha:\n");
      out.write("                    </td>\n");
      out.write("                    <td>\n");
      out.write("                        <input type=\"password\" name=\"senha\" size=\"20\">\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>\n");
      out.write("\n");
      out.write("                    </td>\n");
      out.write("                    <td>\n");
      out.write("                        <input type=\"submit\" value=\"Entrar\">\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("            </table>\n");
      out.write("        </form>\n");
      out.write("    </center>\n");
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

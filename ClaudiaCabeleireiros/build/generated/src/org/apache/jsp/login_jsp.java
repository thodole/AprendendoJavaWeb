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

      out.write("\r\n");
      out.write("\r\n");
      out.write("<html lang='pt-br'>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <title>Tela Login</title>\r\n");
      out.write("        <style type=\"text/css\">\r\n");
      out.write("            \r\n");
      out.write("            .cor{\r\n");
      out.write("                color: #e31e6e;\r\n");
      out.write("            }\r\n");
      out.write("            img{\r\n");
      out.write("                margin-right: 25px;\r\n");
      out.write("            }\r\n");
      out.write("            button{\r\n");
      out.write("                cursor: pointer;\r\n");
      out.write("            }\r\n");
      out.write("            \r\n");
      out.write("        </style>\r\n");
      out.write("        <script language=\"javascript\" >\r\n");
      out.write("            function validaForm(){\r\n");
      out.write("                formulario = document.formularioLogin;\r\n");
      out.write("                if(formulario.login.value==\"\"){\r\n");
      out.write("                    alert(\"O campo Login deve ser preenchido!\");\r\n");
      out.write("                    formulario.login.focus();\r\n");
      out.write("                    return false;\r\n");
      out.write("                }\r\n");
      out.write("                if(formulario.senha.value==\"\"){\r\n");
      out.write("                    alert(\"O campo Senha deve ser preenchido!\");\r\n");
      out.write("                    formulario.senha.focus();\r\n");
      out.write("                    return false;\r\n");
      out.write("                }\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("                return true;\r\n");
      out.write("            }\r\n");
      out.write("        </script>\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        <br><br><br><br>   \r\n");
      out.write("    <center>\r\n");
      out.write("        <form action=\"efetuarLogin.do\" method=\"post\" name=\"formularioLogin\" onsubmit=\"return validaForm();\">\r\n");
      out.write("            <table width=\"300\" border=\"0\">\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <td rowspan=\"4\" width=\"150\"><br>\r\n");
      out.write("                        <img src=\"imagens/cadeado.png\">\r\n");
      out.write("                    </td>\r\n");
      out.write("                    <td>\r\n");
      out.write("                        <br><br><br>\r\n");
      out.write("                    </td>\r\n");
      out.write("                    <td>\r\n");
      out.write("\r\n");
      out.write("                    </td>\r\n");
      out.write("                </tr>\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <td class=\"cor\">\r\n");
      out.write("                        Login:\r\n");
      out.write("                    </td>\r\n");
      out.write("                    <td>\r\n");
      out.write("                        <input type=\"text\" name=\"login\" size=\"20\">\r\n");
      out.write("                    </td>\r\n");
      out.write("                </tr>\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <td class=\"cor\">\r\n");
      out.write("                        Senha:\r\n");
      out.write("                    </td>\r\n");
      out.write("                    <td>\r\n");
      out.write("                        <input type=\"password\" name=\"senha\" size=\"20\">\r\n");
      out.write("                    </td>\r\n");
      out.write("                </tr>\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <td>\r\n");
      out.write("\r\n");
      out.write("                    </td>\r\n");
      out.write("                    <td>\r\n");
      out.write("                        <button type=\"submit\">  Entrar </button>\r\n");
      out.write("                    </td>\r\n");
      out.write("                </tr>\r\n");
      out.write("            </table>\r\n");
      out.write("        </form>\r\n");
      out.write("    </center>\r\n");
      out.write("    </body>\r\n");
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

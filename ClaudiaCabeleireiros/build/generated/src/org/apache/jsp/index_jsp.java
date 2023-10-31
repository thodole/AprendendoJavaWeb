package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import modelo.Menu;
import modelo.Usuario;
import modelo.PerfilDAO;
import java.util.ArrayList;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(2);
    _jspx_dependants.add("/menu.jsp");
    _jspx_dependants.add("/rodape.jsp");
  }

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
      out.write("<html pt-br>\r\n");
      out.write("    <head>\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css\" integrity=\"sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO\" crossorigin=\"anonymous\">\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <title>Página Inicial</title>\r\n");
      out.write("        <style type=\"text/css\">\r\n");
      out.write("            \r\n");
      out.write("            .fundo {\r\n");
      out.write("                background-image:url('imagens/banner.jpg');    \r\n");
      out.write("                background-size:cover;\r\n");
      out.write("                background-attachment: fixed;\r\n");
      out.write("                width:100%;\r\n");
      out.write("                height:100%;\r\n");
      out.write("                z-index: 1;\r\n");
      out.write("            }\r\n");
      out.write("            \r\n");
      out.write("   \r\n");
      out.write("            .dropdown-menu{\r\n");
      out.write("                padding: 5px;\r\n");
      out.write("            }\r\n");
      out.write("            \r\n");
      out.write("            a.navbar-brand{\r\n");
      out.write("                margin-right: 50%;\r\n");
      out.write("            }\r\n");
      out.write("            \r\n");
      out.write("            .nav-item{\r\n");
      out.write("                padding-top: 18px; \r\n");
      out.write("            }\r\n");
      out.write("            \r\n");
      out.write("            .nav justify-content-end{\r\n");
      out.write("                z-index: 3;\r\n");
      out.write("            }\r\n");
      out.write("            \r\n");
      out.write("            .banner{\r\n");
      out.write("                \r\n");
      out.write("                display: flex;\r\n");
      out.write("                justify-content: center;\r\n");
      out.write("                \r\n");
      out.write("            }\r\n");
      out.write("            \r\n");
      out.write("            .banner .banner-text{\r\n");
      out.write("                margin: 150px;\r\n");
      out.write("                text-align: center;\r\n");
      out.write("                padding: 0 90px;\r\n");
      out.write("            }\r\n");
      out.write("            \r\n");
      out.write("            .banner .banner-text h1{\r\n");
      out.write("                font-size: 96px;\r\n");
      out.write("                color: #f60b8a;\r\n");
      out.write("            }\r\n");
      out.write("            \r\n");
      out.write("            .banner .banner-text p{\r\n");
      out.write("                font-size: 20px;\r\n");
      out.write("               color: white;\r\n");
      out.write("            }\r\n");
      out.write("            \r\n");
      out.write("            .nav-link{\r\n");
      out.write("                color: #fe70bd;\r\n");
      out.write("            }\r\n");
      out.write("            \r\n");
      out.write("            .nav-link::after{\r\n");
      out.write("                \r\n");
      out.write("            }\r\n");
      out.write("        </style>\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        <header class=\"fundo\">\r\n");
      out.write("            <div class=\"sombra\"></div> \r\n");
      out.write("                <div align=\"center\">\r\n");
      out.write("                    <table>\r\n");
      out.write("                        <ul class=\"nav justify-content-end\">\r\n");
      out.write("                            <a class=\"navbar-brand\" href=\"#\">\r\n");
      out.write("                              <img src=\"imagens/logo.jpg\" alt=\"Logo\" width=\"100%\" height=\"70\" class=\"d-inline-block align-text-top\">\r\n");
      out.write("                            </a>\r\n");
      out.write("                             <li class=\"nav-item\">\r\n");
      out.write("                                <a class=\"nav-link dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\" role=\"button\" aria-haspopup=\"true\" aria-expanded=\"false\">Logado</a>\r\n");
      out.write("                                <div class=\"dropdown-menu\">\r\n");
      out.write("                                  <a class=\"dropdown-item\" href=\"#\">");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

    Usuario usuario = new Usuario();
    try{
        usuario = (Usuario) session.getAttribute("usuario");
        out.print(usuario.getNome_usuario()+ "  <a href='sair.jsp'>Sair</a><p>");
        if (usuario == null){
            response.sendRedirect("login.jsp");
    }

      out.write('\n');
      out.write('\n');

            PerfilDAO perfilBD = new PerfilDAO();
            perfilBD.conectar();
            ArrayList<Menu> listaMenu = perfilBD.menusVinculados(usuario.getIdPerfil());
            for(Menu menu: listaMenu){

      out.write("\n");
      out.write("\n");
      out.write("            ");

            }
            perfilBD.desconectar();

      out.write("\n");
      out.write("        \n");

    } catch(Exception e){
        out.print(e);
        response.sendRedirect("login.jsp");
    }
    

      out.write('\n');
      out.write("</a>\r\n");
      out.write("                                </div>\r\n");
      out.write("                              </li>\r\n");
      out.write("                            <li class=\"nav-item\">\r\n");
      out.write("                              <a class=\"nav-link active\" href=\"listarUsuario.jsp\">Usuário</a>\r\n");
      out.write("                            </li>\r\n");
      out.write("                            <li class=\"nav-item\">\r\n");
      out.write("                              <a class=\"nav-link\" href=\"listarPerfil.jsp\">Perfil</a>\r\n");
      out.write("                            </li>\r\n");
      out.write("                            <li class=\"nav-item\">\r\n");
      out.write("                              <a class=\"nav-link \" href=\"listarServico.jsp\">Serviços</a>\r\n");
      out.write("                            </li>\r\n");
      out.write("                            <li class=\"nav-item\">\r\n");
      out.write("                              <a class=\"nav-link \" href=\"listarCliente.jsp\">Cliente</a>\r\n");
      out.write("                            </li>\r\n");
      out.write("                          </ul>\r\n");
      out.write("                    </table>\r\n");
      out.write("                </div>\r\n");
      out.write("                        <section class=\"banner\">\r\n");
      out.write("                            <div class=\"banner-text\">\r\n");
      out.write("                                <h1> Claúdia Cabelereiros</h1>\r\n");
      out.write("                                <p>Venha ser a sua melhor versão</p>\r\n");
      out.write("                                <button type=\"button\" class=\"btn btn-outline-dark\">Marque seu horário</button>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </section>\r\n");
      out.write("            \r\n");
      out.write("            \r\n");
      out.write("                                                   \r\n");
      out.write("       </header>\r\n");
      out.write("                                \r\n");
      out.write("    <sectiion class=\"faca\">\r\n");
      out.write("        <div class=\"container\">\r\n");
      out.write("            <div class=\"faca-txt\">\r\n");
      out.write("                <h3>Torne seus cabelos mais lindos</h3>\r\n");
      out.write("                <p>temos os melhores serviços de cabelo,manicúre e pedicúre, para voce se \r\n");
      out.write("                    tornar a mulher perfefeita</p>\r\n");
      out.write("                <button type=\"button\" class=\"btn btn-outline-dark\">Marque seu horário</button>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"faca-img\">\r\n");
      out.write("                <img src=\"imagens/img.jpg\" alt=\"\">\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        \r\n");
      out.write("        \r\n");
      out.write("        \r\n");
      out.write("        \r\n");
      out.write("        \r\n");
      out.write("    </sectiion>                    \r\n");
      out.write("                        <tr>\r\n");
      out.write("                    <td> ");
      out.write("<table align=\"center\">\n");
      out.write("    <tr>\n");
      out.write("        <td><img src=\"imagens/rodape.jpg\" alt=\"Rodape\" width=\"1315\"/></td>\n");
      out.write("    </tr>\n");
      out.write("</table>\n");
      out.write(" </td>\r\n");
      out.write("                </tr>\r\n");
      out.write("    </body>\r\n");
      out.write("    <script src=\"https://code.jquery.com/jquery-3.3.1.slim.min.js\" integrity=\"sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo\" crossorigin=\"anonymous\"></script>\r\n");
      out.write("    <script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js\" integrity=\"sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49\" crossorigin=\"anonymous\"></script>\r\n");
      out.write("    <script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js\" integrity=\"sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy\" crossorigin=\"anonymous\"></script>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
      out.write("\r\n");
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

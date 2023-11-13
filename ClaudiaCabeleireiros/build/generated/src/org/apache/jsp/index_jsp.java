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
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/menu.jsp");
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
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"CSS/style.css\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css\" integrity=\"sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg==\" crossorigin=\"anonymous\" referrerpolicy=\"no-referrer\" />\r\n");
      out.write("        <title>Página Inicial</title>\r\n");
      out.write("        \r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        <header class=\"fundo\">\r\n");
      out.write("            <div class=\"sombra\"></div> \r\n");
      out.write("                <div align=\"center\">\r\n");
      out.write("                    <table>\r\n");
      out.write("                        <ul class=\"nav justify-content-end\">\r\n");
      out.write("                            <a class=\"navbar-brand\" href=\"#\">\r\n");
      out.write("                              <img src=\"imagens/logo_semfundo.png\" alt=\"Logo\" width=\"100%\" height=\"50\"  class=\"d-inline-block align-text-top\">\r\n");
      out.write("                            </a>\r\n");
      out.write("                             <li class=\"nav-item\">\r\n");
      out.write("                                <a class=\"nav-link dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\" role=\"button\" aria-haspopup=\"true\" aria-expanded=\"false\">Acesso</a>\r\n");
      out.write("                                <div class=\"dropdown-menu\">\r\n");
      out.write("                                  <a class=\"dropdown-item\" href=\"#\">");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

    Usuario usuario = new Usuario();
    try{
        usuario = (Usuario) session.getAttribute("usuario");
        out.print(usuario.getNome_usuario()+ "  <a href='sair.jsp'>Sair</a><p>");
        if (usuario == null){
            response.sendRedirect("login.jsp");
    }

      out.write("\r\n");
      out.write("\r\n");

            PerfilDAO perfilBD = new PerfilDAO();
            perfilBD.conectar();
            ArrayList<Menu> listaMenu = perfilBD.menusVinculados(usuario.getIdPerfil());
            for(Menu menu: listaMenu){

      out.write("\r\n");
      out.write("\r\n");
      out.write("            ");

            }
            perfilBD.desconectar();

      out.write("\r\n");
      out.write("        \r\n");

    } catch(Exception e){
        out.print(e);
        response.sendRedirect("login.jsp");
    }
    

      out.write('\r');
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
      out.write("                                <p>Onde a Beleza se Encontra com o Bem-Estar</p>\r\n");
      out.write("                                <button type=\"button\" class=\"btn btn-outline-dark\">Marque seu horário</button>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </section>\r\n");
      out.write("                                      \r\n");
      out.write("       </header>\r\n");
      out.write("                                \r\n");
      out.write("    ");
      out.write("                            \r\n");
      out.write("    <sectiion class=\"faca\">\r\n");
      out.write("        <div class=\"container\">\r\n");
      out.write("            <div class=\"faca-txt\">\r\n");
      out.write("                <h3>Venha ser a sua melhor versão</h3>\r\n");
      out.write("                <p>temos os melhores serviços de cabelo,manicúre e pedicúre, para voce se \r\n");
      out.write("                    tornar a mulher perfefeita</p>\r\n");
      out.write("                <button type=\"button\" class=\"btn btn-outline-dark1\">Marque seu horário</button>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"faca-img\">\r\n");
      out.write("                <img src=\"imagens/img.jpg\" alt=\"\" class=\"img\">\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </sectiion>\r\n");
      out.write("    \r\n");
      out.write("    ");
      out.write("\r\n");
      out.write("    \r\n");
      out.write("    <sectiion class=\"faca\">\r\n");
      out.write("        <div class=\"container\">\r\n");
      out.write("            <div class=\"faca-img\">\r\n");
      out.write("                <img src=\"imagens/img_2.jpg\" alt=\"\" class=\"img2\">\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"faca-txt2\">\r\n");
      out.write("                <h3>Texto exemplo</h3>\r\n");
      out.write("                <p>temos os melhores serviços de cabelo,manicúre e pedicúre, para voce se \r\n");
      out.write("                    tornar a mulher perfefeita</p>\r\n");
      out.write("                <button type=\"button\" class=\"btn btn-outline-dark1\">Marque seu horário</button>\r\n");
      out.write("            </div>\r\n");
      out.write("            \r\n");
      out.write("        </div>\r\n");
      out.write("    </sectiion>\r\n");
      out.write("    \r\n");
      out.write("    ");
      out.write("\r\n");
      out.write("    <section class=\"depoimentos\">\r\n");
      out.write("        <div class=\"container\">\r\n");
      out.write("            <h3>Nossos Depoimentos</h3>\r\n");
      out.write("            <p> O que nossos clientes falam de nós</p>\r\n");
      out.write("            \r\n");
      out.write("            <div class=\"cards\">\r\n");
      out.write("                ");
      out.write("\r\n");
      out.write("                <div class=\"card-item\">\r\n");
      out.write("                    <img src=\"imagens/card1.jpg\">\r\n");
      out.write("                    <p class=\"n-user\">Maria Cristina</p>\r\n");
      out.write("                    <p class=\"depoimento-user\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. \r\n");
      out.write("                        Proin quis ligula quis ex tempor ullamcorper. Integer eu auctor diam. \r\n");
      out.write("                        Ut bibendum pulvinar magna eu tempor. Maecenas volutpat metus et porttitor maximus.\r\n");
      out.write("                        Praesent imperdiet felis augue, quis sodales nisi ultrices et. In eu maximus neque. \r\n");
      out.write("                        In venenatis justo a fringilla aliquam.\r\n");
      out.write("                        Quisque sit amet ornare ante. Morbi aliquet tempor maximus.\r\n");
      out.write("                    </p>\r\n");
      out.write("                    <div class=\"star\">\r\n");
      out.write("                        <i class=\"fa fa-star\" aria-hidden=\"true\"></i>\r\n");
      out.write("                        <i class=\"fa fa-star\" aria-hidden=\"true\"></i>\r\n");
      out.write("                        <i class=\"fa fa-star\" aria-hidden=\"true\"></i>\r\n");
      out.write("                        <i class=\"fa fa-star\" aria-hidden=\"true\"></i>\r\n");
      out.write("                        <i class=\"fa fa-star\" aria-hidden=\"true\"></i>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                 ");
      out.write("\r\n");
      out.write("                 \r\n");
      out.write("                  ");
      out.write("\r\n");
      out.write("                <div class=\"card-item\">\r\n");
      out.write("                    <img src=\"imagens/card2.jpg\">\r\n");
      out.write("                    <p class=\"n-user\">Maria Cristina</p>\r\n");
      out.write("                    <p class=\"depoimento-user\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. \r\n");
      out.write("                        Proin quis ligula quis ex tempor ullamcorper. Integer eu auctor diam. \r\n");
      out.write("                        Ut bibendum pulvinar magna eu tempor. Maecenas volutpat metus et porttitor maximus.\r\n");
      out.write("                        Praesent imperdiet felis augue, quis sodales nisi ultrices et. In eu maximus neque. \r\n");
      out.write("                        In venenatis justo a fringilla aliquam.\r\n");
      out.write("                        Quisque sit amet ornare ante. Morbi aliquet tempor maximus.\r\n");
      out.write("                    </p>\r\n");
      out.write("                    <div class=\"star\">\r\n");
      out.write("                        <i class=\"fa fa-star\" aria-hidden=\"true\"></i>\r\n");
      out.write("                        <i class=\"fa fa-star\" aria-hidden=\"true\"></i>\r\n");
      out.write("                        <i class=\"fa fa-star\" aria-hidden=\"true\"></i>\r\n");
      out.write("                        <i class=\"fa fa-star\" aria-hidden=\"true\"></i>\r\n");
      out.write("                        <i class=\"fa fa-star-half-o\" aria-hidden=\"true\"></i>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                 ");
      out.write("\r\n");
      out.write("                 \r\n");
      out.write("                  ");
      out.write("\r\n");
      out.write("                <div class=\"card-item\">\r\n");
      out.write("                    <img src=\"imagens/card3.png\">\r\n");
      out.write("                    <p class=\"n-user\">Maria Cristina</p>\r\n");
      out.write("                    <p class=\"depoimento-user\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. \r\n");
      out.write("                        Proin quis ligula quis ex tempor ullamcorper. Integer eu auctor diam. \r\n");
      out.write("                        Ut bibendum pulvinar magna eu tempor. Maecenas volutpat metus et porttitor maximus.\r\n");
      out.write("                        Praesent imperdiet felis augue, quis sodales nisi ultrices et. In eu maximus neque. \r\n");
      out.write("                        In venenatis justo a fringilla aliquam.\r\n");
      out.write("                        Quisque sit amet ornare ante. Morbi aliquet tempor maximus.\r\n");
      out.write("                    </p>\r\n");
      out.write("                    <div class=\"star\">\r\n");
      out.write("                        <i class=\"fa fa-star\" aria-hidden=\"true\"></i>\r\n");
      out.write("                        <i class=\"fa fa-star\" aria-hidden=\"true\"></i>\r\n");
      out.write("                        <i class=\"fa fa-star\" aria-hidden=\"true\"></i>\r\n");
      out.write("                        <i class=\"fa fa-star\" aria-hidden=\"true\"></i>\r\n");
      out.write("                        <i class=\"fa fa-star-o\" aria-hidden=\"true\"></i>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                 ");
      out.write("\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        \r\n");
      out.write("        \r\n");
      out.write("        \r\n");
      out.write("    </section>\r\n");
      out.write("            \r\n");
      out.write("     <sectiion class=\"faca\">\r\n");
      out.write("        <div class=\"container\">\r\n");
      out.write("            <div class=\"faca-txt\">\r\n");
      out.write("                <h3>Melhor cuidando das suas unhas</h3>\r\n");
      out.write("                <p>As melhores profissionais para cuidar e deixar suas unhas lindas</p>\r\n");
      out.write("                <button type=\"button\" class=\"btn btn-outline-dark1\">Marque seu horário</button>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"faca-img\">\r\n");
      out.write("                <img src=\"imagens/img_3.jpg\" alt=\"\" class=\"img\">\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </sectiion>\r\n");
      out.write("            \r\n");
      out.write("            <footer class=\"footer\">\r\n");
      out.write("                <div class=\"container\">\r\n");
      out.write("                    <div calss=\"link\">\r\n");
      out.write("                        <a href=\"#\">\r\n");
      out.write("                            <i class=\"fa fa-instagram\" aria-hidden=\"true\"></i>\r\n");
      out.write("                            <i class=\"fa fa-phone\" aria-hidden=\"true\"> 93456-7432 </i> \r\n");
      out.write("                        </a>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <p class=\"desenvolvedor\">Desenvolvido: Grupo 4</p>\r\n");
      out.write("                </div>\r\n");
      out.write("            </footer>\r\n");
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

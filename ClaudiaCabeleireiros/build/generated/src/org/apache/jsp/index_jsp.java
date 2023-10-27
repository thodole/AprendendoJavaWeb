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
    _jspx_dependants = new java.util.ArrayList<String>(4);
    _jspx_dependants.add("/banner.jsp");
    _jspx_dependants.add("/menu.jsp");
    _jspx_dependants.add("/produtos.jsp");
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

      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Página Inicial</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div align=\"center\">\n");
      out.write("            <table>\n");
      out.write("                <tr>\n");
      out.write("                    <td> ");
      out.write("<table align=\"center\">\n");
      out.write("    <tr>\n");
      out.write("        <td><img src=\"imagens/banner.jpg\" alt=\"Banner\" width=\"1315\"/></td>\n");
      out.write("    </tr>\n");
      out.write("</table>\n");
      out.write(" </td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td align=\"center\" height=\"40\" valign=\"top\">\n");
      out.write("                        ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

    Usuario usuario = new Usuario();
    try{
        usuario = (Usuario) session.getAttribute("usuario");
        out.print(usuario.getNome_usuario()+ " [ <a href='sair.jsp'>SAIR</a> ] <p>");
        if (usuario == null){
            response.sendRedirect("login.jsp");
    }

      out.write("\n");
      out.write("    <table width=\"300\">\n");
      out.write("        <tr>\n");

            PerfilDAO perfilBD = new PerfilDAO();
            perfilBD.conectar();
            ArrayList<Menu> listaMenu = perfilBD.menusVinculados(usuario.getIdPerfil());
            for(Menu menu: listaMenu){

      out.write("\n");
      out.write("                <td align=\"center\" height=\"20\"> <a href=\"");
      out.print(menu.getLink() );
      out.write('"');
      out.write('>');
      out.print(menu.getNome_menu());
      out.write("</a> </td>\n");

            }
            perfilBD.desconectar();

      out.write("\n");
      out.write("        </tr>\n");
      out.write("    </table> <br>\n");

    } catch(Exception e){
        out.print(e);
        response.sendRedirect("login.jsp");
    }
    

      out.write('\n');
      out.write("\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td> ");
      out.write("<table align=\"center\">\n");
      out.write("    <tr>\n");
      out.write("        <td><img src=\"imagens/cabelo001.jpg\"/></td>\n");
      out.write("        <td><img src=\"imagens/cabelo002.jpg\"/></td>\n");
      out.write("        <td><img src=\"imagens/cabelo003.jpg\"/></td>\n");
      out.write("        <td><img src=\"imagens/cabelo004.jpg\"/></td>\n");
      out.write("    </tr>\n");
      out.write("    <tr>\n");
      out.write("        <td><img src=\"imagens/cabelo005.jpg\"/></td>\n");
      out.write("        <td><img src=\"imagens/cabelo006.jpg\"/></td>\n");
      out.write("        <td><img src=\"imagens/cabelo007.jpg\"/></td>\n");
      out.write("        <td><img src=\"imagens/cabelo008.jpg\"/></td>\n");
      out.write("    </tr>\n");
      out.write("</table>\n");
      out.write(" </td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td> ");
      out.write("<table align=\"center\">\n");
      out.write("    <tr>\n");
      out.write("        <td><img src=\"imagens/rodape.jpg\" alt=\"Rodape\" width=\"1315\"/></td>\n");
      out.write("    </tr>\n");
      out.write("</table>\n");
      out.write(" </td>\n");
      out.write("                </tr>\n");
      out.write("            </table>\n");
      out.write("        </div>\n");
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

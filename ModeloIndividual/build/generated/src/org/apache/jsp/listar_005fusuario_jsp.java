package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import modelo.Usuario;
import modelo.UsuarioDAO;
import java.util.ArrayList;
import java.sql.*;

public final class listar_005fusuario_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/banner.jsp");
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

      out.write('\n');
      out.write('\n');
      out.write('\n');
      out.write('\n');
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"\n");
      out.write("    \"http://www.w3.org/TR/html4/loose.dtd\">\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div align=\"center\">\n");
      out.write("            <table width=\"760\" border=\"1\">\n");
      out.write("                <tr>\n");
      out.write("                    <td width=\"760\" height=\"150\">\n");
      out.write("                        ");
      out.write("<img src=\"imagens/banner.jpg\" alt=\"Banner\"/>");
      out.write("\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td width=\"760\" height=\"20\" valign=\"top\">\n");
      out.write("                        ");
      out.write(" \n");
      out.write("                         <a href=\"form_inserir_usuario.jsp\">Inserir Usuário</a> | <a href=\"form_inserir_menu.jsp\">Inserir Menu</a> | <a href=\"form_inserir_perfil.jsp\">Inserir Perfil</a> |  <a href=\"listar_usuario.jsp\">Listar Usuário</a> |  <a href=\"listar_menu.jsp\">Listar Menu</a> |  <a href=\"listar_perfil.jsp\">Listar Perfil</a>\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td width=\"760\" height=\"330\">\n");
      out.write("                        <div align=\"center\">\n");
      out.write("                            <h3>Lista de Usuários ( <img src=\"imagens/novo.png\" align=\"top\"><a href=\"form_inserir_usuario.jsp\">Novo</a> )</h3>\n");
      out.write("                            <table width=\"550\" border=\"1\">\n");
      out.write("                                <tr bgcolor=\"#d3d3d3\">\n");
      out.write("                                    <td>ID</td>\n");
      out.write("                                    <td>NOME</td>\n");
      out.write("                                    <td>LOGIN</td>\n");
      out.write("                                    <td>PERFIL</td>\n");
      out.write("                                    <td>ALTERAR</td>\n");
      out.write("                                    <td>EXCLUIR</td>\n");
      out.write("                                </tr>\n");
      out.write("                                ");
                                            
                                            try {
                                                UsuarioDAO uDB = new UsuarioDAO();
                                                ArrayList<Usuario> lista;
                                                uDB.conectar();
                                                lista = uDB.listar();
                                                for(Usuario u:lista){
                                                    
      out.write("\n");
      out.write("                                                    <tr>\n");
      out.write("                                                        <td>");
      out.print(u.getId() );
      out.write("</td>\n");
      out.write("                                                        <td>");
      out.print(u.getNome() );
      out.write("</td>\n");
      out.write("                                                        <td>");
      out.print(u.getLogin() );
      out.write("</td>\n");
      out.write("                                                        <td align=\"center\">");
      out.write(" --- </td>\n");
      out.write("\t\t\t\t\t\t\t<td align=\"center\">");
      out.write(" --- </td>\n");
      out.write("                                                        <td align=\"center\"><a href=\"excluir_usuario.do?id=");
      out.print(u.getId() );
      out.write("\"><img src=\"imagens/excluir.png\" border=\"0\"></a></td>\t\n");
      out.write("                                                       \n");
      out.write("                                                    </tr>\n");
      out.write("                                                    ");

                                                }
                                                uDB.desconectar();
                                            } catch (Exception erro) {
                                                out.print(erro);
                                            }
                                
      out.write("\n");
      out.write("                            </table>\n");
      out.write("                        </div>\n");
      out.write("                    </td>\n");
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

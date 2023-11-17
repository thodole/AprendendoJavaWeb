<%@page import="modelo.Menu"%>
<%@page import="modelo.Perfil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.PerfilDAO"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gerenciar Menus de Perfil</title>
    </head>
    <body>
        <div align="center">
            <table width="760" border="1">
                <tr>
                    <td width="760" height="150">
                        <%@include file="banner.jsp" %>
                    </td>
                </tr>
                <tr>
                    <td width="760" height="20" valign="top">
                        <%@include file="menu.jsp" %>
                    </td>
                </tr>
                <tr>
                    <td width="760" height="330">
                        <div align="center">
                            <form name="form_gerenciar" method="post" action="gerenciar_menu_perfil.do" onsubmit="return validaForm();">
                                <%
                                    int id = Integer.parseInt(request.getParameter("id"));
                                    Perfil perfil = new Perfil();
                                    ArrayList<Menu> listaVinculados = new ArrayList<Menu>();
                                    ArrayList<Menu> listaDesvinculados = new ArrayList<Menu>();
                                    try {
                                        PerfilDAO pDB = new PerfilDAO();
                                        pDB.conectar();

                                        perfil = pDB.carregaPorId(id);
                                        listaVinculados = pDB.menusVinculados(id);
                                        listaDesvinculados = pDB.menusDesvinculados(id);

                                        pDB.desconectar();

                                    } catch (Exception e) {
                                        out.print(e);
                                    }
                                %>
                                <input type="hidden" name="id_perfil" value="<%=perfil.getId()%>" />
                                <input type="hidden" name="op" value="vincular" />
                                <h4>Gerenciar Menus de Perfil</h4>
                                <table width="300" border="1">
                                    <tr>
                                        <td>ID: </td>
                                        <td><%=perfil.getId()%></td>
                                    </tr>
                                    <tr>
                                        <td>Perfil: </td>
                                        <td><%=perfil.getPerfil()%></td>
                                    </tr>
                                </table>
                           <table width="300" border="1">
                                <tr>
                                    <td>Menu:</td>
                                    <td>
                                    <select name="id_menu" size="1">
                                    <option value="">Escolha um menu</option>
                                    <%
                                        for (Menu m : listaDesvinculados) {
                                            out.println("<option value='"+m.getId()+ "'>"+m.getMenu()+"</option>");
                                        }

                                    %>
                                </select>
                                <input type="submit" value="Vincular">
                           </table>
                            </form>                            
                            <br/><br/>
                            <table width="300" border="1">
                                <tr>
                                    <td align="center">ID</td>
                                    <td align="center">MENU</td>
                                    <td align="center">DESVINCULAR</td>
                                </tr>
                                <%
                                  for (Menu m : listaVinculados) {
                                %>
                                <tr>
                                    <td align="center"><%=m.getId()%></td>
                                    <td><%=m.getMenu()%></td>
                                    <td align="center"><a href="gerenciar_menu_perfil.do?id_menu=<%=m.getId()%>&id_perfil=<%=id%>&op=desvincular"><img src="imagens/excluir.png" border="0"></a></td>
                                </tr>
                                <%
                                 }
                                %>
                            </table>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </body>
</html>

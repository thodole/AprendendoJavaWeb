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
        <title>JSP Page</title>
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
                    <td width="760" height="330" valign="top">
                        <div align="center">
                        <h3>Lista de Perfis ( <img src="imagens/novo.png" align="top"><a href="form_inserir_perfil.jsp">Novo</a> )</h3>
                    <table width="500" border="1">
                        <tr>
                            <td align="center">ID</td>
                            <td align="center">PERFIL</td>
                            <td width="100" align="center">ALTERAR</td>
                            <td align="center">EXCLUIR</td>
                            <td align="center">GERENCIAR MENUS</td>
                        </tr>
                                <%                                            
                                            try {
                                                PerfilDAO pDB = new PerfilDAO();
                                                ArrayList<Perfil> lista;
                                                pDB.conectar();
                                                lista = pDB.listar();
                                                for(Perfil p:lista){
                                                    %>
                                                    <tr>
                                                        <td><%=p.getId() %></td>
                                                        <td><%=p.getPerfil() %></td>
                                                        <td align="center"><a href="form_alterar_perfil.jsp?id=<%=p.getId() %>"><img src="imagens/alterar.png" border="0"></a></td>
                                                        <td align="center"><a href="excluir_perfil.do?id=<%=p.getId() %>"><img src="imagens/excluir.png" border="0"></a></td>
                                                        <td align="center"><a href="form_gerenciar_menu_perfil.jsp?id=<%=p.getId() %>"><img src="imagens/gerenciar.png" border="0"></a></td>
                                                    </tr>
                                                    <%
                                                }
                                                pDB.desconectar();
                                            } catch (Exception erro) {
                                                out.print(erro);
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

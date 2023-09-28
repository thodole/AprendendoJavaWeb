<%@page import="modelo.Usuario"%>
<%@page import="modelo.UsuarioDAO"%>
<%--@page import="modelo.Perfil"--%>
<%@page import="java.util.ArrayList"%>
<%--@page import="modelo.PerfilDAO"--%>
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
                        <%--@include file="menu.jsp" --%> 
                         <a href="form_inserir_usuario.jsp">Inserir Usuário</a> | <a href="form_inserir_menu.jsp">Inserir Menu</a> | <a href="form_inserir_perfil.jsp">Inserir Perfil</a> |  <a href="listar_usuario.jsp">Listar Usuário</a> |  <a href="listar_menu.jsp">Listar Menu</a> |  <a href="listar_perfil.jsp">Listar Perfil</a>
                    </td>
                </tr>
                <tr>
                    <td width="760" height="330">
                        <div align="center">
                            <h3>Lista de Usuários ( <img src="imagens/novo.png" align="top"><a href="form_inserir_usuario.jsp">Novo</a> )</h3>
                            <table width="550" border="1">
                                <tr bgcolor="#d3d3d3">
                                    <td>ID</td>
                                    <td>NOME</td>
                                    <td>LOGIN</td>
                                    <td>PERFIL</td>
                                    <td>ALTERAR</td>
                                    <td>EXCLUIR</td>
                                </tr>
                                <%                                            
                                            try {
                                                UsuarioDAO uDB = new UsuarioDAO();
                                                ArrayList<Usuario> lista;
                                                uDB.conectar();
                                                lista = uDB.listar();
                                                for(Usuario u:lista){
                                                    %>
                                                    <tr>
                                                        <td><%=u.getId() %></td>
                                                        <td><%=u.getNome() %></td>
                                                        <td><%=u.getLogin() %></td>
                                                        <td align="center"><%--=u.getPerfil() --%> --- </td>
							<td align="center"><a href="form_alterar_usuario.jsp?id=<%=u.getId() %>"><img src="imagens/alterar.png" border="0"></a></td>
                                                        <td align="center"><a href="excluir_usuario.do?id=<%=u.getId() %>"><img src="imagens/excluir.png" border="0"></a></td>	
                                                    </tr>
                                                    <%
                                                }
                                                uDB.desconectar();
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

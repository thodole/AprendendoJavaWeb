<%@page import="modelo.Perfil"%>
<%@page import="modelo.PerfilDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Perfis</title>
    </head>
    <body>
        <div align="center">
            <table>
                <tr>
                    <td> <%@include file="banner.jsp"%> </td>
                </tr>
                <tr>
                    <td align="center" height="40" valign="top">
                        <%@include file="menu.jsp"%> 
                    </td>
                </tr>
                <tr>
                    <td width="760" height="100">
                        <div align="center">
                            <h2>LISTA DE PERFIS</h2>
                            <h3><a href="formInserirPerfil.jsp"><img src="imagens/novo.png" align="top">Novo Perfil</a></h3>
                            <table width="800" border="1">
                                <tr align="center" bgcolor="#d3d3d3">
                                    <td>NOME</td>
                                    <td>ALTERAR</td>
                                    <td>EXCLUIR</td>
                                    <td>GERIR MENUS</td>
                                </tr>
                                <%                                            
                                    try {
                                        PerfilDAO perfilBD = new PerfilDAO();
                                        ArrayList<Perfil> lista;
                                        perfilBD.conectar();
                                        lista = perfilBD.listar();
                                        for(Perfil perfil:lista){
                                %>
                                    <tr align="center">
                                        <td><%=perfil.getNome_perfil()%></td>
                                        <td><a href="formAlterarPerfil.jsp?id=<%=perfil.getId() %>"><img src="imagens/alterar.png" border="0"></a></td>
                                        <td><a href="excluirPerfil.do?id=<%=perfil.getId() %>"><img src="imagens/excluir.png" border="0"></a></td>
                                        <td><a href="formGerirMenuPerfil.jsp?id=<%=perfil.getId() %>"><img src="imagens/gerir.png" border="0"></a></td>
                                    </tr>
                                <%
                                        }
                                        perfilBD.desconectar();

                                    } catch (Exception erro) {
                                        out.print(erro);
                                    }
                                %>
                            </table>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td> <%@include file="rodape.jsp"%> </td>
                </tr>
            </table>
        </div>
    </body>
</html>

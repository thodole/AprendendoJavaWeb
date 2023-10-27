<%@page import="modelo.UsuarioDAO"%>
<%@page import="modelo.Perfil"%>
<%@page import="modelo.PerfilDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Cliente</title>
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
                    <td width="760" height="330">
                        <div align="center">
                            <h2>Lista de Clientes</h2>
                            <table width="800" border="1">
                                <tr align="center" bgcolor="#d3d3d3">
                                    <td>ID</td>
                                    <td>NOME</td>
                                    <td>TELEFONE</td>
                                    <td>AGENDA</td>
                                    <td>ALTERAR</td>
                                    <td>EXCLUIR</td>
                                </tr>
                                <%                                            
                                    try {
                                        UsuarioDAO usuarioBD = new UsuarioDAO();
                                        ArrayList<Usuario> lista;
                                        usuarioBD.conectar();
                                        lista = usuarioBD.listar();
                                        for(Usuario user : lista){
                                            if(user.getIdPerfil() == 4) {
                                %>
                                    <tr align="center">
                                        <td><%=user.getId()%></td>
                                        <td><%=user.getNome_usuario()%></td>
                                        <td><%=user.getTelefone()%></td>
                                        <td><a href="formGerirServicoCliente.jsp?id=<%=user.getId() %>"><img src="imagens/gerir.png" border="0"></a></td>
                                        <td><a href="formAlterarUsuario.jsp?id=<%=user.getId() %>"><img src="imagens/alterar.png"></a></td>
                                        <td><a href="excluirUsuario.do?id=<%=user.getId() %>"><img src="imagens/excluir.png"></a></td>
                                    </tr>
                                <%
                                            }
                                        }
                                        usuarioBD.desconectar();

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

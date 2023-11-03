<%@page import="modelo.Usuario"%>
<%@page import="modelo.UsuarioDAO"%>
<%@page import="modelo.Perfil"%>
<%@page import="modelo.PerfilDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="CSS/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <title>Listar Usuários</title>
    </head>
    <body>
            
            <%@include file="cabecalho.jsp"%>
            
                <tr>
                    <td>
                        <div align="center">
                            <h2>Lista de Usuários</h2>
                            <h3><a href="formInserirUsuario.jsp"><img src="imagens/novo.png" align="top">Novo Usuário</a></h3>
                            <table width="800" border="1">
                                <tr align="center" bgcolor="#d3d3d3">
                                    <td>PERFIL</td>
                                    <td>NOME</td>
                                    <td>TELEFONE</td>
                                    <td>LOGIN</td>
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
                                %>
                                    <tr align="center">
                                        <td><%=user.getPerfil()%></td>
                                        <td><%=user.getNome_usuario()%></td>
                                        <td><%=user.getTelefone()%></td>
                                        <td><%=user.getLogin()%></td>
                                        <td><a href="formAlterarUsuario.jsp?id=<%=user.getId() %>"><img src="imagens/alterar.png"></a></td>
                                        <td><a href="excluirUsuario.do?id=<%=user.getId() %>"><img src="imagens/excluir.png"></a></td>
                                    </tr>
                                <%
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
                    //comentário teste
                </tr>
            </table>
        </div>
    </body>
</html>

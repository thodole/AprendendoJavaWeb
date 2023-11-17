<%@page import="modelo.Usuario"%>
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
        
        <%@include file="cabecalho.jsp"%>
        
        <div align="center">
                <tr>
<<<<<<< HEAD
                    <td width="760" height="100">
                        <div align="center">
<<<<<<< HEAD
                            <h2>LISTA DE CLIENTES</h2>
                            <h3><a href="formInserirCliente.jsp"><img src="imagens/novo.png" align="top">Novo Cliente</a></h3>
=======
                            <h2>Lista de Clientes</h2>
>>>>>>> d14b050a8b699180837da4149e8fe0ff57f0a101
=======
                    <td width="760" height="330">
                        <div align="center">
                            <h2>Lista de Clientes</h2>
<<<<<<< Updated upstream
=======
>>>>>>> d14b050a8b699180837da4149e8fe0ff57f0a101
>>>>>>> Stashed changes
                            <table width="800" border="1">
                                <tr align="center" bgcolor="#d3d3d3">
                                    <td>ID</td>
                                    <td>NOME</td>
                                    <td>TELEFONE</td>
<<<<<<< Updated upstream
=======
<<<<<<< HEAD
<<<<<<< HEAD
                                    <td>FAZER PEDIDO</td>
                                    <td>CONTRATADO</td>
                                    <td>EM ABERTO</td>
=======
=======
>>>>>>> d14b050a8b699180837da4149e8fe0ff57f0a101
>>>>>>> Stashed changes
                                    <td>AGENDA</td>
>>>>>>> d14b050a8b699180837da4149e8fe0ff57f0a101
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
<<<<<<< Updated upstream
=======
<<<<<<< HEAD
<<<<<<< HEAD
                                        <td><%=cliente.getId()%></td>
                                        <td><%=cliente.getNome_cliente()%></td>
                                        <td><%=cliente.getTelefone()%></td>
                                        <td><a href="formInserirServicoCliente.jsp?id=<%=cliente.getId() %>"><img src="imagens/novo.png" border="0"></a></td>
                                        <td><a href="situacaoCliente.jsp?id=<%=cliente.getId() %>"><img src="imagens/gerir.png" border="0"></a></td>
                                        <td><a href="formConcluirPedido.jsp?id=<%=cliente.getId() %>"><img src="imagens/gerir.png" border="0"></a></td>
                                        <td><a href="formAlterarCliente.jsp?id=<%=cliente.getId() %>"><img src="imagens/alterar.png"></a></td>
                                        <td><a href="excluirCliente.do?id=<%=cliente.getId() %>"><img src="imagens/excluir.png"></a></td>
=======
=======
>>>>>>> d14b050a8b699180837da4149e8fe0ff57f0a101
>>>>>>> Stashed changes
                                        <td><%=user.getId()%></td>
                                        <td><%=user.getNome_usuario()%></td>
                                        <td><%=user.getTelefone()%></td>
                                        <td><a href="formGerirServicoCliente.jsp?id=<%=user.getId() %>"><img src="imagens/gerir.png" border="0"></a></td>
                                        <td><a href="formAlterarUsuario.jsp?id=<%=user.getId() %>"><img src="imagens/alterar.png"></a></td>
                                        <td><a href="excluirUsuario.do?id=<%=user.getId() %>"><img src="imagens/excluir.png"></a></td>
<<<<<<< Updated upstream
=======
<<<<<<< HEAD
>>>>>>> d14b050a8b699180837da4149e8fe0ff57f0a101
=======
>>>>>>> d14b050a8b699180837da4149e8fe0ff57f0a101
>>>>>>> Stashed changes
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

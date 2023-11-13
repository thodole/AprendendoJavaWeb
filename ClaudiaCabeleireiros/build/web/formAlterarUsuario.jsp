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
        <title>Alterar Usuário</title>
        <script language="javascript" >
            function validaForm(){
                formulario = document.formAlterarUsuario;
                if(formulario.idPerfil.value==""){
                    alert("Um Perfil deve ser selecionado!");
                    formulario.idPerfil.focus();
                    return false;
                }
                if(formulario.nome_usuario.value==""){
                    alert("O campo Nome deve ser preenchido!");
                    formulario.nome_usuario.focus();
                    return false;
                }
                if(formulario.telefone.value==""){
                    alert("O campo Telefone deve ser preenchido!");
                    formulario.telefone.focus();
                    return false;
                }
                if(formulario.login.value==""){
                    alert("O campo Login deve ser preenchido!");
                    formulario.login.focus();
                    return false;
                }
                if(formulario.senha.value==""){
                    alert("O campo Senha deve ser preenchido!");
                    formulario.senha.focus();
                    return false;
                }

                return true;
            }
        </script>
    </head>
    <body>
        <div align="center">
             <%@include file="cabecalho.jsp"%>
                <tr>
                    <td width="760" height="330">
                        <div align="center">
                            <h2>Alterar Usuário</h2>
                            <form name="formAlterarUsuario" action="alterarUsuario.do" method="post" onsubmit="return validaForm();">
                            <table align="center">
                            <%
                                int id = Integer.parseInt(request.getParameter("id"));
                                try {
                                    UsuarioDAO usuarioBD = new UsuarioDAO();
                                    usuarioBD.conectar();
                                    Usuario user = usuarioBD.carregarPorId(id);
                                    usuarioBD.desconectar();
                                    if (user.getId() > 0){
                            %>
                                <tr>
                                    <td>ID:</td>
                                    <td><%=user.getId() %> <input type="hidden" name="id" value="<%=user.getId() %>"> </td>
                                </tr>
                                <tr>
                                    <td>Perfil:</td>
                                    <td>
                                        <select name="idPerfil" size="1">
                            <%
                                            try {
                                                PerfilDAO perfilBD = new PerfilDAO();
                                                ArrayList<Perfil> lista;
                                                perfilBD.conectar();
                                                lista = perfilBD.listar();
                                                for(Perfil perfil : lista){
                                                    if(perfil.getId() == user.getIdPerfil()){
                            %>
                                                        <option value="<%=perfil.getId() %>" selected><%=perfil.getNome_perfil()%></option>
                            <%
                                                    } else {
                            %>
                                                        <option value="<%=perfil.getId() %>"><%=perfil.getNome_perfil()%></option>
                            <%
                                                    }
                                                }
                                                
                                                perfilBD.desconectar();

                                            } catch (Exception erro) {
                                                out.print(erro);
                                            }
                            %>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Nome:</td>
                                    <td><input type="text" name="nome_usuario" value="<%=user.getNome_usuario()%>" size="30"></td>
                                </tr>
                                <tr>
                                    <td>Telefone:</td>
                                    <td><input type="text" name="telefone" value="<%=user.getTelefone()%>" size="30"></td>
                                </tr>
                                <tr>
                                    <td>Login:</td>
                                    <td><input type="text" name="login" value="<%=user.getLogin() %>"  size="30"/></td>
                                </tr>
                                <tr>
                                    <td>Senha:</td>
                                    <td><input type="password" name="senha" value="<%=user.getSenha() %>"  size="30"/></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td><input type="submit" value="Alterar"></td>
                                </tr>
                            <%
                                    }
                                } catch (Exception erro) {
                                    out.print(erro);
                                }
                            %>
                                </table>
                            </form>
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

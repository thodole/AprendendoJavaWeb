<%@page import="modelo.Perfil"%>
<%@page import="modelo.PerfilDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inserir Usuário</title>
        <script language="javascript" >
            function validaForm(){
                formulario = document.formInserirUsuario;
                if(formulario.nome_usuario.value==""){
                    alert("O campo Nome deve ser preenchido!");
                    formulario.nome_usuario.focus();
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
                if(formulario.idPerfil.value==""){
                    alert("Um Perfil deve ser selecionado!");
                    formulario.idPerfil.focus();
                    return false;
                }

                return true;
            }
        </script>
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
                            <h2>NOVO USUÁRIO</h2>
                            <form name="formInserirUsuario" action="inserirUsuario.do" method="post" onsubmit="return validaForm();">
                                <table align="center">
                                    <tr>
                                        <td>Nome:</td>
                                        <td><input type="text" name="nome_usuario" size="30" /> </td>
                                    </tr>
                                    <tr>
                                        <td>Login:</td>
                                        <td><input type="text" name="login" size="30" /> </td>
                                    </tr>
                                    <tr>
                                        <td>Senha:</td>
                                        <td><input type="password" name="senha" size="30" /> </td>
                                    </tr>
                                    <tr>
                                        <td>Perfil:</td>
                                        <td>
                                            <select name="idPerfil" size="1">
                                                <option value="" selected>Selecione um Perfil</option>
                                            <%
                                                try {
                                                    PerfilDAO perfilBD = new PerfilDAO();
                                                    ArrayList<Perfil> lista;
                                                    perfilBD.conectar();
                                                    lista = perfilBD.listar();
                                                    for(Perfil perfil : lista) {
                                                        out.print("<option value='"+ perfil.getId()+"'>"+ perfil.getNome_perfil()+"</option>");
                                                    }
                                                    perfilBD.desconectar();
                                                }
                                                    catch (Exception erro) {
                                                        out.print(erro);
                                                    }
                                            %>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td><input type="submit" value="Salvar"/></td>
                                    </tr>
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

<%--@page import="modelo.Perfil"--%>
<%@page import="java.util.ArrayList"%>
<%--@page import="modelo.PerfilDAO"--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script language="javascript" >
            function validaForm(){
                formulario = document.form_usuario;
                if(formulario.nome.value==""){
                    alert("O Campo nome deve ser preenchido!!");
                    formulario.nome.focus();
                    return false;
                }
                if(formulario.login.value==""){
                    alert("O Campo login deve ser preenchido!!");
                    formulario.login.focus();
                    return false;
                }
                if(formulario.senha.value==""){
                    alert("O Campo senha deve ser preenchido!!");
                    formulario.senha.focus();
                    return false;
                }
                if(formulario.id_perfil.value==""){
                    alert("O Campo Perfil deve ser preenchido!!");
                    formulario.id_perfil.focus();
                    return false;
                }

                return true;
            }
        </script>
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
                        <a href="form_inserir_usuario.jsp">Inserir Usuário</a>
                    </td>
                </tr>
                <tr>
                    <td width="760" height="330">
                        <form name="form_usuario" action="inserir_usuario.do" method="post" onsubmit="return validaForm();">
                            <table width="500">
                                <tr>
                                    <td>Nome:</td>
                                    <td><input type="text" name="nome" size="30" /> </td>
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
                                        <select name="id_perfil" size="1">
                                            <option value="">Escolha um Perfil</option>
                                            <option value="1">Aprenderemos depois</option>
                                            <%--
                                            Inserir o Perfil em outra aula
                                            --%>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td><input type="submit" value="Salvar" /> </td>
                                </tr>
                            </table>
                        </form>
                    </td>
                </tr>
            </table>
        </div>
    </body>
</html>

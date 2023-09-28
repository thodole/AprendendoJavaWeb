
<%@page import="java.util.ArrayList"%>
<%--@page import="modelo.Perfil"--%>
<%--@page import="modelo.PerfilDAO"--%>
<%@page import="modelo.Usuario"%>
<%@page import="modelo.UsuarioDAO"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script language="javascript" >
            function validaForm(){
                formulario = document.form_usuario;
                if(formulario.id_perfil.value==""){
                    alert("O Campo Perfil deve ser selecionado!!");
                    formulario.id_perfil.focus();
                    return false;
                }
                if(formulario.nome.value==""){
                    alert("O Campo Nome deve ser preenchido!!");
                    formulario.nome.focus();
                    return false;
                }
                if(formulario.login.value==""){
                    alert("O Campo Login deve ser preenchido!!");
                    formulario.login.focus();
                    return false;
                }
                if(formulario.senha.value==""){
                    alert("O Campo Senha deve ser preenchido!!");
                    formulario.senha.focus();
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
                        <a href="listar_usuario.jsp">Listar Usuário</a>
                    </td>
                </tr>
                <tr>
                    <td width="760" height="330">
                        <div align="center">
                            <h2>Alterando Usuario</h2>
                            <form name="form_usuario" action="alterar_usuario.do" method="post" onsubmit="return validaForm();">
                            <table width="300" border="0">
                                <%
                                            int id = Integer.parseInt(request.getParameter("id"));
                                            try {
                                                UsuarioDAO uDB = new UsuarioDAO();
                                                uDB.conectar();
                                                Usuario usuario = uDB.carregarPorId(id);
                                                uDB.desconectar();
                                                if (usuario.getId()>0){
                                                    %>
                                                    <tr>
                                                        <td>ID:</td>
                                                        <td><%=usuario.getId() %> <input type="hidden" name="id" value="<%=usuario.getId() %>"> </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Perfil:</td>
                                                        <td>
                                                            <select name="id_perfil" size="1">
                                                                <option value="">Selecione um Perfil</option>
                                                                <option value="1">Escolha este</option>
                                                                <%--
                                                                try {
                                                                    PerfilDAO pDB = new PerfilDAO();
                                                                    ArrayList<Perfil> lista;
                                                                    pDB.conectar();
                                                                    lista = pDB.listar();
                                                                    for(Perfil p:lista){
                                                                        if(p.getId() == u.getId_perfil()){
                                                                            %>
                                                                            <option value="<%=p.getId() %>" selected><%=p.getPerfil() %></option>
                                                                            <%
                                                                        }else{
                                                                            %>
                                                                            <option value="<%=p.getId() %>"><%=p.getPerfil() %></option>
                                                                            <%
                                                                        }
                                                                    }
                                                                    pDB.desconectar();
                                                                } catch (Exception erro) {
                                                                    out.print(erro);
                                                                }
                                                                --%>
                                                            </select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Nome:</td>
                                                        <td>
                                                            <input type="text" name="nome" value="<%=usuario.getNome() %>" size="60">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Login:</td>
                                                        <td><input type="text" name="login" value="<%=usuario.getLogin() %>"  size="30" /> </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Senha:</td>
                                                        <td><input type="password" name="senha" value="<%=usuario.getSenha() %>"  size="30" /> </td>
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
            </table>
        </div>
    </body>
</html>

<%@page import="modelo.Perfil"%>
<%@page import="modelo.PerfilDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Perfil</title>
        <script language="javascript" >
            function validaForm(){
                formulario = document.formAlterarPerfil;
                if(formulario.nome_perfil.value==""){
                    alert("O campo Nome deve ser preenchido!");
                    formulario.nome_perfil.focus();
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
                    <td width="760" height="330">
                        <div align="center">
                            <h2>Alterar Perfil</h2>
                            <form name="formAlterarPerfil" action="alterarPerfil.do" method="post" onsubmit="return validaForm();">
                                <table align="center">
                            <%
                                int id = Integer.parseInt(request.getParameter("id"));
                                    try {
                                        PerfilDAO perfilBD = new PerfilDAO();
                                        perfilBD.conectar();
                                        Perfil perfil = perfilBD.carregarPorId(id);
                                        perfilBD.desconectar();
                                        if (perfil.getId() > 0){
                            %>
                                <tr>
                                    <td>ID:</td>
                                    <td><%=perfil.getId() %> <input type="hidden" name="id" value="<%=perfil.getId() %>"></td>
                                </tr>
                                <tr>
                                    <td>Perfil:</td>
                                    <td>
                                        <input type="text" name="nome_perfil" value="<%=perfil.getNome_perfil()%>" size="30">
                                    </td>
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

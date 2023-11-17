<%@page import="modelo.Menu"%>
<%@page import="modelo.MenuDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Menu</title>
        <script language="javascript" >
            function validaForm(){
                formulario = document.formAlterarMenu;
                if(formulario.nome_menu.value==""){
                    alert("O campo Nome deve ser preenchido!");
                    formulario.nome_menu.focus();
                    return false;
                }
                if(formulario.link.value==""){
                    alert("O campo Link deve ser preenchido!");
                    formulario.link.focus();
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
                            <h2>ALTERAR MENU</h2>
                            <form name="formAlterarMenu" action="alterarMenu.do" method="post" onsubmit="return validaForm();">
                                <table align="center">
                            <%
                                int id = Integer.parseInt(request.getParameter("id"));
                                    try {
                                        MenuDAO menuBD = new MenuDAO();
                                        menuBD.conectar();
                                        Menu menu = menuBD.carregarPorId(id);
                                        menuBD.desconectar();
                                        if (menu.getId() > 0){
                            %>
                                <tr>
                                    <td>ID:</td>
                                    <td><%=menu.getId() %> <input type="hidden" name="id" value="<%=menu.getId() %>"></td>
                                </tr>
                                <tr>
                                    <td>Nome:</td>
                                    <td><input type="text" name="nome_menu" value="<%=menu.getNome_menu()%>" size="30"></td>
                                </tr>
                                <tr>
                                    <td>Link:</td>
                                    <td><input type="text" name="link" value="<%=menu.getLink() %>"  size="30"/></td>
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

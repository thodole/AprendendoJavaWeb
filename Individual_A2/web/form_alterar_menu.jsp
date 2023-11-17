<%@page import="modelo.Menu"%>
<%@page import="modelo.MenuDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script language="javascript" >
           function validaForm(){
                formulario = document.form_menu;
                if(formulario.menu.value==""){
                    alert("O Campo menu deve ser preenchido!!");
                    formulario.menu.focus();
                    return false;
                }
                if(formulario.link.value==""){
                    alert("O Campo link deve ser preenchido!!");
                    formulario.link.focus();
                    return false;
                }
                if(formulario.icone.value==""){
                    alert("O Campo icone deve ser preenchido!!");
                    formulario.icone.focus();
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
                        <%@include file="menu.jsp" %>
                    </td>
                </tr>
                <tr>
                    <td width="760" height="330">
                        <div align="center">
                            <h2>Alterando Menu</h2>
                            <form name="form_menu" action="alterar_menu.do" method="post" onsubmit="return validaForm();">
                            <table width="300" border="0">
                                <%
                                            int id = Integer.parseInt(request.getParameter("id"));
                                            try {
                                                MenuDAO mDB = new MenuDAO();
                                                mDB.conectar();
                                                Menu m = mDB.carregaPorId(id);
                                                mDB.desconectar();
                                                if (m.getId()>0){
                                                    %>
                                                    <tr>
                                                        <td>ID:</td>
                                                        <td><%=m.getId() %> <input type="hidden" name="id" value="<%=m.getId() %>"> </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Menu:</td>
                                                        <td>
                                                            <input type="text" name="menu" value="<%=m.getMenu() %>" size="60">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Link:</td>
                                                        <td>
                                                            <input type="text" name="link" value="<%=m.getLink() %>" size="60">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Icone:</td>
                                                        <td>
                                                            <input type="text" name="icone" value="<%=m.getIcone() %>" size="60">
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
            </table>
        </div>
    </body>
</html>

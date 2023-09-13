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
                        <a href="form_inserir_menu.jsp">Inserir Menu</a>
                    </td>
                </tr>
                <tr>
                    <td width="760" height="330">
                        <form name="form_menu" action="inserir_menu.do" method="post" onsubmit="return validaForm();">
                            <table width="500">
                                <tr>
                                    <td>Menu:</td>
                                    <td><input type="text" name="menu" size="30" /> </td>
                                </tr>
                                <tr>
                                    <td>Link:</td>
                                    <td><input type="text" name="link" size="30" /> </td>
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

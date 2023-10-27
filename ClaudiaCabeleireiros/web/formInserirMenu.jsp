<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inserir Menu</title>
        <script language="javascript" >
            function validaForm(){
                formulario = document.formInserirMenu;
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
                    <td width="760" height="330">
                        <div align="center">
                            <h2>Novo Menu</h2>
                            <form name="formInserirMenu" action="inserirMenu.do" method="post" onsubmit="return validaForm();">
                                <table align="center">
                                    <tr>
                                        <td>Nome:</td>
                                        <td><input type="text" name="nome_menu" size="30" /> </td>
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

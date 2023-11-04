<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inserir Cliente</title>
        <script language="javascript" >
            function validaForm(){
                formulario = document.formInserirCliente;
                if(formulario.nome_cliente.value==""){
                    alert("O campo Nome deve ser preenchido!");
                    formulario.nome_cliente.focus();
                    return false;
                }
                if(formulario.telefone.value==""){
                    alert("O campo Telefone deve ser preenchido!");
                    formulario.telefone.focus();
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
                            <h2>Novo Cliente</h2>
                            <form name="formInserirCliente" action="inserirCliente.do" method="post" onsubmit="return validaForm();">
                                <table align="center">
                                    <tr>
                                        <td>Nome:</td>
                                        <td><input type="text" name="nome_cliente" size="30" /> </td>
                                    </tr>
                                    <tr>
                                        <td>Telefone:</td>
                                        <td><input type="text" name="telefone" size="30" /> </td>
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


<%@page import="modelo.Perfil"%>
<%@page import="modelo.PerfilDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inserir Perfil</title>
        <script language="javascript" >
            function validaForm(){
                formulario = document.formPerfil;
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
                    <td width="760" height="100">
                        <div align="center">
                            <h2>NOVO PERFIL</h2>
                            <form name="formPerfil" action="inserirPerfil.do" method="post" onsubmit="return validaForm();">
                                <table align="center">
                                    <tr>
                                        <td>Nome:</td>
                                        <td><input type="text" name="nome_perfil" size="30" /> </td>
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

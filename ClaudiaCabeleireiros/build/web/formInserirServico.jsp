<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inserir Serviço</title>
        <script language="javascript" >
            function validaForm(){
                formulario = document.formInserirServico;
                if(formulario.nome_servico.value==""){
                    alert("O campo Nome deve ser preenchido!");
                    formulario.nome_servico.focus();
                    return false;
                }
                if(formulario.descricao.value==""){
                    alert("O campo Descrição deve ser preenchido!");
                    formulario.descricao.focus();
                    return false;
                }
                if(formulario.duracao.value==""){
                    alert("O campo duração deve ser preenchido!");
                    formulario.duracao.focus();
                    return false;
                }
                if(formulario.valor.value==""){
                    alert("O campo Valor deve ser preenchido!");
                    formulario.valor.focus();
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
                            <h2>NOVO SERVIÇO</h2>
                            <form name="formInserirServico" action="inserirServico.do" method="post" onsubmit="return validaForm();">
                                <table align="center">
                                    <tr>
                                        <td>Nome:</td>
                                        <td><input type="text" name="nome_servico" size="30" /> </td>
                                    </tr>
                                    <tr>
                                        <td>Descrição:</td>
                                        <td><input type="text" name="descricao" size="30" /> </td>
                                    </tr>
                                    <tr>
                                        <td>Duração:</td>
                                        <td><input type="text" name="duracao" size="30" /> </td>
                                    </tr>
                                    <tr>
                                        <td>Valor:</td>
                                        <td><input type="text" name="valor" size="30" /> </td>
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

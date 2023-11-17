<%@page import="modelo.Servico"%>
<%@page import="modelo.ServicoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Serviço</title>
        <script language="javascript" >
            function validaForm(){
                formulario = document.formAlterarServico;
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
                 <%@include file="cabecalho.jsp"%>
                <tr>
<<<<<<< Updated upstream
=======
<<<<<<< HEAD
                    <td width="760" height="100">
=======
>>>>>>> Stashed changes
                    <td width="760" height="330">
>>>>>>> d14b050a8b699180837da4149e8fe0ff57f0a101
                        <div align="center">
                            <h2>ALTERAR SERVIÇO</h2>
                            <form name="formAlterarServico" action="alterarServico.do" method="post" onsubmit="return validaForm();">
                            <table align="center">
                            <%
                                int id = Integer.parseInt(request.getParameter("id"));
                                try {
                                    ServicoDAO servicoBD = new ServicoDAO();
                                    servicoBD.conectar();
                                    Servico servico = servicoBD.carregarPorId(id);
                                    servicoBD.desconectar();
                                    if (servico.getId() > 0){
                            %>
                                <tr>
                                    <td>ID:</td>
                                    <td><%=servico.getId() %> <input type="hidden" name="id" value="<%=servico.getId() %>"> </td>
                                </tr>
                                <tr>
                                    <td>Nome:</td>
                                    <td><input type="text" name="nome_servico" value="<%=servico.getNome_servico() %>" size="30"></td>
                                </tr>
                                <tr>
                                    <td>Descrição:</td>
                                    <td><input type="text" name="descricao" value="<%=servico.getDescricao() %>"  size="30"/></td>
                                </tr>
                                <tr>
                                    <td>Duração:</td>
                                    <td><input type="text" name="duracao" value="<%=servico.getDuracao() %>"  size="30"/></td>
                                </tr>
                                 <tr>
                                    <td>Valor:</td>
                                    <td><input type="text" name="valor" value="<%=servico.getValor() %>"  size="30"/></td>
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

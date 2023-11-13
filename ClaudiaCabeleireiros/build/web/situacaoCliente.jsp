<%@page import="modelo.ServicoCliente"%>
<%@page import="modelo.ServicoClienteDAO"%>
<%@page import="modelo.Servico"%>
<%@page import="modelo.ServicoDAO"%>
<%@page import="modelo.Cliente"%>
<%@page import="modelo.ClienteDAO"%>
<%@page import="modelo.Pagamento"%>
<%@page import="modelo.PagamentoDAO"%>
<%@page import="modelo.Servico"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Situação do Cliente</title>
        <script language="javascript" >
            function validaForm(){
                formulario = document.formAlterarPagamento;
                if(formulario.valorTotal.value==""){
                    alert("Não existe valor a pagar!");
                    formulario.valorTotal.focus();
                    return false;
                }
                if(formulario.pagar.value==""){
                    alert("O campo Valor Pago deve ser preenchido!");
                    formulario.pagar.focus();
                    return false;
                }
                if(formulario.pagar.value > formulario.valorAPagar.value){
                    alert("O Valor Pago é maior que o Valor Restante!");
                    formulario.pagar.focus();
                    return false;
                }
                if(formulario.valorAPagar.value == ""){
                    alert("Não existe nenhuma pendência de pagamento!");
                    formulario.valorAPagar.focus();
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
                            <h2>SITUAÇÃO DO CLIENTE</h2>
                            
                            <%
                                int id = Integer.parseInt(request.getParameter("id"));
                                Cliente cliente = new Cliente();
                                try {
                                    ClienteDAO clienteBD = new ClienteDAO();
                                    clienteBD.conectar();
                                    cliente = clienteBD.carregarPorId(id);
                                    clienteBD.desconectar();
                            %>
                            <table align="center">
                                    <tr>
                                        <td>ID: <%=cliente.getId()%></td>
                                        <td>CLIENTE: <%=cliente.getNome_cliente()%></td>
                                        <td>TELEFONE: <%=cliente.getTelefone()%></td>
                                    </tr>
                            </table>
                            <br>
                            <table width="550" border="1">
                                <tr align="center" bgcolor="#d3d3d3">
                                    <td>VALOR TOTAL</td>
                                    <td>VALOR PAGO</td>
                                    <td>VALOR RESTANTE</td>
                                    <td>PAGAR</td>
                                    <td>CONFIRMAR</td>
                                </tr>
                            <%
                                    try {
                                        PagamentoDAO pagamentoBD = new PagamentoDAO();
                                        ArrayList<Pagamento> lista;
                                        pagamentoBD.conectar();
                                        lista = pagamentoBD.listar();
                                            for(Pagamento pagamento : lista) {
                                                if(pagamento.getIdCliente() == id && pagamento.getValorAPagar() > 0) {
                            %>
                            <form name="formAlterarPagamento" action="alterarPagamento.do" method="post" onsubmit="return validaForm();">
                                <tr align="center">
                                    <td><%=pagamento.getValorTotal()%> <input type="hidden" name="valorPago" value="<%=pagamento.getValorPago() %>" ></td>
                                    <td><%=pagamento.getValorPago() %> <input type="hidden" name="idPagamento" value="<%=pagamento.getId() %>" ></td>
                                    <td><%=pagamento.getValorAPagar() %> <input type="hidden" name="valorAPagar" value="<%=pagamento.getValorAPagar() %>" ></td>
                                    <td><input type="text" name="pagar" size="5"> </td>
                                    <td><input type="submit" value="Sim"> <input type="hidden" name="idCliente" value="<%=pagamento.getIdCliente() %>" ></td>
                                </tr>
                            </form>
                            <%
                                                }
                                            }
                                        pagamentoBD.desconectar();

                                    } catch (Exception erro) {
                                        out.print(erro);
                                    }
                                    
                                } catch (Exception e) {
                                    out.print(e);
                                } 
                            %>
                            
                            </table>
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

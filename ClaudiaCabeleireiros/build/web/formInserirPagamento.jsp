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
        <title>Pagamento</title>
        <script language="javascript" >
            function validaForm(){
                formulario = document.formInserirPagamento;
                if(formulario.valor_total.value==""){
                    alert("Não existe valor a pagar!");
                    formulario.valor_total.focus();
                    return false;
                }
                if(formulario.valor_pago.value==""){
                    alert("O campo Valor Pago deve ser preenchido!");
                    formulario.valor_pago.focus();
                    return false;
                }
                if(formulario.valor_pago.value > formulario.valor_total.value){
                    alert("O campo Valor Pago é maior que o Valor Total!");
                    formulario.valor_pago.focus();
                    return false;
                }
                if(formulario.valor_pago.value == "0"){
                    alert("O campo Valor Pago não pode ser zero!");
                    formulario.valor_pago.focus();
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
                            <h2>PAGAMENTO</h2>
                            
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
                                        <td>ID:</td>
                                        <td><%=cliente.getId()%></td>
                                    </tr>
                                    <tr>
                                        <td>CLIENTE:</td>
                                        <td><%=cliente.getNome_cliente()%></td>
                                    </tr>
                            </table>
                            <br>
                                <table width="550" border="1">
                                    <tr align="center" bgcolor="#d3d3d3">
                                        <td>SERVIÇO</td>
                                        <td>QUANTIDADE</td>
                                        <td>VALOR UNITÁRIO</td>
                                        <td>VALOR TOTAL</td>
                                        <td>EXCLUIR</td>
                                    </tr>
                                    <%
                                        double soma = 0;
                                    try {
                                        ServicoClienteDAO servicoClienteBD = new ServicoClienteDAO();
                                        ArrayList<ServicoCliente> lista;
                                        servicoClienteBD.conectar();
                                        lista = servicoClienteBD.listar();
                                        for(ServicoCliente servicoCliente : lista){
                                            if(servicoCliente.getIdCliente() == id && servicoCliente.getStatus().equals("C")) {
                                    %>
                                    <tr align="center">
                                        <td><%=servicoCliente.getServico() %></td>
                                        <td><%=servicoCliente.getQuantidade()%></td>
                                        <td><%=servicoCliente.getValor_servico() / servicoCliente.getQuantidade() %></td>
                                        <td><%=servicoCliente.getValor_servico()%></td>
                                        <td><a href="excluirServicoCliente.do?id=<%=servicoCliente.getId()%>&idCliente=<%=servicoCliente.getIdCliente()%>"><img src="imagens/excluir.png" border="0"></a></td>
                                    </tr>
                                    <%
                                        soma += servicoCliente.getValor_servico();
                                            }
                                        }
                                        servicoClienteBD.desconectar();

                                    } catch (Exception erro) {
                                        out.print(erro);
                                    }
                                    %>
                                </table>
                                <br>
                                <form name="formInserirPagamento" action="inserirPagamento.do" method="post" onsubmit="return validaForm();">
                                    <input type="hidden" name="idCliente" value="<%=cliente.getId()%>" >
                                    <input type="hidden" name="valorTotal" value="<%=soma%>" >
                                    <table width="550" border="1">
                                    <tr align="center" bgcolor="#d3d3d3">
                                        <td>TOTAL DOS SERVIÇOS</td>
                                        <td>VALOR PAGO</td>
                                        <td>CONFIRMAR</td>
                                    </tr>
                                    <tr align="center">
                                        <td><%=soma%></td>
                                        <td><input type="text" name="valorPago" size="5"/></td>
                                        <td><input type="submit" value="Sim"></td>
                                    </tr>
                                </table>
                                        <%
                                  } catch (Exception e) {
                                    out.print(e);
                                } 
%>
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

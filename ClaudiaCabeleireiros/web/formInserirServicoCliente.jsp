<%@page import="modelo.ServicoDAO"%>
<%@page import="modelo.Servico"%>
<%@page import="modelo.Cliente"%>
<%@page import="modelo.ClienteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inserir Servico Cliente</title>
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
                            <h2>CONTRATAR SERVIÇOS</h2>
                            <%
                                int id = Integer.parseInt(request.getParameter("id"));
                                Cliente cliente = new Cliente();
                                try {
                                    ClienteDAO clienteBD = new ClienteDAO();
                                    clienteBD.conectar();
                                    cliente = clienteBD.carregarPorId(id);
                            %>
                            <table align="center" width="400">
                                    <tr>
                                        <td>ID: <%=cliente.getId()%> </td>
                                        <td>CLIENTE: <%=cliente.getNome_cliente()%> </td>
                                        <td><a href="formConcluirPedido.jsp?id=<%=cliente.getId()%>"> <input type="submit" value="CONCLUIR" > </a></td>
                                    </tr>
                            </table>
                                    
                            <table width="800" border="1">
                                <tr align="center" bgcolor="#d3d3d3">
                                    <td>ID</td>
                                    <td>SERVIÇO</td>
                                    <td>DURAÇÃO</td>
                                    <td>VALOR</td>
                                    <td>QUANTIDADE</td>
                                    <td>INCLUIR</td>
                                </tr>
                                
                                <%                                            
                                    try {
                                        ServicoDAO servicoBD = new ServicoDAO();
                                        ArrayList<Servico> lista;
                                        servicoBD.conectar();
                                        lista = servicoBD.listar();
                                        for(Servico servico : lista){
                                %>
                                
                                    <tr align="center">
                                    <form name="formInserirServicoCliente" method="post" action="inserirServicoCliente.do">    
                                        <td><%=servico.getId()%> </td>
                                        <td><%=servico.getNome_servico()%> </td>
                                        <td><%=servico.getDuracao()%> </td>
                                        <td><%=servico.getValor()%> </td>
                                        <td><input type="text" name="quantidade"  size="1"/></td>
                                        <td><input type="submit" value="Sim"></td>
                                        <input type="hidden" name="idServico" value="<%=servico.getId()%>" >
                                        <input type="hidden" name="idCliente" value="<%=cliente.getId()%>" >
                                        <input type="hidden" name="valor_servico" value="<%=servico.getValor()%>" >
                                    </form>    
                                    </tr>
                                <%
                                        }
                                        servicoBD.desconectar();

                                    } catch (Exception erro) {
                                        out.print(erro);
                                    }
                                %>
                            </table>
                        </div>
                        <%
                            clienteBD.desconectar();
                            } catch (Exception e) {
                                    out.print(e);
                                }
                        %>
                    </td>
                </tr>
                
                <tr>
                    <td> <%@include file="rodape.jsp"%> </td>
                </tr>
            </table>
        </div>
    </body>
</html>

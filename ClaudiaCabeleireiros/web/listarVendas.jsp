<%@page import="modelo.Pagamento"%>
<%@page import="modelo.PagamentoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vendas Realizadas</title>
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
                            <h2>VENDAS REALIZADAS</h2>
                            <table width="800" border="1">
                                <tr align="center" bgcolor="#d3d3d3">
                                    <td>ID</td>
                                    <td>CLIENTE CONTRATANTE</td>
                                    <td>TOTAL DOS SERVIÇOS</td>
                                </tr>
                                <%                                            
                                    PagamentoDAO pagamentoBD = new PagamentoDAO();
                                    ArrayList<Pagamento> lista;
                                    pagamentoBD.conectar();
                                    lista = pagamentoBD.listar();
                                    for(Pagamento pagamento : lista){
                                        if(pagamento.getValorAPagar() == 0) {
                                %>
                                    <tr align="center">
                                        <td><%=pagamento.getId()%></td>
                                        <td><%=pagamento.getCliente()%></td>
                                        <td><%=pagamento.getValorTotal()%></td>
                                    </tr>
                                <%
                                        }
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

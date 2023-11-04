<%@page import="modelo.Cliente"%>
<%@page import="modelo.ClienteDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Cliente</title>
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
                            <h2>Lista de Clientes</h2>
                            <h3><a href="formInserirCliente.jsp"><img src="imagens/novo.png" align="top">Novo Cliente</a></h3>
                            <table width="800" border="1">
                                <tr align="center" bgcolor="#d3d3d3">
                                    <td>ID</td>
                                    <td>NOME</td>
                                    <td>TELEFONE</td>
                                    <td>AGENDA</td>
                                    <td>ALTERAR</td>
                                    <td>EXCLUIR</td>
                                </tr>
                                <%                                            
                                    
                                        ClienteDAO clienteBD = new ClienteDAO();
                                        ArrayList<Cliente> lista;
                                        clienteBD.conectar();
                                        lista = clienteBD.listar();
                                        for(Cliente cliente : lista){
                                %>
                                    <tr align="center">
                                        <td><%=cliente.getId()%></td>
                                        <td><%=cliente.getNome_cliente()%></td>
                                        <td><%=cliente.getTelefone()%></td>
                                        <td><a href="formInserirServicoCliente.jsp?id=<%=cliente.getId() %>"><img src="imagens/gerir.png" border="0"></a></td>
                                        <td><a href="formAlterarCliente.jsp?id=<%=cliente.getId() %>"><img src="imagens/alterar.png"></a></td>
                                        <td><a href="excluirCliente.do?id=<%=cliente.getId() %>"><img src="imagens/excluir.png"></a></td>
                                    </tr>
                                <%
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

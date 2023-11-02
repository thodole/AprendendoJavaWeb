<%@page import="modelo.Servico"%>
<%@page import="modelo.ServicoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Serviços</title>
    </head>
    <body>
            <%@include file="cabecalho.jsp"%>
            
                    <td width="760" height="330">
                        <div align="center">
                            <h2>Lista de Serviços</h2>
                            <h3><a href="formInserirServico.jsp"><img src="imagens/novo.png" align="top">Novo Serviço</a></h3>
                            <table width="800" border="1">
                                <tr align="center" bgcolor="#d3d3d3">
                                    <td>NOME</td>
                                    <td>DESCRIÇÃO</td>
                                    <td>DURAÇÃO</td>
                                    <td>VALOR</td>
                                    <td>ALTERAR</td>
                                    <td>EXCLUIR</td>
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
                                        <td><%=servico.getNome_servico()%></td>
                                        <td><%=servico.getDescricao()%></td>
                                        <td><%=servico.getDuracao()%></td>
                                        <td><%=servico.getValor()%></td>
                                        <td><a href="formAlterarServico.jsp?id=<%=servico.getId() %>"><img src="imagens/alterar.png" border="0"></a></td>
                                        <td><a href="excluirServico.do?id=<%=servico.getId() %>"><img src="imagens/excluir.png" border="0"></a></td>
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
                    </td>
                </tr>
                <tr>
                    <td> <%@include file="rodape.jsp"%> </td>
                </tr>
            </table>
        </div>
    </body>
</html>

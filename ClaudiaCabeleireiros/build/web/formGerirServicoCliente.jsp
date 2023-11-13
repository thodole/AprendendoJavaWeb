<%@page import="modelo.Servico"%>
<%@page import="modelo.Usuario"%>
<%@page import="modelo.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gerir ServicoCliente</title>
        <script language="javascript" >
            function validaForm(){
                formulario = document.formGerirServicoCliente;
                if(formulario.idServico.value==""){
                    alert("Selecione um Serviço!");
                    formulario.idServico.focus();
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
                    <td width="760" height="330">
                        <div align="center">
                            <h2>AGENDA</h2>
                            <form name="formGerirServicoCliente" method="post" action="gerirServicoCliente.do" onsubmit="return validaForm();">
                            <%
                                int id = Integer.parseInt(request.getParameter("id"));
                                Usuario user = new Usuario();
                                ArrayList<Servico> listaVinculados = new ArrayList<Servico>();
                                ArrayList<Servico> listaDesvinculados = new ArrayList<Servico>();
                                try {
                                    UsuarioDAO usuarioBD = new UsuarioDAO();
                                    usuarioBD.conectar();
                                    user = usuarioBD.carregarPorId(id);
                                    listaVinculados = usuarioBD.servicosVinculados(id);
                                    listaDesvinculados = usuarioBD.servicosDesvinculados(id);
                                    usuarioBD.desconectar();

                                } catch (Exception e) {
                                    out.print(e);
                                }
                            %>
                                <input type="hidden" name="idUsuario" value="<%=user.getId()%>" >
                                <input type="hidden" name="opcao" value="incluir" >
                                <table align="center">
                                    <tr>
                                        <td>ID:</td>
                                        <td><%=user.getId()%></td>
                                    </tr>
                                    <tr>
                                        <td>CLIENTE:</td>
                                        <td><%=user.getNome_usuario()%></td>
                                    </tr>
                                    <tr>
                                        <td>SERVIÇO:</td>
                                        <td> 
                                            <select name="idServico" size="1">
                                                <option value="">Selecione um Serviço</option>
                                            <%
                                                for (Servico servico : listaDesvinculados) {
                                                    out.println("<option value='"+servico.getId()+ "'>"+servico.getNome_servico()+" - "
                                                            +servico.getDuracao()+" - R$ "+servico.getValor()+"</option>");
                                                }
                                            %>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td> <input type="submit" value="Incluir"> </td>
                                    </tr>
                                </table>
                            </form>                            
                            <br><br>
                            <table width="550" border="1">
                                <tr align="center" bgcolor="#d3d3d3">
                                    <td>ID</td>
                                    <td>SERVIÇO</td>
                                    <td>DURAÇÃO</td>
                                    <td>VALOR</td>
                                    <td>EXCLUIR</td>
                                </tr>
                                <%
                                for (Servico servico : listaVinculados) {
                                %>
                                <tr align="center">
                                    <td><%=servico.getId()%></td>
                                    <td><%=servico.getNome_servico()%></td>
                                    <td><%=servico.getDuracao()%></td>
                                    <td><%=servico.getValor()%></td>
                                    <td><a href="gerirServicoCliente.do?idServico=<%=servico.getId()%>&idUsuario=<%=id%>&opcao=excluir"><img src="imagens/excluir.png" border="0"></a></td>
                                </tr>
                                <%
                                }
                                %>
                            </table>
                            <br>
                            <table width="150" border="1">
                                <tr align="center" bgcolor="#d3d3d3">
                                    <td>VALOR TOTAL</td>
                                </tr>
                                <tr align="center">
                                <%
                                double soma = 0;
                                for (Servico servico : listaVinculados) {
                                    soma += servico.getValor();
                                }
                                %>
                                    <td><%=soma%></td>
                                </tr>
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

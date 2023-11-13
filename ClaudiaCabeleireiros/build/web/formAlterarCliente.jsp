<%@page import="modelo.Cliente"%>
<%@page import="modelo.ClienteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Menu</title>
        <script language="javascript" >
            function validaForm(){
                formulario = document.formAlterarCliente;
                if(formulario.nome_cliente.value==""){
                    alert("O campo Nome deve ser preenchido!");
                    formulario.nome_cliente.focus();
                    return false;
                }
                if(formulario.telefone.value==""){
                    alert("O campo Telefone deve ser preenchido!");
                    formulario.telefone.focus();
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
                            <h2>Alterar Cliente</h2>
                            <form name="formAlterarCliente" action="alterarCliente.do" method="post" onsubmit="return validaForm();">
                                <table align="center">
                            <%
                                int id = Integer.parseInt(request.getParameter("id"));
                                    try {
                                        ClienteDAO clienteBD = new ClienteDAO();
                                        clienteBD.conectar();
                                        Cliente cliente = clienteBD.carregarPorId(id);
                                        clienteBD.desconectar();
                                        if (cliente.getId() > 0){
                            %>
                                <tr>
                                    <td>ID:</td>
                                    <td><%=cliente.getId() %> <input type="hidden" name="id" value="<%=cliente.getId() %>"></td>
                                </tr>
                                <tr>
                                    <td>Nome:</td>
                                    <td><input type="text" name="nome_cliente" value="<%=cliente.getNome_cliente()%>" size="30"></td>
                                </tr>
                                <tr>
                                    <td>Telefone:</td>
                                    <td><input type="text" name="telefone" value="<%=cliente.getTelefone()%>"  size="30"/></td>
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


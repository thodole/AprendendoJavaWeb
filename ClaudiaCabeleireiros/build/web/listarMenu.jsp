<%@page import="modelo.Menu"%>
<%@page import="modelo.MenuDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Menus</title>
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
                            <h2>LISTA DE MENUS</h2>
                            <h3><a href="formInserirMenu.jsp"><img src="imagens/novo.png" align="top">Novo Menu</a></h3>
                            <table width="800" border="1">
                                <tr align="center" bgcolor="#d3d3d3">
                                    <td>NOME</td>
                                    <td>LINK</td>
                                    <td>ALTERAR</td>
                                    <td>EXCLUIR</td>
                                </tr>
                                <%                                            
                                    try {
                                        MenuDAO menuBD = new MenuDAO();
                                        ArrayList<Menu> lista;
                                        menuBD.conectar();
                                        lista = menuBD.listar();
                                        for(Menu menu:lista){
                                %>
                                    <tr align="center">
                                        <td><%=menu.getNome_menu()%></td>
                                        <td><%=menu.getLink() %></td>
                                        <td><a href="formAlterarMenu.jsp?id=<%=menu.getId() %>"><img src="imagens/alterar.png" border="0"></a></td>
                                        <td><a href="excluirMenu.do?id=<%=menu.getId() %>"><img src="imagens/excluir.png" border="0"></a></td>
                                    </tr>
                                <%
                                        }
                                        menuBD.desconectar();

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

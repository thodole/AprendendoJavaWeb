<%@page import="modelo.Menu"%>
<%@page import="modelo.Perfil"%>
<%@page import="modelo.PerfilDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gerir MenuPerfil</title>
        <script language="javascript" >
            function validaForm(){
                formulario = document.formGerirMenuPerfil;
                if(formulario.idMenu.value==""){
                    alert("Selecione um Menu!");
                    formulario.idMenu.focus();
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
                            <h2>GERIR MENUS DO PERFIL</h2>
                            <form name="formGerirMenuPerfil" method="post" action="gerirMenuPerfil.do" onsubmit="return validaForm();">
                            <%
                                int id = Integer.parseInt(request.getParameter("id"));
                                Perfil perfil = new Perfil();
                                ArrayList<Menu> listaVinculados = new ArrayList<Menu>();
                                ArrayList<Menu> listaDesvinculados = new ArrayList<Menu>();
                                try {
                                    PerfilDAO perfilBD = new PerfilDAO();
                                    perfilBD.conectar();
                                    perfil = perfilBD.carregarPorId(id);
                                    listaVinculados = perfilBD.menusVinculados(id);
                                    listaDesvinculados = perfilBD.menusDesvinculados(id);
                                    perfilBD.desconectar();

                                } catch (Exception e) {
                                    out.print(e);
                                }
                            %>
                                <input type="hidden" name="idPerfil" value="<%=perfil.getId()%>" >
                                <input type="hidden" name="opcao" value="vincular" >
                                <table align="center">
                                    <tr>
                                        <td>ID:</td>
                                        <td><%=perfil.getId()%></td>
                                    </tr>
                                    <tr>
                                        <td>PERFIL:</td>
                                        <td><%=perfil.getNome_perfil()%></td>
                                    </tr>
                                    <tr>
                                        <td>MENU:</td>
                                        <td> 
                                            <select name="idMenu" size="1">
                                                <option value="">Selecione um Menu</option>
                                            <%
                                                for (Menu menu : listaDesvinculados) {
                                                    out.println("<option value='"+menu.getId()+ "'>"+menu.getNome_menu()+"</option>");
                                                }
                                            %>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td> <input type="submit" value="Vincular"> </td>
                                    </tr>
                                </table>
                            </form>                            
                            <br>
                            <table width="550" border="1">
                                <tr align="center" bgcolor="#d3d3d3">
                                    <td>ID</td>
                                    <td>MENU</td>
                                    <td>LINK</td>
                                    <td>DESVINCULAR</td>
                                </tr>
                                <%
                                for (Menu menu : listaVinculados) {
                                %>
                                <tr align="center">
                                    <td><%=menu.getId()%></td>
                                    <td><%=menu.getNome_menu()%></td>
                                    <td><%=menu.getLink() %></td>
                                    <td><a href="gerirMenuPerfil.do?idMenu=<%=menu.getId()%>&idPerfil=<%=id%>&opcao=desvincular"><img src="imagens/excluir.png" border="0"></a></td>
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

<%@page import="modelo.Menu"%>
<%@page import="modelo.MenuDAO"%>
<%--@page import="modelo.Perfil"--%>
<%@page import="java.util.ArrayList"%>
<%--@page import="modelo.PerfilDAO"--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div align="center">
            <table width="760" border="1">
                <tr>
                    <td width="760" height="150">
                        <%@include file="banner.jsp" %>
                    </td>
                </tr>
                <tr>
                    <td width="760" height="20" valign="top">
                        <%--@include file="menu.jsp" --%> 
                         <a href="form_inserir_usuario.jsp">Inserir Usuário</a> | <a href="form_inserir_menu.jsp">Inserir Menu</a> | <a href="form_inserir_perfil.jsp">Inserir Perfil</a> |  <a href="listar_usuario.jsp">Listar Usuário</a> |  <a href="listar_menu.jsp">Listar Menu</a>
                    </td>
                </tr>
                <tr>
                    <td width="760" height="330">
                        <div align="center">
                            <h2>Lista de Menus <a href=form_inserir_menu.jsp> (novo menu) </a></h2>
                            <table width="550" border="1">
                                <tr bgcolor="#d3d3d3">
                                    <td>MENU</td>
                                    <td>LINK</td>
                                </tr>
                                <%                                            
                                            try {
                                                MenuDAO mDB = new MenuDAO();
                                                ArrayList<Menu> lista;
                                                mDB.conectar();
                                                lista = mDB.listar();
                                                for(Menu m:lista){
                                                    %>
                                                    <tr>
                                                        <td><%=m.getId() %></td>
                                                        <td><%=m.getMenu() %></td>
                                                        <td><%=m.getLink() %></td>
                                                        <td align="center"><%--=u.getPerfil() --%> --- </td>
                                                        <td align="center"> --- </td>
                                                        <td align="center"> --- </td>
                                                    </tr>
                                                    <%
                                                }
                                                mDB.desconectar();
                                            } catch (Exception erro) {
                                                out.print(erro);
                                            }
                                %>
                            </table>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </body>
</html>

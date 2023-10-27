<%@page import="modelo.Menu"%>
<%@page import="modelo.Usuario"%>
<%@page import="modelo.PerfilDAO"%>
<%@page import="java.util.ArrayList"%>

<%
    Usuario usuario = new Usuario();
    try{
        usuario = (Usuario) session.getAttribute("usuario");
        out.print(usuario.getNome_usuario()+ " [ <a href='sair.jsp'>SAIR</a> ] <p>");
        if (usuario == null){
            response.sendRedirect("login.jsp");
    }
%>
    <table width="300">
        <tr>
<%
            PerfilDAO perfilBD = new PerfilDAO();
            perfilBD.conectar();
            ArrayList<Menu> listaMenu = perfilBD.menusVinculados(usuario.getIdPerfil());
            for(Menu menu: listaMenu){
%>
                <td align="center" height="20"> <a href="<%=menu.getLink() %>"><%=menu.getNome_menu()%></a> </td>
<%
            }
            perfilBD.desconectar();
%>
        </tr>
    </table> <br>
<%
    } catch(Exception e){
        out.print(e);
        response.sendRedirect("login.jsp");
    }
    
%>

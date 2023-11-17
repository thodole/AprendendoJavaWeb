<%@page import="java.util.ArrayList"%>
<%@page import="modelo.PerfilDAO"%>
<%@page import="modelo.Menu"%>
<%@page import="modelo.Usuario"%>
<%
Usuario usuario = new Usuario();
try{
    usuario = (Usuario) session.getAttribute("usuario");
    out.print(usuario.getNome() + " (<a href='sair.jsp'>Sair</a>)");
    if (usuario == null){
        response.sendRedirect("login.jsp");
    }
    %>
    <table border="1" width="770">
    <tr>
        <%
        PerfilDAO pDB = new PerfilDAO();
        pDB.conectar();
        ArrayList<Menu> listaMenu = pDB.menusVinculados(usuario.getId_perfil());
        
        for(Menu m: listaMenu){
        %>
        <td height="20"><a href="<%=m.getLink() %>"><img src="imagens/<%=m.getIcone() %>"/><%=m.getMenu() %></a></td>
        <%
        }
        pDB.desconectar();
        %>
    </tr>
    </table>
    
<%
}catch(Exception e){
    //out.print(e);
    response.sendRedirect("login.jsp");
}

%>


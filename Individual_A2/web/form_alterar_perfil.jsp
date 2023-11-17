<%@page import="modelo.Perfil"%>
<%@page import="modelo.PerfilDAO"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script language="javascript" >
            function validaForm(){
                formulario = document.form_perfil;
                if(formulario.perfil.value==""){
                    alert("O Campo perfil deve ser preenchido!!");
                    formulario.perfil.focus();
                    return false;
                }

                return true;
            }
        </script>
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
                        <%@include file="menu.jsp" %>
                    </td>
                </tr>
                <tr>
                    <td width="760" height="330">
                        <div align="center">
                            <h2>Alterando Perfil</h2>
                            <form name="form_perfil" action="alterar_perfil.do" method="post" onsubmit="return validaForm();">
                            <table width="300" border="0">
                                <%
                                            int id = Integer.parseInt(request.getParameter("id"));
                                            try {
                                                PerfilDAO pDB = new PerfilDAO();
                                                pDB.conectar();
                                                Perfil p = pDB.carregaPorId(id);
                                                pDB.desconectar();
                                                if (p.getId()>0){
                                                    %>
                                                    <tr>
                                                        <td>ID:</td>
                                                        <td><%=p.getId() %> <input type="hidden" name="id" value="<%=p.getId() %>"> </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Perfil:</td>
                                                        <td>
                                                            <input type="text" name="perfil" value="<%=p.getPerfil() %>" size="60">
                                                        </td>
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
            </table>
        </div>
    </body>
</html>

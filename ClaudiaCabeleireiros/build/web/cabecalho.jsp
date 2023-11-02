<%-- 
    Document   : cabecalho
    Created on : 02/11/2023, 11:49:34
    Author     : rafaa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="CSS/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <title>Página Inicial</title>
        
    </head>
    
            <div class="sombra"></div> 
                <div align="center">
                    <table>
                        <ul class="nav justify-content-end">
                            <a class="navbar-brand" href="index.jsp">
                              <img src="imagens/logo.jpg" alt="Logo" width="100%" height="70" class="d-inline-block align-text-top">
                            </a>
                            <li class="nav-item">
                              <a class="nav-link active" href="listarUsuario.jsp">Usuário</a>
                            </li>
                            <li class="nav-item">
                              <a class="nav-link" href="listarPerfil.jsp">Perfil</a>
                            </li>
                            <li class="nav-item">
                              <a class="nav-link " href="listarServico.jsp">Serviços</a>
                            </li>
                            <li class="nav-item">
                              <a class="nav-link " href="listarCliente.jsp">Cliente</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="login.jsp" role="button" aria-haspopup="true" aria-expanded="false">Sair</a>
                             </li>
                          </ul>
                    </table>
                </div>  
                                 
</html>

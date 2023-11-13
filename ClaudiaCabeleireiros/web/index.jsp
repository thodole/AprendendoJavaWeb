<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html pt-br>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="CSS/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <title>Página Inicial</title>
        
    </head>
    <body>
        <header class="fundo">
            <div class="sombra"></div> 
                <div align="center">
                    <table>
                        <ul class="nav justify-content-end">
                            <a class="navbar-brand" href="#">
                              <img src="imagens/logo_semfundo.png" alt="Logo" width="100%" height="50"  class="d-inline-block align-text-top">
                            </a>
                             <li class="nav-item">
                                <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Acesso</a>
                                <div class="dropdown-menu">
                                  <a class="dropdown-item" href="#"><%@include file="menu.jsp"%></a>
                                </div>
                              </li>
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
                          </ul>
                    </table>
                </div>
                        <section class="banner">
                            <div class="banner-text">
                                <h1> Claúdia Cabelereiros</h1>
                                <p>Onde a Beleza se Encontra com o Bem-Estar</p>
                                <button type="button" class="btn btn-outline-dark">Marque seu horário</button>
                            </div>
                        </section>
                                      
       </header>
                                
    <%--faca mais --%>                            
    <sectiion class="faca">
        <div class="container">
            <div class="faca-txt">
                <h3>Venha ser a sua melhor versão</h3>
                <p>temos os melhores serviços de cabelo,manicúre e pedicúre, para voce se 
                    tornar a mulher perfefeita</p>
                <button type="button" class="btn btn-outline-dark1">Marque seu horário</button>
            </div>
            <div class="faca-img">
                <img src="imagens/img.jpg" alt="" class="img">
            </div>
        </div>
    </sectiion>
    
    <%-- faça mais 2 --%>
    
    <sectiion class="faca">
        <div class="container">
            <div class="faca-img">
                <img src="imagens/img_2.jpg" alt="" class="img2">
            </div>
            <div class="faca-txt2">
                <h3>Texto exemplo</h3>
                <p>temos os melhores serviços de cabelo,manicúre e pedicúre, para voce se 
                    tornar a mulher perfefeita</p>
                <button type="button" class="btn btn-outline-dark1">Marque seu horário</button>
            </div>
            
        </div>
    </sectiion>
    
    <%-- Depoimentos --%>
    <section class="depoimentos">
        <div class="container">
            <h3>Nossos Depoimentos</h3>
            <p> O que nossos clientes falam de nós</p>
            
            <div class="cards">
                <%-- card item 1 --%>
                <div class="card-item">
                    <img src="imagens/card1.jpg">
                    <p class="n-user">Maria Cristina</p>
                    <p class="depoimento-user">Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
                        Proin quis ligula quis ex tempor ullamcorper. Integer eu auctor diam. 
                        Ut bibendum pulvinar magna eu tempor. Maecenas volutpat metus et porttitor maximus.
                        Praesent imperdiet felis augue, quis sodales nisi ultrices et. In eu maximus neque. 
                        In venenatis justo a fringilla aliquam.
                        Quisque sit amet ornare ante. Morbi aliquet tempor maximus.
                    </p>
                    <div class="star">
                        <i class="fa fa-star" aria-hidden="true"></i>
                        <i class="fa fa-star" aria-hidden="true"></i>
                        <i class="fa fa-star" aria-hidden="true"></i>
                        <i class="fa fa-star" aria-hidden="true"></i>
                        <i class="fa fa-star" aria-hidden="true"></i>
                    </div>
                </div>
                 <%-- card item 1 fim --%>
                 
                  <%-- card item 2 --%>
                <div class="card-item">
                    <img src="imagens/card2.jpg">
                    <p class="n-user">Maria Cristina</p>
                    <p class="depoimento-user">Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
                        Proin quis ligula quis ex tempor ullamcorper. Integer eu auctor diam. 
                        Ut bibendum pulvinar magna eu tempor. Maecenas volutpat metus et porttitor maximus.
                        Praesent imperdiet felis augue, quis sodales nisi ultrices et. In eu maximus neque. 
                        In venenatis justo a fringilla aliquam.
                        Quisque sit amet ornare ante. Morbi aliquet tempor maximus.
                    </p>
                    <div class="star">
                        <i class="fa fa-star" aria-hidden="true"></i>
                        <i class="fa fa-star" aria-hidden="true"></i>
                        <i class="fa fa-star" aria-hidden="true"></i>
                        <i class="fa fa-star" aria-hidden="true"></i>
                        <i class="fa fa-star-half-o" aria-hidden="true"></i>
                    </div>
                </div>
                 <%-- card item 2 fim --%>
                 
                  <%-- card item 3 --%>
                <div class="card-item">
                    <img src="imagens/card3.png">
                    <p class="n-user">Maria Cristina</p>
                    <p class="depoimento-user">Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
                        Proin quis ligula quis ex tempor ullamcorper. Integer eu auctor diam. 
                        Ut bibendum pulvinar magna eu tempor. Maecenas volutpat metus et porttitor maximus.
                        Praesent imperdiet felis augue, quis sodales nisi ultrices et. In eu maximus neque. 
                        In venenatis justo a fringilla aliquam.
                        Quisque sit amet ornare ante. Morbi aliquet tempor maximus.
                    </p>
                    <div class="star">
                        <i class="fa fa-star" aria-hidden="true"></i>
                        <i class="fa fa-star" aria-hidden="true"></i>
                        <i class="fa fa-star" aria-hidden="true"></i>
                        <i class="fa fa-star" aria-hidden="true"></i>
                        <i class="fa fa-star-o" aria-hidden="true"></i>
                    </div>
                </div>
                 <%-- card item 3 fim --%>
            </div>
        </div>
        
        
        
    </section>
            
     <sectiion class="faca">
        <div class="container">
            <div class="faca-txt">
                <h3>Melhor cuidando das suas unhas</h3>
                <p>As melhores profissionais para cuidar e deixar suas unhas lindas</p>
                <button type="button" class="btn btn-outline-dark1">Marque seu horário</button>
            </div>
            <div class="faca-img">
                <img src="imagens/img_3.jpg" alt="" class="img">
            </div>
        </div>
    </sectiion>
            
            <footer class="footer">
                <div class="container">
                    <div calss="link">
                        <a href="#">
                            <i class="fa fa-instagram" aria-hidden="true"></i>
                            <i class="fa fa-phone" aria-hidden="true"> 93456-7432 </i> 
                        </a>
                    </div>
                    <p class="desenvolvedor">Desenvolvido: Grupo 4</p>
                </div>
            </footer>
    </body>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</html>
<%-- TESTE CONCLUÍDO --%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html lang='pt-br'>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tela Login</title>
        <style type="text/css">
            
            .cor{
                color: #e31e6e;
            }
            img{
                margin-right: 25px;
            }
            button{
                cursor: pointer;
            }
            
        </style>
        <script language="javascript" >
            function validaForm(){
                formulario = document.formularioLogin;
                if(formulario.login.value==""){
                    alert("O campo Login deve ser preenchido!");
                    formulario.login.focus();
                    return false;
                }
                if(formulario.senha.value==""){
                    alert("O campo Senha deve ser preenchido!");
                    formulario.senha.focus();
                    return false;
                }


                return true;
            }
        </script>
    </head>
    <body>
        <br><br><br><br>   
    <center>
        <form action="efetuarLogin.do" method="post" name="formularioLogin" onsubmit="return validaForm();">
            <table width="300" border="0">
                <tr>
                    <td rowspan="4" width="150"><br>
                        <img src="imagens/cadeado.png">
                    </td>
                    <td>
                        <br><br><br>
                    </td>
                    <td>

                    </td>
                </tr>
                <tr>
                    <td class="cor">
                        Login:
                    </td>
                    <td>
                        <input type="text" name="login" size="20">
                    </td>
                </tr>
                <tr>
                    <td class="cor">
                        Senha:
                    </td>
                    <td>
                        <input type="password" name="senha" size="20">
                    </td>
                </tr>
                <tr>
                    <td>

                    </td>
                    <td>
                        <button type="submit">  Entrar </button>
                    </td>
                </tr>
            </table>
        </form>
    </center>
    </body>
</html>

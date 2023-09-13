<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Acesso Restrito</title>
        <script language="javascript" >
            function validaForm(){
                formulario = document.form_login;
                if(formulario.login.value==""){
                    alert("O Campo login deve ser preenchido!!");
                    formulario.login.focus();
                    return false;
                }
                if(formulario.senha.value==""){
                    alert("O Campo senha deve ser preenchido!!");
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
        <form action="efetuar_login.do" method="post" name="form_login" onsubmit="return validaForm();">
            <table width="300" border="0">
                <tr>
                    <td rowspan="4" width="150"><br>
                        <img src="imagens/cadeado.jpg">
                    </td>
                    <td>
                        <br><br><br>
                    </td>
                    <td>

                    </td>
                </tr>
                <tr>
                    <td>
                        Usuário:
                    </td>
                    <td>
                        <input type="text" name="login" size="20">
                    </td>
                </tr>
                <tr>
                    <td>
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
                        <input type="submit" value="Entrar">
                    </td>
                </tr>
            </table>
        </form>
    </center>
</body>
</html>

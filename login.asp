<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="assets/e.css" type="text/css" />
    <% Response.Charset="UTF-8" %>
    <%
    if Session("nome") <> "" Then
        Response.Redirect("dashboard.asp")
    End If
    %>
</head>
<body>
    <div class="content">
        <form action="serverside/autenticador.asp" method="get" name="log">
        <table class="userArea">
            <tr>
                <td colspan="3" class="cell">
                    <h1>NORTHWIND</h1>
                </td>
            </tr>
            <% 
                IF request.queryString("r") = "Sucesso" Then
                    Response.Write("<tr><td colspan='3' class='cell'> <p> Usuário criado com sucesso </p></td></tr>")
                End If
            %>
            <tr>
                <td class="cell">
                    <p>E-mail</p>
                </td>
                <td class="cell">
                    <p>Senha</p>
                </td>
            </tr>
            <tr>
                <td class="cell">
                    <input type="text" name="email">
                </td>
                <td class="cell">
                    <input type="password" name="senha">
                </td>
                <td class="cell">
                    <button type="submit" onclick="ValidarLogin(event)">Entrar</button>
                </td>
            </tr>
            <tr>
                <td class="cell">
                    <p>Esqueci a senha</p>
                </td>
                <td class="cell">
                    <p><a href="cadastro.asp">Novo usuário</a></p>
                </td>
            </tr>
            <tr>
                <td colspan="3" class="cell">
                    <div class="validacao"></div>
                </td>
            </tr>
        </table>  
        </form>
    </div>

    <script>
    function ValidarLogin(e) {
        
        e.preventDefault();

        if(document.forms["log"]["email"].value==""|document.forms["log"]["senha"].value=="") {
            return;
        }

        xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange=function() {
            if (this.readyState==4 && this.status==200) {
                if(this.responseText == "ok") {
                    document.forms["log"].submit();
                } else {
                    document.querySelector(".validacao").innerHTML = "E-mail e senha não coincidem";
                }
            }      
        }
        xmlhttp.open("GET", "serverside/userExists.asp?email=" + document.forms["log"]["email"].value + "&senha=" + document.forms["log"]["senha"].value, true);
        xmlhttp.send();
    }
    </script>
</body>
</html>

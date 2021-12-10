<!DOCTYPE html>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="assets/e.css" type="text/css" />
    <% response.Charset="UTF-8" %>
</head>
<body>
    <div class="content">
    <form action="serverside/novoCadastro.asp" method="post" name="cad">
        <table class="userArea">
            <tr>
                <td colspan="3" class="cell">
                    <h1>NORTHWIND</h1>
                </td>
            </tr>
            <tr>
                <td class="cell">
                    <p>Nome</p>
                </td>
                <td class="cell">
                    <input type="text" name="nome" style="width: 100%;">
                </td>
            </tr>
            <tr>
                <td class="cell">
                    <p>Email</p>
                </td>
                <td class="cell">
                    <input type="text" name="email" style="width: 100%;">
                </td>
            </tr>
            <tr>
                <td class="cell">
                    <p>Nascimento</p>
                </td>
                <td class="cell">
                    <input type="date" name="nascimento" style="width: 100%;">
                </td>
            </tr>
            <tr>
                <td class="cell">
                    <p>Senha</p>
                </td>
                <td class="cell">
                    <input type="password" name="senha" style="width: 100%;">
                </td>
            </tr>
            <tr>
                <td class="cell">
                    <p>Senha</p>
                </td>
                <td class="cell">
                    <input type="password" name="senha2" style="width: 100%;">
                </td>
            </tr>
            <tr>
                <td class="cell">
                    <p></p>
                </td>
                <td class="cell">
                    <input type="checkbox" name="receberemail" style="float:left">
                    <span style="float:right">Receber e-mail</span>
                </td>
            </tr>
            <tr>
                <td class="cell" colspan="2">
                    <button type="submit" style="display:flex; margin:auto;" onClick="validarForm(event)">Gravar</button>
                </td>
            </tr>
            <tr>
                <td class="cell" colspan="2">
                    <div class="validacao">
                    </div>
                </td>
            </tr>
        </table>  
        </form>
    </div>

    <script>
    function validarForm(e) {
        
        e.preventDefault();
        document.querySelector(".validacao").innerHTML = ""; 

        for (let campo of document.forms["cad"]) {
            if(campo.value == "" && campo.name != "") {
                document.querySelector(".validacao").innerHTML += "O campo " + campo.name + " deve ser preenchido <br>";
                return false;
            }
        }

        if(document.forms["cad"]["senha"].value != document.forms["cad"]["senha2"].value) {
            document.querySelector(".validacao").innerHTML += "A senha e a confirmação não coincidem";
            return false;
        }

        xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange=function() {
            if (this.readyState==4 && this.status==200) {
                if(this.responseText == "ok") {
                    document.forms["cad"].submit();
                } else {
                    document.querySelector(".validacao").innerHTML = "Esse e-mail já está em uso";
                }
            }      
        }
        xmlhttp.open("GET", "serverside/checkEmail.asp?email=" + document.forms["cad"]["email"].value, true);
        xmlhttp.send();
        
    }
    </script>
</body>
</html>
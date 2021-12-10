<!DOCTYPE html>
<head>
    <title></title>
</head>
<body>

    <table>
    <form action="index.asp" method="get">
        <tr>
            <td>
            nome: <br>
            <input name="nome" type="text" value="" placeholder="nome">
            </td>
            <td>
            sobrenome: <br>
            <input name="sobrenome" type="text" value="" placeholder="sobrenome">
            </td>
            <td>
            <button type="submit">Confirmar</button>
            </td>
        </tr>
    </form>
    </table>
    <br><br>
    <% 
        If Request.QueryString("nome") = "" Then
            If Request.QueryString("sobrenome") = "" Then
                Response.write("Boas vindas, convidado")
            Else
                Response.write("Preencha o campo de nome e sobrenome")
            End If
        Else
            If Request.QueryString("sobrenome") = "" Then
                Response.write("Preencha o campo de nome e sobrenome")
            Else
                Response.write("Boas vindas, " + Request.QueryString("nome") + " " + Request.QueryString("sobrenome"))
            End If
        End If
    %>

</body>
</html>
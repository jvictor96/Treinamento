<% Response.Charset="UTF-8" %>
<form name="busca">
<table class="displayer">
    <tr>
        <td colspan='3' class="cell">
            <p>Produtos</p>
        </td>
    </tr>

    <tr>
        <td class="cell">
            <p>Nome</p>
        </td>

        <td class="cell">
            <input type='text' name='nome'>
        </td>
        
        <td class="cell">
            <p>Categoria</p>
        </td>

        <td class="cell">
            <select name="cat" id="cat" style="width:170px;">
                <option value="">---</option>
                <!--#include file="serverside/getCategorias.asp" -->
            </select>
        </td>

        <td class="cell">
        </td>

        <td class="cell">
            <button type='submit' onclick="BuscaProdutos(event)" >Pesquisar</button>
        </td>
    </tr>

    <tr style='border: solid black 1px;'>
        <td class="cell" style='border-bottom: solid black 1px;'><p>Categoria</p></td>
        <td class="cell" style='border-bottom: solid black 1px;'><p>Produto</p></td>
        <td class="cell" style='border-bottom: solid black 1px;'><p>Quantidade</p></td>
        <td class="cell" style='border-bottom: solid black 1px;'><p>Preço</p></td>
        <td class="cell" style='border-bottom: solid black 1px;'><p></p></td>
        <td class="cell" style='border-bottom: solid black 1px;'><p onclick="enviaEmail()">Enviar e-mail</p></td>
    </tr>

</table>
</form>

<script>
let nome, cat;

function enviaEmail() {
    xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange=function() {
        if (this.readyState==4 && this.status==200) {
        }      
    }
    xmlhttp.open("GET", "serverside/email.asp?nome=" + nome + "&cat=" + cat , true);
    xmlhttp.send();
}

function BuscaProdutos(e) {
    e.preventDefault();
    nome = document.forms["busca"]["nome"].value;
    cat = document.forms["busca"]["cat"].value;

    xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange=function() {
        if (this.readyState==4 && this.status==200) {
            document.querySelector(".displayer").innerHTML += this.responseText;
            document.forms["busca"]["nome"].value = nome;
            document.forms["busca"]["cat"].value = cat;
        }      
    }
    xmlhttp.open("GET", "serverside/busca.asp?nome=" + nome + "&cat=" + cat , true);
    xmlhttp.send();

    for (let obj of document.querySelectorAll(".resultado")) {
        obj.remove();
    }
}

</script>
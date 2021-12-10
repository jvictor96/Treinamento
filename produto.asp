<form name="prod" method="post" action="serverside/novoProduto.asp">
<table>
<tr>

<td class="cell">
<p> Nome </p>
</td>

<td class="cell">
<p> Categoria </p>
</td>

<td class="cell">
<p> Preço </p>
</td>

<td class="cell">
<p> Quantidade </p>
</td>

<td class="cell">
<p> Id </p>
</td>

</tr>

<tr>

<td class="cell">
<input type="text" name="nome">
</td>

<td class="cell">

    <select name="cat" id="cat" style="width:170px;">
        <!--#include file="serverside/getCategorias.asp" -->
    </select>
</td>

<td class="cell">
<input type="text" name="preco" style="width: 100px;">
</td>

<td class="cell">
<input type="text" name="qtt" style="width: 100px;">
</td>

<td class="cell">
<input type="text" name="id" style="width: 100px;" onchange="buscaProdutoPorID()">
</td>

<td class="cell">
<button type="submit">Gravar</button>
</td>
</tr>

<tr>

<td class="cell">
<p onclick="buscaProduto(event)"> Buscar </p>
</td>


<td class="cell" colspan="4">
<p class="acao"> </p>
</td>

</tr>

</table>
</form>
<script>

function buscaProduto(e) {
    
    e.preventDefault();

    xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange=function() {
        if (this.readyState==4 && this.status==200) {
            let produto = xmlhttp.responseText.split("---");
            if(produto[0] != "erro") {
                document.forms["prod"]["nome"].value = produto[0];
                document.forms["prod"]["cat"].value = produto[1];
                document.forms["prod"]["preco"].value = produto[2].replace(",",".");
                document.forms["prod"]["qtt"].value = produto[3];
                document.forms["prod"]["id"].value = produto[4];
                document.querySelector(".acao").innerHTML = "Alterando o registro de: " + produto[0];
            }
        }      
    }
    xmlhttp.open("GET", "serverside/buscaProduto.asp?nome=" + document.forms["prod"]["nome"].value,true);
    xmlhttp.send();

    for (let obj of document.querySelectorAll(".resultado")) {
        obj.remove();
    }
}


function buscaProdutoPorID() {
    if(document.forms["prod"]["id"].value == "") {
            document.querySelector(".acao").innerHTML = "Criando novo registro";
        return
    }

    xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange=function() {
        if (this.readyState==4 && this.status==200) {
            let resultado = xmlhttp.responseText.split("---");
            if(resultado != "erro") {
                document.forms["prod"]["nome"].value = resultado[0];
                document.forms["prod"]["cat"].value = resultado[1];
                document.forms["prod"]["preco"].value = resultado[2];
                document.forms["prod"]["qtt"].value = resultado[3];
                document.querySelector(".acao").innerHTML = "Alterando o registro de: " + resultado[0];
            } else {
                document.forms["prod"]["id"].value = "";
                document.querySelector(".acao").innerHTML = "Criando novo registro";
            }
        }      
    }
    xmlhttp.open("GET", "serverside/buscaProduto.asp?id=" + document.forms["prod"]["id"].value,true);
    xmlhttp.send();

    for (let obj of document.querySelectorAll(".resultado")) {
        obj.remove();
    }
}

</script>
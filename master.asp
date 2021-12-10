<!DOCTYPE html>
<html>
<head>
    <% Response.Charset="UTF-8" %>
    <%
    if Session("nome") = "" Then
        Response.Redirect("login.asp")
    End If
    %>
    <title></title>
    <link rel="stylesheet" href="assets/dashboard.css" type="text/css" />
</head>
<body>
    <div class="userHeader">
        <!--#include file="userHeader.asp"-->
    </div>
    <div class="produtos">
        <!--#include file="produtos.asp"-->
    </div>
    <div class="content">
        <!--#include file="produto.asp"-->
    </div>
</body>
</html>

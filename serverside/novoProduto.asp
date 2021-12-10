<!--#include file="conexao.asp"-->

<%
    if request.Form("id") <> "" Then
        sql="UPDATE ASP_Products SET "
        sql=sql & "ProductName = '" & Request.Form("nome") & "', "
        sql=sql & "CategoryID = '" & Request.Form("cat") & "', "
        sql=sql & "UnitPrice = '" & Request.Form("preco") & "', "
        sql=sql & "UnitsInStock = '" & Request.Form("qtt") & "' "
        sql=sql & "WHERE ProductID = " & Request.Form("id")
    Else
        sql = "INSERT INTO asp_Products (ProductName, CategoryID, UnitPrice, UnitsInStock, Discontinued)"
        sql = sql & " VALUES "
        sql=sql & "('" & Request.Form("nome") & "', "
        sql=sql & Request.Form("cat") & ", "
        sql=sql & Request.Form("preco") & ", "
        sql=sql & Request.Form("qtt") & ", "
        sql=sql & 0 & ")"
    End If

    on error resume next
    conn.Execute sql, recaffected
    if err<>0 then
        Response.Write(err)
        Response.Write(sql)
    else
        Response.Write("<h3>" & recaffected & " record added</h3>")
    end if
    conn.close

%>
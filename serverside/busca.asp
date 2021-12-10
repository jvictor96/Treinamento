<!--#include file="conexao.asp" -->

<%
    Response.Charset="UTF-8"
    sql = "Select CategoryName, ProductName, UnitsInStock, UnitPrice from asp_Products as prod"
    sql = sql & " join Categories as cat on cat.CategoryID = prod.CategoryID"

    If request.queryString("cat") <> "" Then
        sql = sql & " Where prod.CategoryID = " & request.queryString("cat")
        If request.queryString("nome") <> "" Then
            sql = sql & " AND ProductName LIKE '%" & request.queryString("nome") & "%'"
        End If
    Else
        If request.queryString("nome") <> "" Then
            sql = sql & " Where ProductName LIKE '%" & request.queryString("nome") & "%'"
        End If
    End If

    set rs=Server.CreateObject("ADODB.recordset")
    rs.Open sql,conn

    do until rs.EOF
        Response.Write("<tr style='border: solid black 1px;' class = 'resultado'>")
        Response.Write("<td class='cell' style='border-bottom: solid black 1px;'><p>" & rs.Fields("CategoryName") & "</p></td>")
        Response.Write("<td class='cell' style='border-bottom: solid black 1px;'><p>" & rs.Fields("ProductName") & "</p></td>")
        Response.Write("<td class='cell' style='border-bottom: solid black 1px;'><p>" & rs.Fields("UnitsInStock") & "</p></td>")
        Response.Write("<td class='cell' style='border-bottom: solid black 1px;'><p>" & rs.Fields("UnitPrice") & "</p></td></tr>")
        rs.MoveNext
    loop

    rs.Close
    conn.Close
%>
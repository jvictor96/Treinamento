<!--#include file="conexao.asp" -->

<%
sql = "Select * from asp_products as prod"
if request.queryString("nome") <> "" Then
sql = sql + " where ProductName like '%" & request.queryString("nome") & "%'"
Else
sql = sql + " where ProductID = " & request.queryString("id") & ""
End if

    set rs=Server.CreateObject("ADODB.recordset")
    rs.Open sql,conn

if rs.EOF and rs.BOF Then
Response.Write("erro")
else 
Response.Write(rs.Fields("ProductName") & "---")
Response.Write(rs.Fields("CategoryID") & "---")
Response.Write(rs.Fields("UnitPrice") & "---")
Response.Write(rs.Fields("UnitsInStock") &"---")
Response.Write(rs.Fields("ProductID"))
end If


%>
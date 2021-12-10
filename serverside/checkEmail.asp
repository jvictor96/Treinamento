<!--#include file="conexao.asp"-->

<%
Dim sql
Dim n

n = 0
sql = "select COUNT(*) from ASP_USUARIO where DCEML = '" + Request.queryString("email") + "'"

set rs=Server.CreateObject("ADODB.recordset")
rs.Open sql,conn

for each x in rs.Fields
    if x = 0 then
        Response.Write("ok")
    else
        Response.Write("change")
    end If
next

rs.Close
conn.Close

%>
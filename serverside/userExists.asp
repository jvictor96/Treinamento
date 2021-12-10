<!--#include file="conexao.asp" -->

<%
Dim sql
Dim n

n = 0
sql = "select COUNT(*) from ASP_USUARIO where DCEML = '" + Request.queryString("email") + "'"
sql = sql  + " AND DCSENUSU = '" + Request.queryString("senha") + "'"

set rs=Server.CreateObject("ADODB.recordset")
rs.Open sql,conn

for each x in rs.Fields
    if x = 0 then
        Response.Write("erro")
    else
        Response.Write("ok")
    end If
next

rs.Close
conn.Close

%>
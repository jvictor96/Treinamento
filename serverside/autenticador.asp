<!--#include file="conexao.asp" -->

<%

sql = "select * from ASP_USUARIO where DCEML = '" + Request.queryString("email") + "'"
sql = sql  + " AND DCSENUSU = '" + Request.queryString("senha") + "'"

set rs2=Server.CreateObject("ADODB.recordset")
rs2.Open sql,conn

Session("nome") = rs2.Fields("NMUSU")
Response.Redirect("../dashboard.asp")

rs2.Close
conn.Close
%>

<!--#include file="conexao.asp" -->
            
<%
sql = "Select CategoryID, CategoryName from Categories"

set rs=Server.CreateObject("ADODB.recordset")
rs.Open sql,conn

do until rs.EOF
    Response.Write("<option value='" & rs.Fields("CategoryID").Value & "'>" + rs.Fields("CategoryName").Value + "</option>")
    rs.MoveNext
loop

rs.Close
conn.Close
%>
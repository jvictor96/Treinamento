<!--#include file="conexao.asp" -->
<%
Response.Charset="UTF-8"
    mail = ""
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
        mail = mail & "<tr style='border: solid black 1px;' class = 'resultado'>"
        mail = mail & "<td class='cell' style='border-bottom: solid black 1px;'><p>" & rs.Fields("CategoryName") & "</p></td>"
        mail = mail & "<td class='cell' style='border-bottom: solid black 1px;'><p>" & rs.Fields("ProductName") & "</p></td>"
        mail = mail & "<td class='cell' style='border-bottom: solid black 1px;'><p>" & rs.Fields("UnitsInStock") & "</p></td>"
        mail = mail & "<td class='cell' style='border-bottom: solid black 1px;'><p>" & rs.Fields("UnitPrice") & "</p></td></tr>"
        rs.MoveNext
    loop

    rs.Close
    conn.Close

Set myMail = CreateObject("CDO.Message")


myMail.Configuration.Fields("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
myMail.Configuration.Fields("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1
myMail.Configuration.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "smtp.gmail.com"
myMail.Configuration.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 465
myMail.Configuration.Fields("http://schemas.microsoft.com/cdo/configuration/sendusername") = "jvictor96@gmail.com"
myMail.Configuration.Fields("http://schemas.microsoft.com/cdo/configuration/sendpassword") = "afukgxtyzoysyjdr"
myMail.Configuration.Fields("http://schemas.microsoft.com/cdo/configuration/sendtls") = True
myMail.Configuration.Fields("http://schemas.microsoft.com/cdo/configuration/smtpusessl") = True
myMail.Configuration.Fields.Update


myMail.Subject = "Sending email with CDO" 
myMail.From = "jvictor96@gmail.com"
myMail.To = "jvictor96@gmail.com"
myMail.HTMLBody = "<h1>This is a message.</h1> <table style='width: 100%;''>" & mail & "</table>"

myMail.Send
set myMail = nothing
%>
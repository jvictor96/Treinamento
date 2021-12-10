<!--#include file="conexao.asp"-->

<%
    Dim sql
    sql="INSERT INTO ASP_USUARIO (NMUSU,DCEML,"
    sql=sql & "DTNSC,DCSENUSU,FLEML)"
    sql=sql & " VALUES "
    sql=sql & "('" & Request.Form("nome") & "',"
    sql=sql & "'" & Request.Form("email") & "',"
    sql=sql & "'" & Request.Form("nascimento") & "',"
    sql=sql & "'" & Request.Form("senha") & "',"
    If Request.Form("receberemail") = "on" Then
        sql=sql & "'S')"
    Else
        sql=sql & "'N')"
    End If

    on error resume next
    conn.Execute sql,recaffected
    if err<>0 then
        Response.Write(err)
        Response.Write(sql)
        Response.Redirect("../login.asp?r=Falha")
    else
        Response.Write("<h3>" & recaffected & " record added</h3>")
        Response.Redirect("../login.asp?r=Sucesso")
    end if
    conn.close

%>
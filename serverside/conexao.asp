<%
Set conn=Server.CreateObject("ADODB.Connection")

connectDB = conn.Open("Provider=SQLOLEDB.1;Persist Security Info=False;User ID=sysmestra;Password=mestrasys;Initial Catalog=treinamento_java;Data Source=192.100.100.59")
%>


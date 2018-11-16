<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../config/config.asp"-->
<% if Session("lojista_id") = "" then 
        response.redirect("login.asp")
    end if %> 
<%
Response.clear()%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<TABLE Border=1>
	<tr>
		<td>Código</td>
		<td>Nome</td>
		<td>Sobrenome</td>
		<td>Tipo de ingresso</td>
		<td>E-mail</td>
		<td>Telefone</td>
		<td>Celular</td>
		<td>Data da festa</td>
		<td>Fase do planejamento</td>
	</tr><%
Response.AddHeader "Content-Disposition","attachment; filename=" & geraNomeArquivo(".xls")
Set upl = Server.CreateObject("SoftArtisans.Fileup")
    upl.CodePage = 65001
    Server.ScriptTimeout = 99000
   Response.CharSet = "utf-8"
SQL = upl.Form("SQL")
Response.ContentType = "application/vnd.ms-excel"
 
set objconn=server.createobject("adodb.connection")
 
objconn.Open DataSource
 
set objrs=objconn.execute(SQL)
 
%>
<%
 
'Percorre cada linha e exibe cada campo da tabela
 
while not objrs.eof
%>
<TR>
<% For i = 0 to objrs.fields.count - 1
%>
<TD VALIGN=TOP><% = objrs(i) %></TD>
<% Next %>
</TR>
<%
objrs.MoveNext
 
wend
 
objrs.Close
objconn.close
%>
</TABLE>
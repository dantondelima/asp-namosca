<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<% Response.CodePage = 65001
   Response.CharSet = "utf-8" %>

<!--#include file="../config/config.asp"-->
<!--#include file="template-lojista.asp"-->

<% if Session("lojista_id") = "" then 
        response.redirect("../login.asp")
    end if %> 
	<a href="cadastro-codigo.asp" class="btn btn-primary" style="margin-bottom:15px; margin-left:89%">Nova consulta</a>

	<table>
		<thead style='background-color: rgba(4, 209, 164, .9);'>
			<td style='width:10%;border: 1px solid black; text-align: center'>Num. ingresso</td>
			<td style='width:10%;border: 1px solid black; text-align: center'>Nome</td>
			<td style='width:10%;border: 1px solid black; text-align: center'>Sobrenome</td>
			<td style='width:10%;border: 1px solid black; text-align: center'>Tipo ingresso</td>
			<td style='width:10%;border: 1px solid black; text-align: center'>E-mail</td>
			<td style='width:10%;border: 1px solid black; text-align: center'>Telefone</td>
			<td style='width:10%;border: 1px solid black; text-align: center'>Celular</td>
			<td style='width:10%;border: 1px solid black; text-align: center'>Data festa</td>
			<td style='width:10%;border: 1px solid black; text-align: center'>Status planejamento</td>
		</thead>
		<tbody>
	<%
		corpo = "<table><thead style='background-color: rgba(4, 209, 164, .9);'><tr><td style='width:10%;border: 1px solid black; text-align: center'>Num. ingresso</td><td style='width:10%;border: 1px solid black; text-align: center'>Nome</td><td style='width:10%;border: 1px solid black; text-align: center'>Sobrenome</td><td style='width:10%;border: 1px solid black; text-align: center'>Tipo ingresso</td><td style='width:10%;border: 1px solid black; text-align: center'>E-mail</td><td style='width:10%;border: 1px solid black; text-align: center'>Telefone</td><td style='width:10%;border: 1px solid black; text-align: center'>Celular</td><td style='width:10%;border: 1px solid black; text-align: center'>Data festa</td><td style='width:10%;border: 1px solid black; text-align: center'>Status planejamento</td></tr></thead><tbody>"
	Set upl = Server.CreateObject("SoftArtisans.Fileup")
    upl.CodePage = 65001
	MinhaVariavel = upl.Form("lista")
	MinhaVariavel = Replace(MinhaVariavel, Chr(13), ";")
	MinhaVariavel = Replace(MinhaVariavel, " ", "")
	codigos = Split(MinhaVariavel, ";")
	for i=1 to uBound(codigos)
		z=Len(codigos(i))
		codigos(i) = Right(codigos(i), z-1)
	Next 
	SQL = "SELECT * FROM asp_participante WHERE n_ingresso in ("
	for i=0 to uBound(codigos)
	 	codigos(i) = trim(codigos(i))
	 	SQL = SQL & "'" & codigos(i) & "', "
	Next
	SQL = SQL & "'0');"
	Set consulta = consultaSql( SQL )
	Do Until consulta.EOF
	    %><tr><%
	    corpo = corpo & "<tr>"
	    for each x in consulta.fields %>  
    	<td style="width:10%;border: 1px solid black; text-align: center"> <%=response.write(x.value)%></td><%
    	corpo = corpo & "<td style='width:10%;border: 1px solid black; text-align: center'>" & x.value & "</td>"
	    next
	   	consulta.MoveNext
	   	%></tr><%
	   	corpo = corpo & "</tr>"
	Loop 
	corpo = corpo & "</tbody></table>"
	SQL2 = "select * from asp_lojista where cd_lojista = '" & Session("lojista_id") & "'"
	set consulta2 = consultaSql (SQL2)
	call enviaEmailContato("smtp@kbrtec.com.br", "Na mosca", consulta2("nm_email"), "", "Dados da pesquisa", corpo)
%>
</tbody>
</table>
<a href="" class="btn btn-primary" style="float:left; margin-top:15px" onclick="window.print();">Imprimir</a>
		<form id="Form" method="POST" action="excel-codigo.asp" enctype='multipart/form-data'>
			<button style="margin-top:15px;margin-left:15px;" class="btn btn-primary" type="submit" value="<%= SQL %>" name="SQL" id="SQL">Extrair para Excel</button>
		</form>
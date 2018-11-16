<%@LANGUAGE="VBSCRIPT" CODEPAGE="1254"%>
<!--#include file="../config/config.asp"-->
<!-- #include file = "template-lojista.asp" -->  
<%
	if Session("lojista_id") = "" then 
        response.redirect("../login.asp")
    end if
	Response.CodePage = 65001
	Response.CharSet = "utf-8"
	Set upl = Server.CreateObject("SoftArtisans.Fileup")
    upl.CodePage = 1254
    Server.ScriptTimeout = 99000
    SQL = "SELECT * FROM asp_participante WHERE"
    upl.Path = "e:\home\abmbrasilkbrtec\Web\danton\asp-namosca\csv\"
    csv = upl.Form("arquivo").UserFileName
    extensao_arquivo = lCase( retornaExtensao( csv ) )
    if ( inStr( "csv", extensao_arquivo ) ) then
    	nomecsv = geraNomeArquivo(extensao_arquivo)
    	upl.Form( "arquivo" ).SaveAs Server.MapPath("../csv") & "\" & nomecsv
    	set fs=Server.CreateObject("Scripting.FileSystemObject")
		set f=fs.OpenTextFile(Server.MapPath("..\csv") & "\"  & nomecsv ) %>
		<a href="cadastro-csv.asp" class="btn btn-primary" style="margin-left:84%; margin-bottom:15px">Realizar nova consulta</a>
		<table>
				<thead style="background-color: rgba(4, 209, 164, .9);">	
						<td width="50px" style="border: 1px solid black; text-align: center">Num. ingresso</td>
						<td width="50px" style="border: 1px solid black; text-align: center">Nome</td>
						<td width="50px" style="border: 1px solid black; text-align: center">Sobrenome</td>
						<td width="50px" style="border: 1px solid black; text-align: center">Tipo ingresso</td>
						<td style="border: 1px solid black; width:50px; text-align: center">E-mail</td>
						<td style="border: 1px solid black; text-align: center">Telefone</td>
						<td width="50px" style="border: 1px solid black; text-align: center">Celular</td>
						<td width="5000px" style="border: 1px solid black; text-align: center">Data festa</td>
						<td width="50px" style="border: 1px solid black; text-align: center">Status planejamento</td>
				</thead>
				<tbody>
		<%
		corpo = "<table><thead style='background-color: rgba(4, 209, 164, .9);'><tr><td style='width:10%;border: 1px solid black; text-align: center'>Num. ingresso</td><td style='width:10%;border: 1px solid black; text-align: center'>Nome</td><td style='width:10%;border: 1px solid black; text-align: center'>Sobrenome</td><td style='width:10%;border: 1px solid black; text-align: center'>Tipo ingresso</td><td style='width:10%;border: 1px solid black; text-align: center'>E-mail</td><td style='width:10%;border: 1px solid black; text-align: center'>Telefone</td><td style='width:10%;border: 1px solid black; text-align: center'>Celular</td><td style='width:10%;border: 1px solid black; text-align: center'>Data festa</td><td style='width:10%;border: 1px solid black; text-align: center'>Status planejamento</td></tr></thead><tbody>"		
		do while f.AtEndOfStream = false
			linha = f.ReadLine
			conteudo = Split(linha, "," )
			aspas = Left(conteudo(2), 1)

			id = Replace(conteudo(2), aspas, "")
			SQL2 = "SELECT * FROM asp_participante WHERE n_ingresso ='" & id & "'"
			SQL = SQL & " n_ingresso = '" & id & "' OR"
			Set consulta = consultaSql( SQL2 )
			%> 
			
			<%
			Do Until consulta.EOF
				%><tr><%
				corpo = corpo & "<tr>"
			    for each x in consulta.fields %>
			    
			    	<td style="width:10%;border: 1px solid black; text-align: center"> <%=response.write(x.value)%></td>
			<%        
			        corpo = corpo & "<td style='width:10%;border: 1px solid black; text-align: center'>" & x.value & "</td>"
			    next
			   	consulta.MoveNext			   		
			%></tr><%
	   	corpo = corpo & "</tr>"
	Loop 
		loop
		corpo = corpo & "</tbody></table>"
		f.Close
		Set f=Nothing
		Set fs=Nothing
		SQL = SQL & " n_ingresso = '0'"
	End if

	SQL2 = "select * from asp_lojista where cd_lojista = '" & Session("lojista_id") & "'"
	set consulta2 = consultaSql (SQL2)
	call enviaEmailContato("smtp@kbrtec.com.br", "Na mosca", consulta2("nm_email"), "", "Dados da pesquisa", corpo)
	%>
</tbody>
	</table>
	<a href="#" class="btn btn-primary" style="float:left; margin-top:15px" onclick="window.print();">Imprimir</a>
	<form id="Form" method="POST" action="excel.asp" enctype='multipart/form-data'>
			<button class="btn btn-success" style="margin-top:15px; margin-left:30px" type="submit" value="<%= SQL %>" name="SQL" id="SQL">Extrair para Excel</button>
		</form>
<% 
	
%>

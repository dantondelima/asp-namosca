<%
	Response.Flush()

	qtPorPagina	= 50
	qtPaginas	= 5
	
	'CSS e QueryString
	urlPaginaRequisicao	= Request.ServerVariables( "URL" )

	urlPaginaRequisicao	= Split( urlPaginaRequisicao , "/" )
	paginaRequisicao	= url_dominio & Replace( urlPaginaRequisicao( uBound( urlPaginaRequisicao ) ) , ".asp" , "/" )
	paginaQueryString	= ""
	
	pagAtual = limpa( Request.QueryString( "pag" ) )
	If Not IsNumeric( pagAtual ) Or pagAtual = "" Or pagAtual <= "0" Then pagAtual = 1
%>
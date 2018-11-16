<%
	Function caracterePermitido( pComentario )
		retorno = True

'		If inStr( lCase( pComentario ) , "http://" ) Then retorno = False
'		If inStr( lCase( pComentario ) , "https://" ) Then retorno = False
'		If inStr( lCase( pComentario ) , "www." ) Then retorno = False
	
		If inStr( lCase( pComentario ) , "<a" ) Then retorno = False
		If inStr( lCase( pComentario ) , "</a>" ) Then retorno = False
		If inStr( lCase( pComentario ) , "<script" ) Then retorno = False
		If inStr( lCase( pComentario ) , "</script>" ) Then retorno = False
		If inStr( lCase( pComentario ) , "porn " ) Then retorno = False
		If inStr( lCase( pComentario ) , "porn." ) Then retorno = False
		If inStr( lCase( pComentario ) , "sex " ) Then retorno = False
		If inStr( lCase( pComentario ) , "sex." ) Then retorno = False
		
		caracterePermitido = retorno
	End Function
	
	Sub acessoNegado( pMensagem , pUrlSite )
		tipoAcessoNegado 	= ""
		HTTP_URL		= pUrlSite
		HTTP_ORIGIN		= lCase( Request.ServerVariables( "HTTP_ORIGIN" ) )
		HTTP_REFERER	= lCase( Request.ServerVariables( "HTTP_REFERER" ) )
		
		If HTTP_ORIGIN = "" And HTTP_REFERER = "" Then
			tipoAcessoNegado = "0"
		Else
			HTTP_URL		= Replace( Replace( HTTP_URL , "http://" , "" ) , "https://" , "" )
			HTTP_ORIGIN		= Replace( Replace( HTTP_ORIGIN , "http://" , "" ) , "https://" , "" )
			HTTP_REFERER	= Replace( Replace( HTTP_REFERER , "http://" , "" ) , "https://" , "" )
	
			HTTP_URL		= Replace( HTTP_URL , "/" , "" )
			HTTP_REFERER	= Split( HTTP_REFERER , "/" )
			
			If HTTP_ORIGIN <> HTTP_URL Then
				If HTTP_REFERER( 0 ) <> HTTP_URL Then
					tipoAcessoNegado = "1"
				End If
			Else
				If HTTP_REFERER( 0 ) <> HTTP_URL Then
					tipoAcessoNegado = "2"
				End If
			End If
		End If
		
		If Not caracterePermitido( pMensagem ) Then tipoAcessoNegado = "3"
	
		If InStr( uCase( Request.ServerVariables( "REQUEST_METHOD" ) ) , "POST" ) < 1 Then tipoAcessoNegado = "4"
		If InStr( uCase( Request.ServerVariables( "HTTP_CONTENT_TYPE" ) ) , "FORM" ) < 1 Then tipoAcessoNegado = "5"
		
		If tipoAcessoNegado <> "" Then Call mensagem( "erro" , "Acesso Negado!<br />Código: "& tipoAcessoNegado &"" , "" )
	End Sub
%>
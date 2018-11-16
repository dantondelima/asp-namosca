<%
	Function debug()
		If Request.ServerVariables("REMOTE_ADDR") = "177.103.242.99" Then
			Response.Write( "- DEBUG KBRTEC -<br /><br />" )
			debug = True
		Else
			debug = False
		End If
	End Function
	
	Function validaEmail( ByVal pString )
		Dim regEx
		Dim ResultadoHum
		Dim ResultadoDois 
		Dim ResultadoTres
		Set regEx = New RegExp
		
		regEx.IgnoreCase	= True        
		regEx.Global		= True             
		
		regEx.Pattern	= "[^@\-\.\w]|^[_@\.\-]|[@\.]{2}|(@)[^@]*\1"
		ResultadoHum	= RegEx.Test( pString )
		
		regEx.Pattern	= "@[\w\-]+\."        
		ResultadoDois	= RegEx.Test( pString )
		
		regEx.Pattern	= "\.[a-zA-Z]{2,3}$"  
		ResultadoTres	= RegEx.Test( pString )
		
		Set regEx = Nothing
		
		If Not ResultadoHum And ResultadoDois And ResultadoTres Then
			fRetorno = True
		Else
			fRetorno = False
		End If
		
		validaEmail = fRetorno
	End Function
	
	Function limpa( ByVal pString )
		fRetorno = ""
		pString = Trim( pString )
		
		If pString <> "" Then
			fRetorno = pString
			fRetorno = Replace( fRetorno , Chr( 34 ) , "chr34" )
			fRetorno = Replace( fRetorno , "%" , "chr37" )
			fRetorno = Replace( fRetorno , "&" , "chr38" )
			fRetorno = Replace( fRetorno , "'" , "chr39" )
			fRetorno = Replace( fRetorno , "<" , "chr60" )
			fRetorno = Replace( fRetorno , ">" , "chr62" )
		End If
		
		limpa = fRetorno
	End Function

	Function limpaResan( ByVal pString )
		fRetorno = ""
		pString = Trim( pString )
		
		If pString <> "" Then
			fRetorno = pString
			fRetorno = Replace( fRetorno , Chr( 34 ) , "" )
			fRetorno = Replace( fRetorno , "%" , "" )
			fRetorno = Replace( fRetorno , "&" , "" )
			fRetorno = Replace( fRetorno , "'" , "" )
			fRetorno = Replace( fRetorno , "<" , "" )
			fRetorno = Replace( fRetorno , ">" , "" )
			fRetorno = Replace( fRetorno , " " , "" ) 
			fRetorno = Replace( fRetorno , "!" , "" ) 
			fRetorno = Replace( fRetorno , "?" , "" ) 
			fRetorno = Replace( fRetorno , "@" , "" ) 
			fRetorno = Replace( fRetorno , "#" , "" ) 
			fRetorno = Replace( fRetorno , "$" , "" ) 
			fRetorno = Replace( fRetorno , "*" , "" ) 
			fRetorno = Replace( fRetorno , "+" , "" ) 
			fRetorno = Replace( fRetorno , "{" , "" ) 
			fRetorno = Replace( fRetorno , "}" , "" ) 
			fRetorno = Replace( fRetorno , "[" , "" )
			fRetorno = Replace( fRetorno , "]" , "" ) 
			fRetorno = Replace( fRetorno , "(" , "" ) 
			fRetorno = Replace( fRetorno , ")" , "" ) 
			fRetorno = Replace( fRetorno , "." , "" )
			fRetorno = Replace( fRetorno , ":" , "" )
			fRetorno = Replace( fRetorno , "," , "" )
			fRetorno = Replace( fRetorno , ";" , "" )
			fRetorno = Replace( fRetorno , "/" , "" )
			fRetorno = Replace( fRetorno , "=" , "" )
			fRetorno = Replace( fRetorno , "|" , "" )
			fRetorno = Replace( fRetorno , "¨" , "" )
			fRetorno = Replace( fRetorno , "´" , "" )
			fRetorno = Replace( fRetorno , "`" , "" )
			fRetorno = Replace( fRetorno , "^" , "" )
			fRetorno = Replace( fRetorno , "~" , "" )
			fRetorno = Replace( fRetorno , "ª" , "" )
			fRetorno = Replace( fRetorno , "º" , "" )
			fRetorno = Replace( fRetorno , "°" , "" )
			fRetorno = Replace( fRetorno , "À" , "A" )
			fRetorno = Replace( fRetorno , "Á" , "A" )
			fRetorno = Replace( fRetorno , "Â" , "A" )
			fRetorno = Replace( fRetorno , "Ã" , "A" )
			fRetorno = Replace( fRetorno , "Ä" , "A" )
			fRetorno = Replace( fRetorno , "Å" , "A" )
			fRetorno = Replace( fRetorno , "à" , "a" )
			fRetorno = Replace( fRetorno , "á" , "a" )
			fRetorno = Replace( fRetorno , "â" , "a" )
			fRetorno = Replace( fRetorno , "ã" , "a" )
			fRetorno = Replace( fRetorno , "ä" , "a" )
			fRetorno = Replace( fRetorno , "å" , "a" )
			fRetorno = Replace( fRetorno , "Ò" , "O" )
			fRetorno = Replace( fRetorno , "Ó" , "O" )
			fRetorno = Replace( fRetorno , "Ô" , "O" )
			fRetorno = Replace( fRetorno , "Õ" , "O" )
			fRetorno = Replace( fRetorno , "Õ" , "O" )
			fRetorno = Replace( fRetorno , "Ö" , "O" )
			fRetorno = Replace( fRetorno , "Ø" , "o" )
			fRetorno = Replace( fRetorno , "ò" , "o" )
			fRetorno = Replace( fRetorno , "ó" , "o" )
			fRetorno = Replace( fRetorno , "ô" , "o" )
			fRetorno = Replace( fRetorno , "õ" , "o" )
			fRetorno = Replace( fRetorno , "ö" , "o" )
			fRetorno = Replace( fRetorno , "ø" , "" )
			fRetorno = Replace( fRetorno , "È" , "E" )
			fRetorno = Replace( fRetorno , "É" , "E" )
			fRetorno = Replace( fRetorno , "Ê" , "E" )
			fRetorno = Replace( fRetorno , "Ë" , "E" )
			fRetorno = Replace( fRetorno , "è" , "e" )
			fRetorno = Replace( fRetorno , "é" , "e" )
			fRetorno = Replace( fRetorno , "ê" , "e" )
			fRetorno = Replace( fRetorno , "ë" , "e" )
			fRetorno = Replace( fRetorno , "ð" , "" )
			fRetorno = Replace( fRetorno , "Ç" , "C" )
			fRetorno = Replace( fRetorno , "ç" , "c" )
			fRetorno = Replace( fRetorno , "Ð" , "D" )
			fRetorno = Replace( fRetorno , "Ì" , "I" )
			fRetorno = Replace( fRetorno , "Í" , "I" )
			fRetorno = Replace( fRetorno , "Î" , "I" )
			fRetorno = Replace( fRetorno , "Ï" , "I" )
			fRetorno = Replace( fRetorno , "ì" , "i" )
			fRetorno = Replace( fRetorno , "í" , "i" )
			fRetorno = Replace( fRetorno , "î" , "i" )
			fRetorno = Replace( fRetorno , "ï" , "i" )
			fRetorno = Replace( fRetorno , "Ù" , "U" )
			fRetorno = Replace( fRetorno , "Ú" , "U" )
			fRetorno = Replace( fRetorno , "Û" , "U" )
			fRetorno = Replace( fRetorno , "Ü" , "U" )
			fRetorno = Replace( fRetorno , "ù" , "u" )
			fRetorno = Replace( fRetorno , "ú" , "u" )
			fRetorno = Replace( fRetorno , "û" , "u" )
			fRetorno = Replace( fRetorno , "ü" , "u" )
			fRetorno = Replace( fRetorno , "Ñ" , "N" )
			fRetorno = Replace( fRetorno , "ñ" , "n" )
			fRetorno = Replace( fRetorno , "Š" , "S" )
			fRetorno = Replace( fRetorno , "š" , "s" )
			fRetorno = Replace( fRetorno , "Ÿ" , "Y" )
			fRetorno = Replace( fRetorno , "ÿ" , "y" )
			fRetorno = Replace( fRetorno , "ý" , "y" )
			fRetorno = Replace( fRetorno , "Ý" , "Y" )
			fRetorno = Replace( fRetorno , "Ž" , "Z" )
			fRetorno = Replace( fRetorno , "ž" , "z" )

		End if
		
		limpaResan = fRetorno
	End Function
	
	Function troca( ByVal pString )
		fRetorno = ""

		pString = Trim( pString )
		
		If pString <> "" Then
			fRetorno = pString
			fRetorno = Replace( fRetorno , "chr34" , Chr( 34 ) )
			fRetorno = Replace( fRetorno , "chr37" , "%" )
			fRetorno = Replace( fRetorno , "chr38" , "&" )
			fRetorno = Replace( fRetorno , "chr39" , "'" )
			fRetorno = Replace( fRetorno , "chr60" , "<" )
			fRetorno = Replace( fRetorno , "chr62" , ">" )
		End If
		
		troca = fRetorno
	End Function
	
	Function formataData( ByVal pData )
		'DD/MM/AAAA
		fRetorno = ""
		
		fDia = Day( pData )
		fMes = Month( pData )
		fAno = Year( pData )
		
		If fDia < 10 Then fDia = "0" & fDia
		If fMes < 10 Then fMes = "0" & fMes
		
		fRetorno = fDia & "/" & fMes & "/" & fAno
				
		formataData = fRetorno
	End Function
	
	Function formataHorario( ByVal pData )
		'HH:MM
		fRetorno = ""
		
		fHora	= Hour( pData )
		fMinuto	= Minute( pData )
		
		If fHora < 10 Then fHora = "0" & fHora
		If fMinuto < 10 Then fMinuto = "0" & fMinuto
		
		fRetorno = fHora & ":" & fMinuto

		formataHorario = fRetorno
	End Function	

	Function formataDia( ByVal pData )
		'DD/MM/AAAA
		fRetorno = ""
		
		dia = Day( pData )
		
		If dia < 10 Then dia = "0" & dia
		
		fRetorno = dia

		formataDia = fRetorno
	End Function
	
	Function formatDateTimeMySql( ByVal pData )
		'AAAA-MM-DD HH:MN:SS
		fRetorno = ""
		
		dia		= Day( pData )
		mes		= Month( pData )
		ano		= Year( pData )
		hora	= Hour( pData )
		minuto	= Minute( pData )
		segundo	= Second( pData )
		
		If dia < 10 Then dia = "0" & dia
		If mes < 10 Then mes = "0" & mes
		If hora < 10 Then hora = "0" & hora
		If minuto < 10 Then minuto = "0" & minuto
		If segundo < 10 Then segundo = "0" & segundo
		
		fRetorno = ano & "-" & mes & "-" & dia & " " & hora & ":" & minuto & ":" & segundo

		formatDateTimeMySql = fRetorno
	End Function	
	
	Function retornaPrimeiraMaiuscula( ByVal pString )
		fRetorno = ""
	
		fPrimeiraLetra	= Left( pString , 1 )
		fRestante		= Right( pString , Len( pString ) - 1 )
		fRetorno 		= UCase( fPrimeiraLetra ) & fRestante
		
		retornaPrimeiraMaiuscula = fRetorno
	End Function
	
	Function retornaDiaSemana( ByVal pData )
		fRetorno = ""
		fRetorno = retornaPrimeiraMaiuscula( WeekDayName( WeekDay( pData ) ) )

		retornaDiaSemana = fRetorno
	End Function
	
	Function retornaNomeMes( ByVal pData , ByVal pAbrev )
		'se for número é dia, senão é data.
		fRetorno = ""
		
		If IsNumeric( pData ) Then
			fRetorno = retornaPrimeiraMaiuscula( MonthName( Month( pData ) ))
		Else
			fRetorno = retornaPrimeiraMaiuscula( MonthName( Month( pData ) ) )
		End If
		
		If LCase( CStr( pAbrev ) ) = "true" Then
			if fRetorno <> "Maio" Then
				fRetorno = UCase( Mid( fRetorno , 1 , 3 ) )
			End if
		End if
		
		retornaNomeMes = fRetorno
	End Function

	Function retornaDataExtenso( ByVal pData , ByVal pSessionLcid )
		fRetorno = ""
		fRetorno = retornaDiaSemana( pData ) & ", " & formataDia( pData ) & " de " & retornaNomeMes( pData , False ) & " de " & Year( pData )
		
		retornaDataExtenso = fRetorno
	End Function
	
	Function retornaExtensao( ByVal pArquivo )
		fRetorno = ""		
		pArquivo = Split( pArquivo , "." )
		
		retornaExtensao = pArquivo( UBound( pArquivo ) )
	End Function
	
	Sub redimensionaImagem( pLargura , pAltura , pCaminhoAtual , pCaminhoNovo , pNomeAtual , pNomeNovo )
		imgWidth  = pLargura
		imgHeight = pAltura
	
		Set Jpeg = Server.CreateObject( "Persits.Jpeg" )

		Jpeg.Open pCaminhoAtual & pNomeAtual

		If CInt( imgWidth ) = 0 Or CInt( imgHeight ) = 0 Then
			If CInt( imgWidth ) = 0 Then
				Jpeg.Height  = imgHeight
				Jpeg.Width   = CInt( ( Jpeg.OriginalWidth * Jpeg.Height ) / Jpeg.OriginalHeight )
			Else
				Jpeg.Width   = imgWidth
				Jpeg.Height  = CInt( ( Jpeg.OriginalHeight * Jpeg.Width ) / Jpeg.OriginalWidth )
			End If
		Else
			If CInt( Jpeg.OriginalHeight ) > imgHeight Or Cint( Jpeg.OriginalWidth ) > imgWidth Then
				If CInt( Jpeg.OriginalHeight ) > CInt( Jpeg.OriginalWidth ) Then
					Jpeg.Height  = imgHeight
					Jpeg.Width   = CInt( ( Jpeg.OriginalWidth * Jpeg.Height ) / Jpeg.OriginalHeight )
				Else
					Jpeg.Width   = imgWidth
					Jpeg.Height  = CInt( ( Jpeg.OriginalHeight * Jpeg.Width ) / Jpeg.OriginalWidth )
				End If
			End if
		End If

		Jpeg.Quality = 100

		Jpeg.Save pCaminhoNovo & pNomeNovo
		
		Set Jpeg = Nothing
	End Sub
	
	Sub apagaArquivo( ByVal pCaminhoArquivo )
		Set fObj = CreateObject("Scripting.FileSystemObject")
		
		If fObj.FileExists( pCaminhoArquivo ) Then fObj.DeleteFile( pCaminhoArquivo )
		
		Set fObj = Nothing
	End Sub

	Function existeArquivo( ByVal pCaminhoArquivo )
		fRetorno = ""
		
		Set fObj = CreateObject("Scripting.FileSystemObject")
		
		If fObj.FileExists( pCaminhoArquivo ) Then
			fRetorno = True
		Else
			fRetorno = False
		End If
		
		Set fObj = Nothing
		
		existeArquivo = fRetorno
	End Function
	
	Function carregaArquivo( ByVal pArquivo )
		fPath = Server.MapPath( pArquivo )

		Set ObjFso = Server.CreateObject( "Scripting.FileSystemObject" )

		Set ObjAbreArq	= ObjFso.OpenTextFile( fPath , 1 , True , False )
		fRetorno = ObjAbreArq.ReadAll()
		ObjAbreArq.Close
		Set ObjAbreArq	= Nothing
		Set ObjFso = Nothing
		
		fRetorno = Replace( fRetorno , "[#urlSite#]" , url_site )
		fRetorno = Replace( fRetorno , "[#empresa#]" , empresa )
		fRetorno = Replace( fRetorno , "[#ano#]" , Year( Now() ) )

		carregaArquivo = fRetorno
	End Function

	Function enviaEmailAssociado(remetente,remetente_nome,destino,copia,assunto,corpo)
		Set Mail = Server.CreateObject("Persits.MailSender")

		Mail.Host = "smtplw.com.br"
		Mail.Port = 587
		Mail.Username = "kbrtec12"
		Mail.Password = "E4HsryASrHtW5M"
		Mail.From = troca(remetente)
		Mail.FromName = Mail.EncodeHeader(troca(remetente_nome), "iso-8859-1")
		Mail.AddAddress troca(destino)
		Mail.AddBcc troca(copia)
		Mail.Subject = Mail.EncodeHeader(troca(assunto), "iso-8859-1")
		Mail.Body = corpo
		Mail.IsHTML = True
		
		On Error Resume Next
		Mail.Send

		If Err <> 0 Then
		  'Response.Write "Ocorreu um erro: " & Err.Description
		End If

		Set Mail = Nothing
	End Function
	
	Function enviaEmailContato(remetente,remetente_nome,destino,copia,assunto,corpo)
		
		Set Mail = Server.CreateObject("Persits.MailSender")

'		Mail.Host = "smtp.resan.com.br"
'		Mail.Port = 587
'		Mail.Username = "webmaster@resan.com.br"
'		Mail.Password = "123resan123"
		Mail.Host = "smtplw.com.br"
		Mail.Port = 587
		Mail.Username = "kbrtec12"
		Mail.Password = "BAitGJQUsHUu2q"
		Mail.From = troca(remetente)
		Mail.FromName = Mail.EncodeHeader(troca(remetente_nome), "iso-8859-1")
		Mail.AddAddress troca(destino)
		Mail.AddBcc troca(copia)
		Mail.Subject = Mail.EncodeHeader(troca(assunto), "iso-8859-1")
		Mail.Body = corpo
		Mail.IsHTML = True
		
		On Error Resume Next
		Mail.Send
		If Err <> 0 Then
		  'Response.Write "Ocorreu um erro: " & Err.Description
		End If

		Set mail = Nothing
	End Function

	Function enviaEmailMailing(smtp_host,smtp_username,smtp_senha,remetente,remetente_nome,destino,copia,assunto,corpo)
		
		Set Mail = Server.CreateObject("Persits.MailSender")

'		Mail.Host = "smtp.resan.com.br"
'		Mail.Port = 587
'		Mail.Username = "webmaster@resan.com.br"
'		Mail.Password = "123resan123"
		Mail.Host = smtp_host
		Mail.Port = 587
		Mail.Username = smtp_username
		Mail.Password = smtp_senha
		Mail.From = troca(remetente)
		Mail.FromName = Mail.EncodeHeader(troca(remetente_nome), "iso-8859-1")
		Mail.AddAddress troca(destino)
		Mail.AddBcc troca(copia)
		Mail.Subject = Mail.EncodeHeader(troca(assunto), "iso-8859-1")
		Mail.Body = corpo
		Mail.IsHTML = True
		
		On Error Resume Next
		Mail.Send
		If Err <> 0 Then
		  'Response.Write "Ocorreu um erro: " & Err.Description
		End If

		Set mail = Nothing
	End Function	
	
	function validaCodigo(ByVal pCodigo)
		Retorno_validaCodigo = true
		if pCodigo = "" then
			Retorno_validaCodigo = false
		else
			if not isNumeric(pCodigo) then
				Retorno_validaCodigo = false
			end if
		end if
		validaCodigo = Retorno_validaCodigo
	end function	

	function retornaNumeroAleatorio(qtd)
		str_aleatorio = ""
		if qtd="" or not isnumeric(qtd) then qtd=0
		for var_i=1 to qtd
			Randomize
			num_aleatorio = Int((10 * Rnd) + 1)
			num_aleatorio = num_aleatorio + 47
			str_aleatorio = str_aleatorio & chr( num_aleatorio )
		next
		retornaNumeroAleatorio = str_aleatorio
	end function	
	
	function geraNomeArquivo( ByVal extensao )
		dataRef = Now
		geraNomeArquivo =	Year(dataRef)	& "_" &_
							Month(dataRef)	& "_" &_
							Day(dataRef)	& "_" &_
							Hour(dataRef)	& "_" &_
							Minute(dataRef)	& "_" &_
							Second(dataRef) & "_" &_
							retornaNumeroAleatorio(2) &_
							retornaNumeroAleatorio(3) &_ 
							"." &	extensao
	end function	
	
	function geraNomeArquivoCompleto( ByVal pNomeArquivo )
		retorno_geraNomeArquivoCompleto = ""
		arquivo  = Lcase(Mid( pNomeArquivo ,instrrev( pNomeArquivo ,"\")+1))
		extensao = retornaExtensao(arquivo)
		retorno_geraNomeArquivoCompleto = lCase(geraNomeArquivo(extensao))
		geraNomeArquivoCompleto = retorno_geraNomeArquivoCompleto
	end function	
	
	function inArray(ByVal pArray, ByVal pBusca)
		retorno_inArray = -1
		if ( isArray(pArray) ) then
			c_inArray = 0
			while ( ( retorno_inArray = -1 ) AND ( c_inArray <= uBound(pArray) ) )
				if cStr( pArray(c_inArray) ) = cStr(pBusca) then
					retorno_inArray = c_inArray
				end if
				c_inArray = c_inArray + 1
			wend
		end if
		inArray = retorno_inArray
	end function	
	
	function isNullOrEmpty(byVal pString)
		fRetorno_isNullOrEmpty = false
		if isNull(pString) then
			fRetorno_isNullOrEmpty = true
		else
			if pString = "" then
				fRetorno_isNullOrEmpty = true
			end if
		end if
		isNullOrEmpty = fRetorno_isNullOrEmpty
	end function
	
	function ToBool(pValor)
		dim rf_ToBool
		rf_ToBool = null
		if cStr(pValor) = "1" then
			rf_ToBool = true
		else
			if cStr(pValor) = "0" then
				rf_ToBool = false
			end if
		end if
		ToBool = rf_ToBool
	end function
	
	'Mensagens
	function mensagemErro( ByVal msg )
		Response.Write("<div class='alert alert-danger'><strong>"&msg&"</strong></div>")
	end function	
	
	function mensagemSucesso( ByVal msg )
		conteudo = "<div class='col-lg-5'><div class='alert alert-success'><button type='button' class='btn btn-info btn-circle'>" &_
		 "<i class='fa fa-check'></i></button><strong>&nbsp;"&msg&"</strong></div></div>"
		 
		 Response.Write(conteudo)
	end function	

	function removeTags( ByVal tString )
		Dim pString
		Set pString = new RegExp
		pString.Pattern = "<[^>]+>"
		pString.IgnoreCase = True
		pString.Global = True
		removeTags = pString.Replace(tString, "")
		Set pString = Nothing
	end function

	function limitaTexto(ByVal txtALimitar, ByVal qtCaracteres)
		txtRetorno = txtALimitar
		if(Len(txtALimitar)>= CInt(qtCaracteres)) then
			txtRetorno = Left(txtRetorno,qtCaracteres)
			txtRetorno = txtRetorno&" (...)"

		end if
		limitaTexto = txtRetorno
	end function

	Function RemoveAcentos(Texto)
	    'Conjunto de Caracteres com acentos
	    ComAcentos = "Á Í Ó Ú É Ä Ï Ö Ü Ë À Ì Ò Ù È Ã Õ Â Î Ô Û Ê á í ó ú é ä ï ö ü ë à ì ò ù è ã õ â î ô û ê Ç ç"
	    ComAcentosA = split(comAcentos," ")
	    'Conjunto de Caracteres sem acentos
	    SemAcentos = "A I O U E A I O U E A I O U E A O A I O U E a i o u e a i o u e a i o u e a o a i o u e C c"
	    SemAcentosA = split(SemAcentos," ")

	    Resultado = Texto
	   
	    for o = 0 to ubound(ComAcentosA)
	    	Resultado = Replace(Resultado, ComAcentosA(o), SemAcentosA(o))
	    next
	    RemoveAcentos = Resultado
	End Function
%>
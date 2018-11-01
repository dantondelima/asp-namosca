<%
	Sub preencheCombo( ByVal pSQL , ByVal pValue )
		Set fConexao = Server.CreateObject("AdoDb.Connection")
		fConexao.CursorLocation = 3
		fConexao.Open DataSource
		Set fConsulta = Server.CreateObject("AdoDb.RecordSet")

		fConsulta.Open pSQL , fConexao , 3 , 1
		
		pValue = "|"& Replace( pValue , "," , "|" ) &"|"

		While Not fConsulta.EOF
			If InStr( pValue , "|" & fConsulta( 0 ) & "|" ) > 0 Then
				fSelected = " selected=""selected"" "
			Else
				fSelected = ""
			End If
		%>
    	  	<option value="<%=fConsulta( 0 )%>"<%=fSelected%>><%=troca( fConsulta( 1 ) )%></option>
    	<%
			fSelected = ""
			fConsulta.MoveNext
		Wend
		
		fConsulta.Close
		Set fConsulta = Nothing
		fConexao.Close
		Set fConexao = Nothing
	End Sub
	
	Function consultaSql( ByVal pSQL )
		Set fConexao = Server.CreateObject("AdoDb.Connection")
		fConexao.CursorLocation = 3
		fConexao.Open DataSource
		Set fConsulta = Server.CreateObject("AdoDb.RecordSet")
		
		fConsulta.Open pSQL , fConexao , 3 , 1
		
		fConsulta.ActiveConnection = Nothing
		
		fConexao.Close
		Set fConexao = Nothing
		
		Set consultaSql = fConsulta
	End Function
	
	Function consultaSqlServer( ByVal pSQL )
		Set fConexao = Server.CreateObject("AdoDb.Connection")
		fConexao.CursorLocation = 3
		fConexao.Open DataSourceSqlServer
		Set fConsulta = Server.CreateObject("AdoDb.RecordSet")
		
		fConsulta.Open pSQL , fConexao , 3 , 1
		
		fConsulta.ActiveConnection = Nothing
		
		fConexao.Close
		Set fConexao = Nothing
		
		Set consultaSqlServer = fConsulta
	End Function

	Function execSql( ByVal fSQL )
		Dim fRetorno
		fRetorno = ""
		
		Set fConexao = Server.CreateObject("AdoDb.Connection")
		fConexao.CursorLocation = 3
		fConexao.Open DataSource
		
		fConexao.Execute fSQL , RecordsAffected
		fRetorno = fConexao.Execute("SELECT @@IDENTITY")(0).Value
		
		fConexao.Close
		Set fConexao = Nothing
		
		execSql = fRetorno
	End Function
	
	Function execComando( ByRef pConexao , ByVal pSQL , ByVal pArray )
		Set fComando = CreateObject("AdoDb.Command")
		
		fComando.ActiveConnection	= pConexao
		fComando.CommandText		= pSQL
		fComando.CommandType		= 1
		
		pArray = Split( pArray )
		
		For fCont = LBound( pArray ) To Ubound( pArray )
			fComando.Parameters( fCont ) = pArray( fCont )
		Next
		
		fComando.Execute
		
		Set fComando = Nothing
	end function
	
	Function consultaCampo( ByVal fSQL )
		Dim fRetorno
		fRetorno = ""
		
		Set fConexao = Server.CreateObject("AdoDb.Connection")
		fConexao.CursorLocation = 3
		fConexao.Open DataSource
		Set fConsulta = Server.CreateObject("AdoDb.RecordSet")
		
		fConsulta.Open fSQL , fConexao , 3 , 1
		Set fConsulta.ActiveConnection = Nothing
		
		If Not fConsulta.EOF Then fRetorno = fConsulta(0)
		
		fConsulta.Close
		Set fConsulta = Nothing
		fConexao.Close
		Set fConexao = Nothing
		
		consultaCampo = fRetorno
	End Function
	
	Function consultaCampoSqlServer( ByVal fSQL )
		Dim fRetorno
		fRetorno = ""
		
		Set fConexao = Server.CreateObject("AdoDb.Connection")
		fConexao.CursorLocation = 3
		fConexao.Open DataSourceSqlServer
		Set fConsulta = Server.CreateObject("AdoDb.RecordSet")
		
		fConsulta.Open fSQL , fConexao , 3 , 1
		Set fConsulta.ActiveConnection = Nothing
		
		If Not fConsulta.EOF Then fRetorno = fConsulta(0)
		
		fConsulta.Close
		Set fConsulta = Nothing
		fConexao.Close
		Set fConexao = Nothing
		
		consultaCampoSqlServer = fRetorno
	End Function

	function consultaCampoParaArray( ByVal fSQL )
		
		dim fRetono
		fRetono = ""
		
		Set fConexao = Server.CreateObject("AdoDb.Connection")
		fConexao.CursorLocation = 3
		fConexao.Open DataSource
		Set fConsulta = Server.CreateObject("AdoDb.RecordSet")
		fConsulta.Open fSQL , fConexao , 3 , 1
		
		while not fConsulta.eof
			fRetono = fRetono & troca(fConsulta(0))
			fConsulta.movenext
			if not fConsulta.eof then
				fRetono = fRetono & "***"
			end if
		wend
		
		fConsulta.close
		Set fConsulta = nothing
		fConexao.Close
		Set fConexao = Nothing
		
		consultaCampoParaArray = split(fRetono, "***")
		
	end function
%>
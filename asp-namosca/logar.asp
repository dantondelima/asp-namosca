<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!-- #include file = "config/config.asp" -->
<!-- #include file = "sha256.asp" -->    
<%
	login = Request.Form("login")
	senha = sha256(Request.Form("senha"))	
		SQL = "select * from asp_admin where admin_login = '" & login & "'"
		Set consulta = consultaSql( SQL )
	If not consulta.EOF Then
			If consulta("admin_hash") = senha Then
				Session("username") = consulta("admin_login")
				response.redirect("admin.asp")
			Else
				response.redirect("login.asp?action=erroSenha")
			End if
	Else
		SQL = "select * from asp_lojista where nm_email = '" & login & "'"
		Set consulta = consultaSql( SQL )
		If not consulta.EOF Then
			If consulta("cd_senha") = senha Then
				Session("lojista_id") = consulta("cd_lojista")
				response.redirect("lojista.asp")
			Else
				response.redirect("login.asp?action=erroSenha")
			End if
		Else
			response.redirect("login.asp?action=erroLogin")
		End If
	End If
%>
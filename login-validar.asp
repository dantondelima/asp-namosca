<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!-- #include file = "config/config.asp" --> 
<!--#include file="sha256.asp"-->       
<%
    login = Request.Form("login")
    senha = sha256(Request.Form("senha"))   
    SQL = "SELECT * from asp_admin where login_admin = '" & login & " '"
    Set consulta = consultaSql(SQL)        
    If not consulta.EOF Then
        If consulta("senha_admin") = senha Then
        	Session("username") = consulta("login_admin")
            response.redirect("admin/home-admin.asp")
        Else 
           	response.redirect("login.asp?action=senhaErro") 'erro na senha'
        End if
    Else
    	SQL = "SELECT * from asp_lojista where nm_email = '" & login & " '"
    	Set consulta = consultaSql(SQL)
    	If not consulta.EOF Then
	        If consulta("cd_senha") = senha Then
	        	Session("lojista_id") = consulta("cd_lojista")
	            response.redirect("lojista/home-lojista.asp")
	        Else 
	           response.redirect("login.asp?action=senhaErro") 'erro na senha'
	        End if
	    Else
	    	response.redirect("login.asp?action=loginErro") 'erro no login'
	    End if
	End if

%>
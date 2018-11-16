<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!-- #include file = "template-lojista.asp" --> 
<!-- #include file = "../config/config.asp" -->   
<% if Session("lojista_id") = "" then 
        response.redirect("login.asp")
    end if %> 

<% 
	SQL = "SELECT nm_lojista from asp_lojista where cd_lojista = '" & Session("lojista_id") & " '"
	Set consulta = consultaSql(SQL)
%>
<h1>Bem-vindo, <% response.write(consulta("nm_lojista")) %></h1>
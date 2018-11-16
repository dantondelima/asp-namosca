<%@LANGUAGE="VBSCRIPT"%>
<!--#include file="../config/config.asp"-->
<!--#include file="../sha256.asp"-->   
<%
	Response.CodePage = 65001
	Response.CharSet = "utf-8"

	id = Request("id")
	nome = Request.Form("nome")
	sobrenome = Request.Form("sobrenome")
	tipo_ingresso = Request.Form("tipo_ingresso")
	email = Request.Form("email") 
	telefone = Request.Form("telefone")
	data = Request.Form("data")
	fase_planejamento = Request.Form("fase_planejamento")

	if not IsNull(data) then
	    partesData = Split(data, "/")
	    data = partesData(0) & "-" & partesData(1) & "-" & partesData(2)
	end if
	SQL = "update asp_participante set nome = '" & nome & "', sobrenome = '" & sobrenome & "', tipo_ingresso = '" & tipo_ingresso & "', email = '" & email & "', telefone = '" & telefone & "', telefone2 = '', data = '" & data & "', fase_planejamento = '" & fase_planejamento & "' where n_ingresso = '" & id & "';"
	Call ExecSQL( SQL )
	Response.redirect("listagem-participante.asp?action=alsucesso")
%>
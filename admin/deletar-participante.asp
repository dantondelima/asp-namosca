<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!-- #include file = "../config/config.asp" --> 

<% 
  id = Request("participante")

  If Not IsNull(id) Then 
    SQL = "delete from asp_participante where n_ingresso='" & id & "'"
        deleta = execSql( SQL )
  End if
  Response.redirect("listagem-participante.asp?action=sucesso")
%>

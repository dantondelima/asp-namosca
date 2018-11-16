<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!-- #include file = "../config/config.asp" --> 

<% 
  id = Request("lojista")

  If Not IsNull(id) Then 
    SQL = "delete from asp_lojista where cd_lojista=" & id & ""
        deleta = execSql( SQL )
  End if
  Response.redirect("listagem-lojista.asp?action=sucesso")
%>

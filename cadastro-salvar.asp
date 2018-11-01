<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!-- #include file = "config/config.asp" -->    
<%

    razaoSocial = Request.Form("razaoSocial")
    nomeResponsavel = Request.Form("nomeResponsavel")
    email = Request.Form("email")
    senha = Request.Form("senha")
    celular = Request.Form("celular")
    logotipo = Request.Form("logotipo")

    SQL = "INSERT INTO asp_lojista (nm_razao, nm_lojista, nm_email, cd_senha, cd_celular, url_logo)" &_
    " VALUES " &_
    "( '" & razaoSocial & "', '" & nomeResponsavel & "', '" & email & "', '" & senha & "', '" & celular & "', '" & logotipo & "')"
    cd_cadastro = execSql( SQL )

    Response.redirect("cadastro.asp?action=sucesso")
%>
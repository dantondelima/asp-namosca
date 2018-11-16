<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="../config/config.asp"-->
<!--#include file="../sha256.asp"-->   
<%
	id = Request("id")
	Set upl = Server.CreateObject("SoftArtisans.Fileup")
    upl.CodePage = 1252
    Server.ScriptTimeout = 99000
    upl.Path = "e:\home\abmbrasilkbrtec\Web\danton\asp-namosca\img\"
    imagem = upl.Form("imagem").UserFileName
    extensao_arquivo = lCase( retornaExtensao( imagem ) )

    if ( inStr( "jpg,png", extensao_arquivo ) ) then  
    	nomeimg = geraNomeArquivo(extensao_arquivo)  
		razaoSocial = upl.Form("razaoSocial")
	    nomeResponsavel = upl.Form("nomeResponsavel")
	    email = upl.Form("email")
	    senha = sha256(upl.Form("senha"))
	    celular = upl.Form("celular")
	    img = "img/" & nomeimg   
		SQL = "update asp_lojista set nm_lojista = '" & nomeResponsavel & "', nm_razao = '" & razaoSocial & "', nm_email = '" & email & "', cd_senha = '" & senha & "', cd_celular = '" & celular & "', url_logo = '" & img & "' where cd_lojista = '" & id & "';"
		Call ExecSQL( SQL )
		upl.Form( "imagem" ).SaveAs upl.Path & nomeimg
		Response.redirect("listagem-lojista.asp?action=alsucesso")
    end if
%>
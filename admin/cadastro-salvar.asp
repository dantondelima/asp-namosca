<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!-- #include file = "../config/config.asp" --> 
<!--#include file="../sha256.asp"-->       
<%
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
        SQL = "INSERT INTO asp_lojista (nm_razao, nm_lojista, nm_email, cd_senha, cd_celular, url_logo)" &_
        " VALUES " &_
        "( '" & razaoSocial & "', '" & nomeResponsavel & "', '" & email & "', '" & senha & "', '" & celular & "', '" & img & "')"
        cd_cadastro = execSql( SQL )
        upl.Form( "imagem" ).SaveAs upl.Path & nomeimg

    end if
    Response.redirect("cadastro.asp?action=sucesso")
%>
<%
	empresa			= "Resan Treinamentos"
	tituloSite		= empresa
	tituloAdmin		= tituloSite &" - Painel Administrativo"
	
	'Extensões
	cfg_str_extensaoesValidas_imagem 	= "jpg,jpeg,bmp,gif,png"	
	cfg_str_extensaoesValidas_arquivo 	= "pdf"		
	cfg_str_extensaoesValidas_relatorio = "jpg,jpeg,bmp,gif,png,pdf"

%>
<!--#include file="funcoes/funcoes.asp"-->
<!--#include file="configPath.asp"-->
<!--#include file="configBd.asp"-->
<!--#include file="configMsg.asp"-->
<!--#include file="configEmail.asp"-->
<!--#include file="configJs.asp"-->
<!--#include file="funcoes/funcoesSpam.asp"-->
<%
' ----------------------------- Configuracao do Editor -------------------------------------
	FCKeditorBasePath	= sBasePath & "editor/fckeditor/"
	FCKeditorBaseSkin	= sBasePath & "editor/fckeditor/editor/skins/silver/"
	
	CKeditorBasePath	= sBasePath & "editor/ckeditor/"
	CKeditorBaseSkin	= sBasePath & "editor/ckeditor/skins/kama/"	
	
	CKfinderBasePath	= url_site & "/editor/ckfinder/"
' ----------------------------- Configuracao do Editor --------------------------------------
%>
<script type="text/javascript">
<!--
	var CKeditorBasePath 	= '<%=CKeditorBasePath%>';
	var CKfinderBasePath	= '<%=CKfinderBasePath%>';	
-->
</script>

 

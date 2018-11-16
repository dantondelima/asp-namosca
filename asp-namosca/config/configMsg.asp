<%
	Redim ImagemMensagem( 4 )
	
	ImagemMensagem( 0 ) = "img-atualizado.jpg"	'Editar
	ImagemMensagem( 1 ) = "img-excluido.jpg"		'Excluir
	ImagemMensagem( 2 ) = "img-informacao.jpg"	'Info
	ImagemMensagem( 3 ) = "img-sucesso.jpg"		'Cadastro
	
	Dim NomeImagem
	NomeImagem = ""
%>
<!--#include file="funcoes/funcoesMensagem.asp"-->
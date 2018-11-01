<%
	Sub mensagem( pTipo , pMsg , pLink )
		Response.Clear()
		fLabel = "Continuar"

		Select Case pTipo
			Case "atualizar"
				NomeImagem	= ImagemMensagem( 0 )
			Case "excluir"
				NomeImagem	= ImagemMensagem( 1 )
			Case "sucesso"
				NomeImagem	= ImagemMensagem( 3 )
			Case Else
				NomeImagem	= ImagemMensagem( 2 )
				fLabel		= "Retornar"
		End Select
%>
<!--#include file="../mensagens/mensagemPadrao.asp"-->
<%
		Response.End()
	End Sub
%>
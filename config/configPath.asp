<%	
	If ( Request.ServerVariables( "SERVER_NAME" ) = "servidor" ) Then
		path_site		= "\\servidor\Projetos Atuais\_estagio\Felipe\resan\site\"
		url_dominio		= "http://servidor/projetosatuais/_estagio/Felipe/resan/site/"
	Else
		path_site		= "e:\home\resan\web\site\"
		url_dominio		= "http://www.resan.com.br/site/"
	End if

	
	
	url_site		= url_dominio
	url_site_amigavel = "http://www.resan.com.br/"
	path_arquivos	= path_site & "arquivos\"
	url_config		= url_dominio & "config/"
	url_admin		= url_dominio & "admin/"
	url_admin_cl	= url_dominio & "/admin"
	url_js			= url_dominio & "js/"
	url_arquivos	= url_dominio & "arquivos/"

	'Dimensões	
	
	'Notícias
	'cfg_noticia_a_thumb = 175
	'cfg_noticia_l_thumb	= 256
	cfg_noticia_a_thumb = 194
	cfg_noticia_l_thumb = 344

	'Autores
	cfg_autor_a_thumb = 150
	cfg_autor_l_thumb = 150

	'Artigos
	cfg_artigo_a_thumb = 175
	cfg_artigo_l_thumb = 256

	'Matérias
	cfg_materia_a_thumb = 175
	cfg_materia_l_thumb = 256
	
	cfg_materia_a_medio = 328
	cfg_materia_l_medio = 225

	'Placas
	cfg_placa_a = 454
	cfg_placa_l = 354

	cfg_placa_a_thumb = 114
	cfg_placa_l_thumb = 112

	'Fotos
	cfg_evento_a_thumb = 80
	cfg_evento_l_thumb = 120
	
	cfg_evento_a_thumbMedio = 157
	cfg_evento_l_thumbMedio = 260
	
	cfg_evento_a_thumbIframe = 194
	cfg_evento_l_thumbIframe = 316

	'Capas
	cfg_capa_a_thumb = 345
	cfg_capa_l_thumb = 261

	cfg_capa_a_thumbMedio = 207
	cfg_capa_l_thumbMedio = 156

	cfg_capa_a_thumbPequeno = 104
	cfg_capa_l_thumbPequeno = 74

	cfg_capa_manual_a_thumb = 150
	cfg_capa_manual_l_thumb = 150

	'Estimativa Distribuição
	cfg_capa_estimativa_distribuicao_a_thumb = 345
	cfg_capa_estimativa_distribuicao_l_thumb = 261

	cfg_capa_estimativa_distribuicao_a_thumbMedio = 207
	cfg_capa_estimativa_distribuicao_l_thumbMedio = 156

	cfg_capa_estimativa_distribuicao_a_thumbPequeno = 104
	cfg_capa_estimativa_distribuicao_l_thumbPequeno = 74


	'Memórias
	cfg_memoria_a_thumb = 113
	cfg_memoria_l_thumb = 111

	'Convênios
	cfg_convenio_a_thumb = 113
	cfg_convenio_l_thumb = 111

	'Associados
	cfg_associado_a_thumb = 209
	cfg_associado_l_thumb = 323

	'Destaques Home
		'Primário
		cfg_destaque_primario_a = 351
		cfg_destaque_primario_l = 722

		'Secundário
		cfg_destaque_secundario_a = 194
		cfg_destaque_secundario_l = 344

		'Primário
		cfg_destaque_postos_servicos_a = 351
		cfg_destaque_postos_servicos_l = 722

	'Clippings
	cfg_clipping_a_thumb = 194
	cfg_clipping_l_thumb = 344	
	
	'Envio de Clipping
	cfg_envio_clipping_a_thumb = 234
	cfg_envio_clipping_l_thumb = 378	

	'Pastas - Uploads
	
	'Notícias	
	cfg_up_noticia		 = path_arquivos & "noticia\"
	cfg_vw_noticia		 = url_arquivos & "noticia/"
	cfg_up_noticia_crop	 = path_arquivos & "noticia\crop\"
	cfg_vw_noticia_crop	 = url_arquivos & "noticia/crop/"
	cfg_up_noticia_thumb = path_arquivos & "noticia\thumb\"
	cfg_vw_noticia_thumb = url_arquivos & "noticia/thumb/"

	'Videos	
	cfg_up_videos		 = path_arquivos & "videos\"
	cfg_vw_videos		 = url_arquivos & "videos/"
	cfg_up_videos_crop	 = path_arquivos & "videos\crop\"
	cfg_vw_videos_crop	 = url_arquivos & "videos/crop/"
	cfg_up_videos_thumb = path_arquivos & "videos\thumb\"
	cfg_vw_videos_thumb = url_arquivos & "videos/thumb/"

	'Envio de Clipping	
	cfg_up_envio_clipping		= path_arquivos & "envio_clipping\"
	cfg_vw_envio_clipping		= url_arquivos & "envio_clipping/"
	cfg_up_envio_clipping_thumb = path_arquivos & "envio_clipping\thumb\"
	cfg_vw_envio_clipping_thumb = url_arquivos & "envio_clipping/thumb/"

	'Clipping	
	cfg_up_clipping		 = path_arquivos & "clipping\"
	cfg_vw_clipping		 = url_arquivos & "clipping/"
	cfg_up_clipping_crop	 = path_arquivos & "clipping\crop\"
	cfg_vw_clipping_crop	 = url_arquivos & "clipping/crop/"
	cfg_up_clipping_thumb = path_arquivos & "clipping\thumb\"
	cfg_vw_clipping_thumb = url_arquivos & "clipping/thumb/"

	'Autores	
	cfg_up_autor	   = path_arquivos & "autor\"
	cfg_vw_autor 	   = url_arquivos & "autor/"
	cfg_up_autor_crop  = path_arquivos & "autor\crop\"
	cfg_vw_autor_crop  = url_arquivos & "autor/crop/"
	cfg_up_autor_thumb = path_arquivos & "autor\thumb\"
	cfg_vw_autor_thumb = url_arquivos & "autor/thumb/"

	'Artigos
	cfg_up_artigo		= path_arquivos & "artigo\"
	cfg_vw_artigo		= url_arquivos & "artigo/"
	cfg_up_artigo_crop	= path_arquivos & "artigo\crop\"
	cfg_vw_artigo_crop	= url_arquivos & "artigo/crop/"
	cfg_up_artigo_thumb	= path_arquivos & "artigo\thumb\"
	cfg_vw_artigo_thumb	= url_arquivos & "artigo/thumb/"

	'Matérias
	cfg_up_materia			= path_arquivos & "materia\"
	cfg_vw_materia			= url_arquivos & "materia/"
	cfg_up_materia_crop		= path_arquivos & "materia\crop\"
	cfg_vw_materia_crop		= url_arquivos & "materia/crop/"
	cfg_up_materia_thumb	= path_arquivos & "materia\thumb\"
	cfg_vw_materia_thumb	= url_arquivos & "materia/thumb/"
	cfg_up_materia_medio	= path_arquivos & "materia\medio\"
	cfg_vw_materia_medio	= url_arquivos & "materia/medio/"

	'Placas
	cfg_up_placa		= path_arquivos & "placa\"
	cfg_vw_placa		= url_arquivos & "placa/"
	cfg_up_placa_crop	= path_arquivos & "placa\crop\"
	cfg_vw_placa_crop	= url_arquivos & "placa/crop/"
	cfg_up_placa_thumb	= path_arquivos & "placa\thumb\"
	cfg_vw_placa_thumb	= url_arquivos & "placa/thumb/"

	'Eventos
	cfg_up_evento = path_arquivos & "evento\"
	cfg_vw_evento = url_arquivos & "evento/"

	cfg_up_evento_thumb = path_arquivos & "evento\thumb\"
	cfg_vw_evento_thumb = url_arquivos & "evento/thumb/"

	cfg_up_evento_thumbMedio = path_arquivos & "evento\thumbMedio\"
	cfg_vw_evento_thumbMedio = url_arquivos & "evento/thumbMedio/"

	cfg_up_evento_thumbIframe = path_arquivos & "evento\thumbIframe\"
	cfg_vw_evento_thumbIframe = url_arquivos & "evento/thumbIframe/"

	'Revistas - Capas
	cfg_up_capa_revista = path_arquivos & "revista\capa\"
	cfg_vw_capa_revista = url_arquivos & "revista/capa/"
	
	cfg_up_capa_thumb	= path_arquivos & "revista\capa\thumb\"
	cfg_vw_capa_thumb	= url_arquivos & "revista/capa/thumb/"
	
	cfg_up_capa_thumbMedio	= path_arquivos & "revista\capa\thumbMedio\"
	cfg_vw_capa_thumbMedio	= url_arquivos & "revista/capa/thumbMedio/"
	
	cfg_up_capa_thumbPequeno	= path_arquivos & "revista\capa\thumbPequeno\"
	cfg_vw_capa_thumbPequeno	= url_arquivos & "revista/capa/thumbPequeno/"

	'Revistas - PDFs
	cfg_up_revista = path_arquivos & "revista\"
	cfg_vw_revista = url_arquivos & "revista/"


	'Estimativas Distribuiçao - PDFs
	cfg_up_estimativa_distribuicao = path_arquivos & "custo-combustiveis\"
	cfg_vw_estimativa_distribuicao = url_arquivos & "custo-combustiveis/"

	'Estimativas Distribuiçao - Capas
	cfg_up_capa_estimativa_distribuicao = path_arquivos & "custo-combustiveis\capa\"
	cfg_vw_capa_estimativa_distribuicao = url_arquivos & "custo-combustiveis/capa/"
	
	cfg_up_capa_estimativa_distribuicao_thumb	= path_arquivos & "custo-combustiveis\capa\thumb\"
	cfg_vw_capa_estimativa_distribuicao_thumb	= url_arquivos & "custo-combustiveis/capa/thumb/"
	
	cfg_up_capa_estimativa_distribuicao_thumbMedio	= path_arquivos & "custo-combustiveis\capa\thumbMedio\"
	cfg_vw_capa_estimativa_distribuicao_thumbMedio	= url_arquivos & "custo-combustiveis/capa/thumbMedio/"
	
	cfg_up_capa_estimativa_distribuicao_thumbPequeno	= path_arquivos & "custo-combustiveis\capa\thumbPequeno\"
	cfg_vw_capa_estimativa_distribuicao_thumbPequeno	= url_arquivos & "custo-combustiveis/capa/thumbPequeno/"

	'Convencoes - PDFs
	cfg_up_convencoes = path_arquivos & "convencoes\"
	cfg_vw_convencoes = url_arquivos & "convencoes/"	

	'Manuais - Capas
	cfg_up_capa_manual 		 = path_arquivos & "manual\capa\"
	cfg_vw_capa_manual 		 = url_arquivos & "manual/capa/"
	cfg_up_capa_manual_thumb = path_arquivos & "manual\capa\thumb\"
	cfg_vw_capa_manual_thumb = url_arquivos & "manual/capa/thumb/"

	'Manuais - PDFs
	cfg_up_manual = path_arquivos & "manual\"
	cfg_vw_manual = url_arquivos & "manual/"

	'Memórias
	cfg_up_memoria 	  	 = path_arquivos & "memoria\"
	cfg_vw_memoria 	  	 = url_arquivos & "memoria/"
	cfg_up_memoria_thumb = path_arquivos & "memoria\thumb\"
	cfg_vw_memoria_thumb = url_arquivos & "memoria/thumb/"
	cfg_up_memoria_crop  = path_arquivos & "memoria\crop\"
	cfg_vw_memoria_crop  = url_arquivos & "memoria/crop/"

	'Convênios
	cfg_up_convenio 	  = path_arquivos & "convenio\"
	cfg_vw_convenio 	  = url_arquivos & "convenio/"
	cfg_up_convenio_thumb = path_arquivos & "convenio\thumb\"
	cfg_vw_convenio_thumb = url_arquivos & "convenio/thumb/"
	cfg_up_convenio_crop  = path_arquivos & "convenio\crop\"
	cfg_vw_convenio_crop  = url_arquivos & "convenio/crop/"

	'Associados
	cfg_up_associado 	  = path_arquivos & "associado\"
	cfg_vw_associado 	  = url_arquivos & "associado/"
	cfg_up_associado_thumb = path_arquivos & "associado\thumb\"
	cfg_vw_associado_thumb = url_arquivos & "associado/thumb/"
	cfg_up_associado_crop  = path_arquivos & "associado\crop\"
	cfg_vw_associado_crop  = url_arquivos & "associado/crop/"	


	'Home
	cfg_up_destaque_primario 	  	= path_arquivos & "home\destaque_primario\"
	cfg_vw_destaque_primario 	 	= url_arquivos & "home/destaque_primario/"
	cfg_up_destaque_primario_crop  	= path_arquivos & "home\destaque_primario\crop\"
	cfg_vw_destaque_primario_crop 	= url_arquivos & "home/destaque_primario/crop/"	

	cfg_up_destaque_secundario 		= path_arquivos & "home\destaque_secundario\"
	cfg_vw_destaque_secundario 		= url_arquivos & "home/destaque_secundario/"
	cfg_up_destaque_secundario_crop	= path_arquivos & "home\destaque_secundario\"
	cfg_vw_destaque_secundario_crop	= url_arquivos & "home/destaque_secundario/"	

	cfg_up_destaque_postos_servicos = path_arquivos & "home\destaque_postos_servicos\"
	cfg_vw_destaque_postos_servicos = url_arquivos & "home/destaque_postos_servicos/"
	cfg_up_destaque_postos_servicos_crop = path_arquivos & "home\destaque_postos_servicos\crop\"
	cfg_vw_destaque_postos_servicos_crop = url_arquivos & "home/destaque_postos_servicos/crop/"	

%>
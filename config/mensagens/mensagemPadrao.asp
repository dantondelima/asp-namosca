<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<base href="<%=url_dominio%>config/mensagens/">
<title><%=tituloSite%></title>
<link href="css/mensagem.css" rel="stylesheet" type="text/css">
</head>
<% If pLink = "" then pLink = """ onClick=""javascript: history.back();return false;""" %>
<body id="body_mensagem">
<div id="imgpos" style="width:460px; height: 300px; border:dashed; border-width:1px; border-color:#E2E2E2;">
  <p align="center"><img src="images/<%=NomeImagem%>" width="126" height="120" /></p>
  <div style="width:440px; padding-left:10px;">
    <p align="center" class="texto"><%=pMsg%></p>
  </div>
  <p style="padding-top:25px;" align="center"><a href="<%=url_dominio & pLink%>" class="navegacao"><%=fLabel%></a></p>
</div>
</body>
</html>
<!-- #include file = "template-lojista.asp" -->  

<% if Session("lojista_id") = "" then 
        response.redirect("../login.asp")
    end if
    %>
  <link rel="stylesheet" type="text/css" href="css/cadastro.css">
  <title>Tela de cadastro</title>
</head>
<body> 
<div class="container text-center">
   <div class="panel">
   	<h1 style="font-size: 50px;padding:10px;">Instruções</h1>
   	<div style="margin:auto; margin-bottom:15px;width:95px;border-bottom: 3px solid rgba(4, 209, 164, .9);"></div>
   </div>
   <p style="color: black; font-weight: 500;">Carregue o arquivo que foi gerado do APP (em CSV) e em seguida será apresentada a listagem dos respectivos contatos</p>
    <form id="listagem-formulario" method="post" action="listagem-csv.asp" ENCTYPE="multipart/form-data">
        <div class="form-group">
            <input type="file" class="form-control" id="arquivo" name="arquivo">
        </div>
        <button type="submit" class="btn btn-primary">Enviar</button>
    </form>
    <p style="padding:10px;color: black; font-weight: 500;">Ou se preferir, <a href="cadastro-codigo.asp" style="color: rgba(4, 209, 164, .9)">copie e cole os códigos</a></p> 
</div>
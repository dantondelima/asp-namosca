<!-- #include file = "template-lojista.asp" -->  
  <link rel="stylesheet" type="text/css" href="css/cadastro.css">
  <title>Tela de cadastro</title>
</head>
<body>
  <% if Session("lojista_id") = "" then 
        response.redirect("login.asp")
    end if %> 
<div class="container text-center">
   <div class="panel">
   	<h1 style="font-size: 50px;padding:10px;">Instruções</h1>
   	<div style="margin:auto; margin-bottom:15px;width:95px;border-bottom: 3px solid rgba(4, 209, 164, .9);"></div>
   </div>
   <p style="color: black;font-weight: 500;" >Cole os códigos, um por linha. Após isso, clique em enviar</p>
    <form id="cadastro-formulario" method="post" action="listagem-codigo.asp" ENCTYPE="multipart/form-data">
        <div class="form-group"> 
            <textarea style="width: 225px; height: 200px" name="lista"></textarea>
        </div>

        <button type="submit" class="btn btn-primary">Enviar</button>
    </form>
    <p style="padding:10px;color: black; font-weight: 500;">Ou se preferir, <a href="cadastro-csv.asp" style="color: rgba(4, 209, 164, .9)">carregue um arquivo CSV</a></p> 
</div>
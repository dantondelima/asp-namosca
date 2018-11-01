<html>
<head>
  <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
  <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
  <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <link rel="stylesheet" type="text/css" href="css/login.css">
  <meta charset="UTF-8">
  <title>Tela de cadastro</title>
</head>
<body id="LoginForm">
<div class="container">
<div class="login-form">
<div class="main-div">
    <div class="panel">
   <h2>Cadastro</h2>
   </div>
    <form id="cadastro-formulario" method="post" action="cadastro-salvar.asp">

        <div class="form-group">
            <input type="text" class="form-control" id="razaoSocial" name="razaoSocial" placeholder="Razão Social">
        </div>

        <div class="form-group">
            <input type="text" class="form-control" id="nomeResponsavel" name="nomeResponsavel" placeholder="Nome Responsável">
        </div>

        <div class="form-group">
            <input type="text" class="form-control" id="email" name="email" placeholder="Email">
        </div>     

        <div class="form-group">
            <input type="password" class="form-control" id="senha" name="senha" placeholder="Senha">
        </div> 

        <div class="form-group">
            <input type="text" class="form-control" id="celular" name="celular" placeholder="Celular">
        </div>

        <div class="form-group">
            <input type="file" class="form-control-file" id="logotipo" name="logotipo" placeholder="Celular">
        </div>


        <button type="submit" class="btn btn-primary">Cadastrar</button>
    </form>
    </div>
</div></div></div>


</body>
</html>

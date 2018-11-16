<!-- #include file = "template-admin.asp" -->   
  <link rel="stylesheet" type="text/css" href="css/cadastro.css">
  <title>Tela de cadastro</title>
</head>
<body id="LoginForm">
  <% if not Session("username") = "admin" then 
        response.redirect("../login.asp")
    end if  

    action = request(action)
    If action = "sucesso" then %>
    <script type="text/javascript">
        $("body").before("<div class='alert alert-success alert-dismissible'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><strong>Lojista deletado com sucesso</strong></div>");
    </script> <%
    end if
    %>
<div class="container">
<div class="login-form">
<div class="main-div">
    <div class="panel">
   <h1>Cadastro</h1>
   </div>
    <form id="cadastro-formulario" method="post" action="cadastro-salvar.asp" ENCTYPE="multipart/form-data">

        <div class="form-group">
            <input type="text" class="form-control" id="razaoSocial" name="razaoSocial" placeholder="Razão Social" required>
        </div>

        <div class="form-group">
            <input type="text" class="form-control" id="nomeResponsavel" name="nomeResponsavel" placeholder="Nome Responsável" required>
        </div>

        <div class="form-group">
            <input type="text" class="form-control" id="email" name="email" placeholder="Email" required>
        </div>     

        <div class="form-group">
            <input type="password" class="form-control" id="senha" name="senha" placeholder="Senha" required>
        </div> 

        <div class="form-group">
            <input type="text" class="form-control" id="celular" name="celular" placeholder="Celular" required>
        </div>

        <div class="form-group">
            <input type="file" class="form-control" id="imagem" name="imagem" required>
        </div>


        <button type="submit" class="btn btn-primary">Cadastrar</button>
    </form>
    </div>
</div></div></div>
<script src="http://code.jquery.com/jquery-1.11.1.js"></script>
<script src="http://jqueryvalidation.org/files/dist/jquery.validate.js"></script>

<script>
        $(document).ready(function(){
        $('#cadastro-formulario').validate({
           rules: {
                razaoSocial: {
                   required: true,
                   minlength: 5,
                   maxlength: 100
               },
               nomeResponsavel: {
                   required: true,
                   minlength: 5,
                   maxlength: 100
               },
               email: {
                   email: true,
                   required: true,
                   minlength: 10,
                   maxlength: 100
               },
               senha: {
                   required: true
               },
               celular: {
                   required: true
               },
               imagem: {
                   required: true
               }
           },
           errorClass: "text-danger",
           messages: {
            razaoSocial: {
                   required: "Razão social obrigatorio",
                   minlength: "Tamanhho minimo de 5 caracteres",
                   maxlength: "Tamanhho maximo de 100 caracteres"
               },
               nomeResponsavel: {
                   required: "Nome obrigatorio",
                   minlength: "Tamanhho minimo de 5 caracteres",
                   maxlength: "Tamanhho maximo de 100 caracteres"
               },
               email: {
                   email: 'E-mail invalido',
                   required: 'E-mail obrigatorio',
                   minlength: 'Tamanhho minimo de 5 caracteres',
                   maxlength: 'Tamanhho maximo de 100 caracteres'
               },
               senha: {
                   required: 'Senha obrigatória'
               },
               celular: {
                   required: 'celular obrigatório'
               },
               imagem: {
                   required: 'Logotipo obrigatório'
               }
           }      
        });
        });
    </script>
      <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.0/jquery.mask.js"></script>
<script>
    $(document).ready(function () { 
        var $celular = $("#celular");
        $celular.mask('(00) 00000-0000', {reverse: false});
    });
</script>
</body>
</html>


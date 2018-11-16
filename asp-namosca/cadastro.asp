<!-- #include file = "template-admin.asp" -->   
  <link rel="stylesheet" type="text/css" href="css/cadastro.css">
  <title>Tela de cadastro</title>
</head>
<body id="LoginForm">
  <% if not Session("username") = "admin" then 
        response.redirect("login.asp")
    end if %>
<div class="container">
<div class="login-form">
<div class="main-div">
    <div class="panel">
   <h1>Cadastro</h1>
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
            <input type="file" class="form-control" id="logotipo" name="logotipo" placeholder="Celular">
        </div>


        <button type="submit" class="btn btn-primary">Cadastrar</button>
    </form>
    </div>
</div></div></div>
<script type="text/javascript">
    $(function(){

        $("#celular").mask("(99) 9999-9999?9");

        $('#contato-formulario').submit(function(){

            if(!elementConfig.setValidate(this)){
                e.preventDefault();
                return false;
            }

        });

    });
</script>

</body>
</html>


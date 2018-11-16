<!-- #include file = "template-admin.asp" -->   
<!--#include file="../config/config.asp"-->
<meta charset="utf-8">
  <% if not Session("username") = "admin" then 
        response.redirect("../login.asp")
    end if %>
<% 
    id = Request("lojista")

    If Not IsNull(id) Then 
        conSQl = "select * from asp_lojista where cd_lojista = '" & id & "';"
        Set consulta = consultaSQL(conSQl)

    end if
%>

<link rel="stylesheet" type="text/css" href="css/cadastro.css">
  <title>Tela de cadastro</title>
</head>
<body id="LoginForm">
<div class="container">
<div class="login-form">
<div class="main-div">
    <div class="panel">
   <h1>Alteração</h1>
   </div>
    <form id="cadastro-formulario" method="post" action="alteracao-salvar.asp?id=<%response.write(id)%>" ENCTYPE="multipart/form-data">

        <div class="form-group">
            <input type="text" class="form-control" id="razaoSocial" name="razaoSocial" placeholder="Razão Social" value='<% response.write(consulta("nm_razao")) %>' >
        </div>

        <div class="form-group">
            <input type="text" class="form-control" id="nomeResponsavel" name="nomeResponsavel" placeholder="Nome Responsável" value='<% response.write(consulta("nm_lojista")) %>' >
        </div>

        <div class="form-group">
            <input type="text" class="form-control" id="email" name="email" placeholder="Email" value='<% response.write(consulta("nm_email")) %>' >
        </div>     

        <div class="form-group">
            <input type="password" class="form-control" id="senha" name="senha" placeholder="Senha">
        </div> 

        <div class="form-group">
            <input type="text" class="form-control" id="celular" name="celular" placeholder="Celular" value='<% response.write(consulta("cd_celular")) %>' >
        </div>

        <div class="form-group">
            <input type="file" class="form-control" id="imagem" name="imagem">
        </div>


        <button type="submit" class="btn btn-primary">Alterar</button>
    </form>
    </div>
</div></div></div>
<script src="http://code.jquery.com/jquery-1.11.1.js"></script>
<script src="http://jqueryvalidation.org/files/dist/jquery.validate.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.0/jquery.mask.js"></script>
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
        var $celular = $("#celular");
        $celular.mask('(00) 00000-0000', {reverse: false});
    </script>



</body>
</html>

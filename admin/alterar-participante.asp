<!-- #include file = "template-admin.asp" -->   
<!--#include file="../config/config.asp"-->
<% 
    Response.CodePage = 65001
    Response.CharSet = "utf-8"

    if not Session("username") = "admin" then 
        response.redirect("../login.asp")
    end if %>
<% 
    id = Request("participante")

    If Not IsNull(id) Then 
        conSQl = "select * from asp_participante where n_ingresso = '" & id & "';"
        Set consulta = consultaSQL(conSQl)

    end if
%>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.9.0/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.8.2.js"></script>
<script src="http://jqueryvalidation.org/files/dist/jquery.validate.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.0/jquery.mask.js"></script>
<script src="http://code.jquery.com/ui/1.9.0/jquery-ui.js"></script>
  <title>Tela de alteração</title>
</head>
<script type="text/javascript">
    $(document).ready(function(){

            $( "#datepicker" ).datepicker({
                dateFormat: "yy-mm-dd",
                changeMonth: true,
                changeYear: true,
                dayNames: ['Domingo','Segunda','Terça','Quarta','Quinta','Sexta','Sábado','Domingo'],
                dayNamesMin: ['D','S','T','Q','Q','S','S','D'],
                dayNamesShort: ['Dom','Seg','Ter','Qua','Qui','Sex','Sáb','Dom'],
                monthNames: ['Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
                monthNamesShort: ['Jan','Fev','Mar','Abr','Mai','Jun','Jul','Ago','Set','Out','Nov','Dez']
            });
        });
</script>
<body id="LoginForm">
<div class="container">
<div class="login-form">
<div class="main-div">
    <div class="panel">
    <h1>Alteração</h1>
    </div>
    <form id="cadastro-formulario" method="post" action="alteracao-salvar-part.asp?id=<%response.write(id)%>" >

        <div class="form-group">
            <input type="text" class="form-control" id="nome" name="nome" placeholder="Nome" value='<% response.write(consulta("nome")) %>' required>
        </div>

        <div class="form-group">
            <input type="text" class="form-control" id="sobrenome" name="sobrenome" placeholder="Sobrenome" value='<% response.write(consulta("sobrenome")) %>' required>
        </div>

        <div class="form-group">
            <input type="text" class="form-control" id="tipo de ingresso" name="tipo_ingresso" placeholder="tipo de ingresso" value='<% response.write(consulta("tipo_ingresso")) %>' required>
        </div>     

        <div class="form-group">
            <input type="text" class="form-control" id="email" name="email" placeholder="Email" value='<% response.write(consulta("email")) %>' required>
        </div> 

        <div class="form-group">
            <input type="text" class="form-control" id="telefone" name="telefone" placeholder="telefone" value='<% response.write(consulta("telefone")) %>' >
        </div>

        <div class="form-group">
            <input type="text" class="form-control" id="datepicker" name="data" value='<% response.write(consulta("data")) %>' placeholder="data">
        </div>

        <div class="form-group">
            <textarea class="form-control" name="fase_planejamento"><% response.write(consulta("fase_planejamento")) %></textarea>
        </div>
        

        <button type="submit" class="btn btn-primary">Alterar</button>
    </form>
    </div>
</div></div></div>

<script>
        $(document).ready(function(){
        $('#cadastro-formulario').validate({
           rules: {
                nome: {
                   required: true,
                   minlength: 5,
                   maxlength: 100
               },
               sobrenome: {
                   required: true,
                   minlength: 5,
                   maxlength: 100
               },
               tipo_ingresso: {
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
           },
           errorClass: "text-danger",
           messages: {
            nome: {
                   required: "Nome obrigatorio",
                   minlength: "Tamanhho minimo de 5 caracteres",
                   maxlength: "Tamanhho maximo de 100 caracteres"
               },
               sobrenome: {
                   required: "Sobrenome obrigatorio",
                   minlength: "Tamanhho minimo de 5 caracteres",
                   maxlength: "Tamanhho maximo de 100 caracteres"
               },
               email: {
                   email: 'E-mail invalido',
                   required: 'E-mail obrigatorio',
                   minlength: 'Tamanhho minimo de 5 caracteres',
                   maxlength: 'Tamanhho maximo de 100 caracteres'
               },
               tipo_ingresso: {
                   required: 'tipo de ingresso obrigatório'
               }
           }      
        });
        });
        var $celular = $("#telefone");
        $celular.mask('(00) 0000-0000', {reverse: false});

    </script>


</body>
</html>

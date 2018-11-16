<!-- #include file = "includes/header.asp" -->  
  <link rel="stylesheet" type="text/css" href="css/login.css">
  <title>Tela de login</title>
</head>
<body id="LoginForm">
<% 
  action = Request("action")
    If action = "loginErro" then %>
    <script type="text/javascript">
      alert('Login inválido');
    </script>
    <%ElseIf action = "senhaErro" then %>
    <script type="text/javascript">
      alert('senha incorreta');
    </script>
    <%End if%>   
<div class="container">
<div class="login-form">
<div class="main-div">
    <div class="panel">
   </div>
   <h1>Login</h1>
    <form id="login" method="post" action="login-validar.asp">
        <div class="form-group">
            <input type="login" class="form-control" id="inputLogin" placeholder="Login" name="login">
        </div>

        <div class="form-group">
            <input type="password" class="form-control" id="inputSenha" placeholder="Senha" name="senha">
        </div>     

        <button type="submit" class="btn btn-primary">Login</button>
    </form>
    </div>
</div></div></div>


</body>
</html>

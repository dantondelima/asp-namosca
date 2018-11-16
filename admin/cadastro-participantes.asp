<!-- #include file = "template-admin.asp" --> 
<body>
  <% if not Session("username") = "admin" then 
        response.redirect("../login.asp")
    end if %>
<div class="main-div">
    <form id="cadastro-participantes" method="post" action="carrega-participante.asp" enctype="multipart/form-data"> 
        <div class="form-group">
            <input type="file" class="form-control" id="arquivo" name="arquivo">
        </div>

        <button type="submit" class="btn btn-primary">Carregar</button>
    </form>
    </div>
</div></div></div>
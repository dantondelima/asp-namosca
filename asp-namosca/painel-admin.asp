<!-- #include file = "template-admin.asp" -->    

<% if not Session("username") = "admin" then 
        response.redirect("login.asp")
    end if %> 

<h1>Bem-vindo, Admin</h1>
<%-- 
    Document   : login
    Created on : 25/04/2014, 08:45:36
    Author     : Renan Huf Silveira
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <title>Login</title>
    </head>
    <body> 
        <%@include file = "Include/baseSite.jsp" %>
        <div class="container">
            <div class="col-md-3 col-md-push-2">
                <h1>Login</h1>
                <form action="Login" method="Post">
                    Usuário<input type="text" class="form-control" name="usuario" placeholder="Digite seu usuário"><br/>
                    Senha<input type="password" class="form-control" name="senha" placeholder="****"><br/>
                    <button type="submit" class="btn btn-success" > <span class="glyphicon glyphicon-ok"></span> Entrar</button>
                </form>
                <br/>
            </div>
            <div class="col-md-3 col-md-push-3"> 
                <h1>Cadastre-se</h1>
                <form action="SendMail" method="Post">
                    E-mail<input type="email" class="form-control" name="email" placeholder="*****@***.com"><br/>
                    <button type="submit" class="btn btn-success" >Continuar Cadastro <span class="glyphicon glyphicon-arrow-right"></span></button></a>
                </form>
            </div>
        </div>
        <%@include file = "Include/Partes/rodape.jsp" %>>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
    </body>
</html>

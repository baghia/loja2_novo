<%-- 
    Document   : cadastroCliente
    Created on : 24/06/2014, 15:13:32
    Author     : Renan Huf Silveira
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String email = request.getParameter("email");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <title>Cadastro</title>
    </head>
    <body> 
        <%@include file = "Include/baseSite.jsp" %>
        <div class="container">
            <div class="col-md-5 col-md-push-2">
                <h2>Enviamos para seu e-mail o link para seguir com seu cadastro.Por favor verifique seu e-mail :)</h2>
            </div>
            <br><br><br><br><br><br><br><br><br><br><br><br><br><br>
            
        </div>
        <%@include file = "Include/Partes/rodape.jsp" %>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
    </body>
</html>


















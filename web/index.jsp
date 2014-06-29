<%--
    Document   : index
    Created on : 25/03/2014, 15:54:49
    Author     : Renan Huf Silveira
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <style>
            .login{
                color: white;                              
            }
        </style>
        <%
            //Verificar se uma seção foi iniciaa
        %>
    </head>
    <body>
        
        <%@include file = "Include/baseSite.jsp" %>
        
        <div class="container">
            <div id="myCarousel" class="carousel slide">
                <!-- Itens de carousel -->
                <div class="carousel-inner">
                    <div class="active item">Ooooooooooooooooooooooooooooooooooi</div>
                    <div class="item">Olaaaaaaaaaaaaaaaa</div>
                    <div class="item">Mundoooooooooooooooooooooo</div>
                </div>
                <!-- Navegador do carousel -->
                <a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
                <a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
            </div>
        </div>
        <%@include file = "Include/Partes/rodape.jsp" %>>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
    </body>
</html>

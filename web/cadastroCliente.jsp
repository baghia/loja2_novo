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
            <form action="InserirCliente" method="POST">
                <div class="col-md-3 col-md-push-2">
                    <h1>Cadastro</h1>
                    <div id="Aviso">
                        <h3>Dados Pessoais</h3>
                        Usuário:<input type="text" class="form-control" name="usuario" placeholder="Digite seu usuário"><br/>
                        Senha:<input type="password" class="form-control" name="senha" placeholder="****"><br/>
                        Nome:<input type="text" class="form-control" name="nome" placeholder="Digite seu nome"><br/>
                        CPF:<input type="text" class="form-control" name="cpf" placeholder="Digite seu CPF sem pontos ou traços"><br/>
                        <h3>Endereço</h3>
                        Rua:<input type="text" class="form-control" name="rua"><br/>
                        Bairro:<input type="text" class="form-control" name="bairro"><br/>
                        Cidade:<input type="text" class="form-control" name="cidade"><br/>
                        CEP:<input type="text" class="form-control" name="cep"><br/>
                        UF:<input type="text" class="form-control" name="uf" placeholder="**"><br/>
                        <h3>Contato</h3>
                        Telefone Fixo:<input type="text" class="form-control" name="telfixo"><br/>
                        Telefone Celular:<input type="text" class="form-control" name="telcelular"><br/>
                        E-mail<input type="email" class="form-control" name="email" placeholder="*****@***.com" value="<%= email%>"><br/>
                        <button type="submit" class="btn btn-success" > <span class="glyphicon glyphicon-ok"></span> Concluir Cadastro</button>
                    </div>
                </div>
            </form>
        </div>
        <%@include file = "Include/Partes/rodape.jsp" %>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
    </body>
</html>

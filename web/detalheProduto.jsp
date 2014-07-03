<%-- 
    Document   : detalheProduto
    Created on : 31/03/2014, 10:32:49
    Author     : Renan Huf Silveira
--%>

<%@page import="control.FuncoesUteis"%>
<%@page import="model.Produto"%>
<%@page import="dao.ProdutoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    ProdutoDAO produtoDao = new ProdutoDAO();
    Produto p = produtoDao.consultar(id);
    FuncoesUteis fu = new FuncoesUteis();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
        <title></title>
        <style>
            .produtos{ 
                height: 300px;
                outline: 2px dotted #000;
                margin-left: 0px;
                margin-top: 0px;
                padding-left: 0px;
            }
            .container{  outline: 2px dotted #c30; }
            #oferta{ outline: 2px dotted #c90;  padding-left: 0px;}
            #divProduto{ outline: 2px dotted #c90;  margin-left: 0px; margin-top: 20px}
        </style>
    </head>
    <body>
        <%@include file="Include/baseSite.jsp" %>
        <div id="subcategoria" class="container">
            <h2><%= p.getNome()%></h2>
        </div>

        <div class="container">

            <div class="col-md-4 produtos">
                Aqui terá as fotos do produto
            </div>    

            <div class="col-md-4 col-md-push-1  produtos">

                <div id="divProduto">
                    <h3><%= "Por: " + fu.converterMoeda(p.getPreco())%></h4>
                        <h5><%= "12x de " + fu.converterMoeda(Math.ceil(p.getPreco() / 12))%> sem juros</h6>
                            <%for (int i = 11; i > 1; i--) {%>
                            <h6><%= i + "x de " + fu.converterMoeda(Math.ceil(p.getPreco() / i))%> sem juros</h6>
                            <%}%>
                            </div>
                            </div>

                            <div class="col-md-3 col-md-push-1 produtos">
                                <form action="AdicionarCarrinho" method="post">
                                    <input type="hidden" name="url" value="<%=request.getRequestURL()%>?id=<%=id%>">  
                                    <input type="hidden" name="id_produto" value="<%= p.getId()%>">
                                    <% Cliente c = (Cliente)session.getAttribute("usuario");%>
                                    <input type="hidden" name="id_usuario" value="<%= c.getId() %>">
                                    <button class="btn btn-danger btn" type="submit" name="addCarrinho">Adicionar à Carrinho de Compras </button>
                                </form>
                            </div>

                            <div  class="row">                              
                                <div  class="col-md-2 "><!--As duas opcões da coluna filtro são dentro dessa div-->
                                </div>
                            </div>
                            <br/>    
                            <div id="especificacoes">
                                <ul class="list-group">
                                    <li class="list-group-item">Cras justo odio</li>
                                    <li class="list-group-item">Dapibus ac facilisis in</li>
                                    <li class="list-group-item">Morbi leo risus</li>
                                    <li class="list-group-item">Porta ac consectetur ac</li>
                                    <li class="list-group-item">Vestibulum at eros</li>
                                </ul>
                            </div>
                            </div>
                            <%@include file="Include/Partes/rodape.jsp" %>>
                            </body>
                            </html>

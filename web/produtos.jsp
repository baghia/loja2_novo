<%--
    Document   : index
    Created on : 25/03/2014, 15:54:49
    Author     : Renan Huf Silveira
--%>
<%@page import="control.FuncoesUteis"%>
<%@page import="model.Marca"%>
<%@page import="dao.MarcaDAO"%>
<%@page import="model.Produto"%>
<%@page import="dao.ProdutoDAO"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    ProdutoDAO produtoDao = new ProdutoDAO();
    SubCategoriaDAO subcategoriaDao = new SubCategoriaDAO();
    SubCategoria subCategoria = subcategoriaDao.consultar(id);
    ArrayList<Produto> listaProdutos = produtoDao.listarSubcategoria(id);
    Produto p = new Produto();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
        <style>
            .produtos{ 
                height: 310px;
                outline: 2px dotted #000;
                margin-left: 30px;
                margin-top: 20px;
                padding-left: 15px;
                padding-right: 15px;
                padding-top: 10px;
            }
            .container{  outline: 2px dotted #c30; }
            #oferta{ outline: 2px dotted #c90;  padding-left: 0px;}
            #divProduto{ outline: 2px dotted #c90;  margin-left: 0px; margin-top: 20px}
        </style>
    </head>
    <body>
        <%@include file= "Include/baseSite.jsp" %>
        <div id="subcategoria" class="container">
            <h2><%= subCategoria.getNome()%></h2>
        </div>
        <div class="container">
            <div  class="row">
                <div  class="col-md-2 "><!--As duas opcões da coluna filtro são dentro dessa div-->
                    <br/>
                    <div class="bs-docs-example">                     
                        <ul class="nav nav-tabs nav-stacked">
                            <li class="active"><a href="#">Marcas</a></li>
                            <div class="radio">
                                <li><input type="radio" name="marca" value="-1">Todas as Marcas</li>
                                <%  MarcaDAO marcaDAO = new MarcaDAO();
                                    Marca m = new Marca();
                                    ArrayList<Marca> lista = marcaDAO.listar();
                                    for (int i = 0; i < lista.size(); i++) {
                                        m = lista.get(i);%>
                                <li><input type="radio" name="marca" value="<%= m.getId()%>"><%= m.getNome()%></li>
                                    <%}%>
                            </div>
                        </ul>                      
                    </div>
                            <br/>
                    <div class="bs-docs-example">                     
                        <ul class="nav nav-tabs nav-stacked">
                            <li class="active"><a href="#">Preço</a></li>                           
                            <div class="radio">
                                <li><input type="radio" name="preco" value="-1">Todos os Preços</li>                                 
                                <li><input type="radio" name="preco" value="1">Até R$ 150,00</li>
                                <li><input type="radio" name="preco" value="1">R$ 150,00 a R$ 300,00 </li>
                                <li><input type="radio" name="preco" value="1">R$ 300,00 a R$ 600,00</li>
                                <li><input type="radio" name="preco" value="1">R$ 600,00 a R$ 900,00</li>
                                <li><input type="radio" name="preco" value="1">Mais de R$ 900,00</li>
                            </div>
                        </ul>                      
                    </div>

                </div>



                <div  id="oferta" class="container">
                    <%
                    FuncoesUteis fu = new FuncoesUteis();
                    if(lista.size() > 0){
                        for (int i = 0; i < listaProdutos.size(); i++) {
                            p = listaProdutos.get(i);
                            %>
                    <div  class="col-md-2 produtos"> 
                        <a href="http://localhost:8084/E-Commerce/detalheProduto.jsp?id=<%= p.getId()%> "><img src="http://www.colombo.com.br/produtos/239726/239726_239726_239726_samsung_galaxy_s4_branco_g21_g.jpg" class="img-polaroid" height="150" width="150"></a><br/>
                        <div id="divProduto">
                            <a href="http://localhost:8084/E-Commerce/detalheProduto.jsp?id=<%= p.getId()%> "><p><strong><%= p.getNome()%></strong></p></a>
                            <a href="http://localhost:8084/E-Commerce/detalheProduto.jsp?id=<%= p.getId()%> "><h4><%= "Por: " + fu.converterMoeda(p.getPreco()) %></h4></a>
                            <a href="http://localhost:8084/E-Commerce/detalheProduto.jsp?id=<%= p.getId()%> "><h6><%= "12x de " + fu.converterMoeda(Math.ceil(p.getPreco() / 12))%><br/>sem juros</h6></a>
                        </div>
                    </div>
                    <%
                        }
                    }else{%>
                    <div  class="col-md-2 produtos"> 
                        <div id="divProduto">
                        <h2>Nenhum produto em estoque</h2>
                        </div>
                    </di>
                    %>
                    <%}%>
                </div>

            </div>

        </div>
        <%@include file="Include/Partes/rodape.jsp" %>
    </body>
</html>

<%@include file="include.jsp" %>
<%
    int e = -2;
    Integer id = Integer.parseInt(request.getParameter("id"));

    SubCategoriaDAO subcategoriaDao = new SubCategoriaDAO();
    MarcaDAO marcaDao = new MarcaDAO();
    CategoriaDAO tipoDao = new CategoriaDAO();
    ProdutoDAO produtoDao = new ProdutoDAO();
    DetalheProdutoDao detalheProdutoDao = new DetalheProdutoDao();

    ArrayList<SubCategoria> subcategorias = subcategoriaDao.listar();
    ArrayList<Marca> marcas = marcaDao.listar();
    ArrayList<Categoria> descricoes = tipoDao.consultarCodDescricao(3);
    ArrayList<DetalheProduto> detalhes = detalheProdutoDao.listarProduto(id);

    Produto produto = produtoDao.consultar(id);

    String erro = request.getParameter("e");
    if (erro != null) {
        e = Integer.parseInt(erro);
    } else {
        e = -1;
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Produtos cadastrados</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../../css/bootstrap.min.css" rel="stylesheet">
        <link href="../css/style.css" rel="stylesheet">
        <script src="../../js/jquery.min.js"></script>
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
        <script>
            $(document).ready(function() {
                $(".navbar-nav li:nth-child(1) a").addClass("selected");

            });
        </script>
    </head>
    <body>
        <%@include file="../include/menu.jsp" %>

        <div class="container">
            <%
                switch (e) {
                    case 0: %>
            <div class="alert alert-success alert-dismissable">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                Alteração efetuada com sucesso.
            </div>
            <%      break;

                case 1: %>
            <div class="alert alert-danger alert-dismissable">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                Ocorreu um erro.
            </div>
            <%      break;
                case 2: %>
            <div class="alert alert-danger alert-dismissable">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                Ocorreu um erro.
            </div>   
            <%      break;
                }%>                              

            <div class="cleaner h20"></div>
            <div class="col-md-3 float_l">
                <h3><%= produto.getNome()%></h3>

                <div class="cleaner h10"></div> 
                <div class="btn-group float_r">
                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#">
                        Ação
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="#" data-toggle="modal" data-target="#l<%= produto.getId()%>" >Editar</a></li>
                            <%
                                if (produto.getStatus() == 1) {%>
                        <li><a href="../../DesativarProduto?id=<%= produto.getId()%>&v=0">Desativar</a></li>
                            <% } else {%>
                        <li><a href="../../DesativarProduto?id=<%= produto.getId()%>&v=1">Ativar</a></li> <% }%>
                    </ul>
                </div>        

                <p>Preço: <%= produto.formatarPreco()%></p>
                <p>Marca: <%= produto.getMarca().getNome()%><p>
                <p>Categoria: <%= produto.getSubcategoria().getNome()%></p>
                <p>Status: <%
                        if (produto.getStatus() == 1) { %>Ativo
                    <% } else { %> Inativo <% }%></p>

            </div>
            <div class="col-md-9">
                <div class="row panel panel-primary teste-lg">
                    <div class="panel-heading">Imagens</div>
                    <div class="panel-body">
                        <div class="imagem">
                            <form method="post" action="">	
                                <button id="excluir" title="Clique para excluir a imagem." type="submit"></button>
                                <a href="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMzQiIGhlaWdodD0iMTgwIj48cmVjdCB3aWR0aD0iMTM0IiBoZWlnaHQ9IjE4MCIgZmlsbD0iI2VlZSI+PC9yZWN0Pjx0ZXh0IHRleHQtYW5jaG9yPSJtaWRkbGUiIHg9IjY3IiB5PSI5MCIgc3R5bGU9ImZpbGw6I2FhYTtmb250LXdlaWdodDpib2xkO2ZvbnQtc2l6ZToxMnB4O2ZvbnQtZmFtaWx5OkFyaWFsLEhlbHZldGljYSxzYW5zLXNlcmlmO2RvbWluYW50LWJhc2VsaW5lOmNlbnRyYWwiPjEzNHgxODA8L3RleHQ+PC9zdmc+" class="group1 thumbnail">
                                    <img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMzQiIGhlaWdodD0iMTgwIj48cmVjdCB3aWR0aD0iMTM0IiBoZWlnaHQ9IjE4MCIgZmlsbD0iI2VlZSI+PC9yZWN0Pjx0ZXh0IHRleHQtYW5jaG9yPSJtaWRkbGUiIHg9IjY3IiB5PSI5MCIgc3R5bGU9ImZpbGw6I2FhYTtmb250LXdlaWdodDpib2xkO2ZvbnQtc2l6ZToxMnB4O2ZvbnQtZmFtaWx5OkFyaWFsLEhlbHZldGljYSxzYW5zLXNlcmlmO2RvbWluYW50LWJhc2VsaW5lOmNlbnRyYWwiPjEzNHgxODA8L3RleHQ+PC9zdmc+" class="foto">
                                </a>
                            </form>
                        </div>
                        <div class="imagem">
                            <form method="post" action="">	
                                <button id="excluir" title="Clique para excluir a imagem." type="submit"></button>
                                <a href="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMzQiIGhlaWdodD0iMTgwIj48cmVjdCB3aWR0aD0iMTM0IiBoZWlnaHQ9IjE4MCIgZmlsbD0iI2VlZSI+PC9yZWN0Pjx0ZXh0IHRleHQtYW5jaG9yPSJtaWRkbGUiIHg9IjY3IiB5PSI5MCIgc3R5bGU9ImZpbGw6I2FhYTtmb250LXdlaWdodDpib2xkO2ZvbnQtc2l6ZToxMnB4O2ZvbnQtZmFtaWx5OkFyaWFsLEhlbHZldGljYSxzYW5zLXNlcmlmO2RvbWluYW50LWJhc2VsaW5lOmNlbnRyYWwiPjEzNHgxODA8L3RleHQ+PC9zdmc+"  class="group1 thumbnail">
                                    <img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMzQiIGhlaWdodD0iMTgwIj48cmVjdCB3aWR0aD0iMTM0IiBoZWlnaHQ9IjE4MCIgZmlsbD0iI2VlZSI+PC9yZWN0Pjx0ZXh0IHRleHQtYW5jaG9yPSJtaWRkbGUiIHg9IjY3IiB5PSI5MCIgc3R5bGU9ImZpbGw6I2FhYTtmb250LXdlaWdodDpib2xkO2ZvbnQtc2l6ZToxMnB4O2ZvbnQtZmFtaWx5OkFyaWFsLEhlbHZldGljYSxzYW5zLXNlcmlmO2RvbWluYW50LWJhc2VsaW5lOmNlbnRyYWwiPjEzNHgxODA8L3RleHQ+PC9zdmc+"  class="foto">
                                </a>
                            </form>
                        </div>
                        <div class="imagem">
                            <form method="post" action="">	
                                <button id="excluir" title="Clique para excluir a imagem." type="submit"></button>
                                <a href="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMzQiIGhlaWdodD0iMTgwIj48cmVjdCB3aWR0aD0iMTM0IiBoZWlnaHQ9IjE4MCIgZmlsbD0iI2VlZSI+PC9yZWN0Pjx0ZXh0IHRleHQtYW5jaG9yPSJtaWRkbGUiIHg9IjY3IiB5PSI5MCIgc3R5bGU9ImZpbGw6I2FhYTtmb250LXdlaWdodDpib2xkO2ZvbnQtc2l6ZToxMnB4O2ZvbnQtZmFtaWx5OkFyaWFsLEhlbHZldGljYSxzYW5zLXNlcmlmO2RvbWluYW50LWJhc2VsaW5lOmNlbnRyYWwiPjEzNHgxODA8L3RleHQ+PC9zdmc+"  class="group1 thumbnail">
                                    <img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMzQiIGhlaWdodD0iMTgwIj48cmVjdCB3aWR0aD0iMTM0IiBoZWlnaHQ9IjE4MCIgZmlsbD0iI2VlZSI+PC9yZWN0Pjx0ZXh0IHRleHQtYW5jaG9yPSJtaWRkbGUiIHg9IjY3IiB5PSI5MCIgc3R5bGU9ImZpbGw6I2FhYTtmb250LXdlaWdodDpib2xkO2ZvbnQtc2l6ZToxMnB4O2ZvbnQtZmFtaWx5OkFyaWFsLEhlbHZldGljYSxzYW5zLXNlcmlmO2RvbWluYW50LWJhc2VsaW5lOmNlbnRyYWwiPjEzNHgxODA8L3RleHQ+PC9zdmc+"  class="foto">
                                </a>
                            </form>
                        </div>
                        <div class="imagem">
                            <form method="post" action="">	
                                <button id="excluir" title="Clique para excluir a imagem." type="submit"></button>
                                <a href="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMzQiIGhlaWdodD0iMTgwIj48cmVjdCB3aWR0aD0iMTM0IiBoZWlnaHQ9IjE4MCIgZmlsbD0iI2VlZSI+PC9yZWN0Pjx0ZXh0IHRleHQtYW5jaG9yPSJtaWRkbGUiIHg9IjY3IiB5PSI5MCIgc3R5bGU9ImZpbGw6I2FhYTtmb250LXdlaWdodDpib2xkO2ZvbnQtc2l6ZToxMnB4O2ZvbnQtZmFtaWx5OkFyaWFsLEhlbHZldGljYSxzYW5zLXNlcmlmO2RvbWluYW50LWJhc2VsaW5lOmNlbnRyYWwiPjEzNHgxODA8L3RleHQ+PC9zdmc+" class="group1 thumbnail">
                                    <img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMzQiIGhlaWdodD0iMTgwIj48cmVjdCB3aWR0aD0iMTM0IiBoZWlnaHQ9IjE4MCIgZmlsbD0iI2VlZSI+PC9yZWN0Pjx0ZXh0IHRleHQtYW5jaG9yPSJtaWRkbGUiIHg9IjY3IiB5PSI5MCIgc3R5bGU9ImZpbGw6I2FhYTtmb250LXdlaWdodDpib2xkO2ZvbnQtc2l6ZToxMnB4O2ZvbnQtZmFtaWx5OkFyaWFsLEhlbHZldGljYSxzYW5zLXNlcmlmO2RvbWluYW50LWJhc2VsaW5lOmNlbnRyYWwiPjEzNHgxODA8L3RleHQ+PC9zdmc+" class="foto">
                                </a>
                            </form>
                        </div>
                    </div>
                    <div class="panel-footer">
                        <button title="Nova imagem" data-toggle="modal" data-target="#novaImagem" name="newImagem" class="btn btn-primary float_l">+ Imagem</button>
                    </div>
                </div>
                <div class="cleaner h10"></div>
                <div class="row panel panel-primary teste-lg">
                    <div class="panel-heading">Detalhes</div>
                    <div class="panel-body">
                        <ul class="list-group detalhes">
                            <%
                            for (DetalheProduto detalhe : detalhes) {%>
                            <li class="list-group-item">
                                <form method="post" action="">
                                    <button type="submit" class="x"></button>
                                    <%= detalhe.getDescricao().getNome()%> <%= detalhe.getValor()%>
                                </form>
                            </li>
                            <% }%>
                        </ul>
                    </div>
                    <div class="panel-footer">
                        <button title="Novo detalhe" data-toggle="modal" data-target="#novo" class="btn btn-primary float_r">+ Detalhe</button>
                    </div>
                    <div class='modal fade' id="novo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    <h4 class="modal-title" id="myModalLabel">Adicionar característica</h4>
                                </div>
                                <div class="modal-body">
                                    <form role="form" action='../../NovoDetalhe?id=<%= produto.getId()%>' method='post' >
                                        <div class='cleaner h20'></div>
                                        <div class="form-group">
                                            <select name="desc" class="form-control" required>
                                                <option value="-1">Selecione uma opção</option>
                                                <%
                                                for (Categoria descricao : descricoes) {%>
                                                <option value="<%= descricao.getId()%>"><%= descricao.getNome()%></option>
                                                <%}
                                                %>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <input type='text' name='descricao' class="form-control" value='' placeholder="Descrição" required autofocus>
                                        </div>
                                            <!--input type="hidden" name="id" value="<%= produto.getId()%>" /-->
                                        <div class="cleaner h20"></div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                                    <button type="submit" class="btn btn-primary">Salvar</button>
                                </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="l<%= produto.getId()%>" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title" id="myModalLabel">Editar dados do produto</h4>
                            </div> 
                            <form role="form" action='../../EditarProduto' method='post' >
                                <div class="modal-body">
                                    <input type="hidden" name="id" value="<%= produto.getId()%>" />
                                    <div class='cleaner h20'></div>
                                    <div class="form-group" name="nome">
                                        <input type='text' name='nome' class="form-control" value='<%= produto.getNome()%>' autofocus>
                                    </div>
                                    <div class="form-group" name="preco">
                                        <input type='text' class="form-control" name='preco' value="<%= produto.getPreco()%>">
                                    </div>
                                    <div class="form-group" name="marcas">
                                        <select name="marca" class="form-control" required>
                                            <%
                                            for (Marca marca : marcas) {%>
                                            <option value="<%= marca.getId()%>"
                                                    <% if (produto.getMarca().getId() == marca.getId()) { %> selected <% }%>
                                                    ><%= marca.getNome()%></option>
                                            <%}
                                            %>
                                        </select>
                                    </div>
                                    <div class="form-group" name="subCategorias">
                                        <select name="subcategoria" class="form-control" required>
                                            <%
                                            for (SubCategoria subCategoria : subcategorias) {%>
                                            <option value="<%= subCategoria.getId()%>"
                                                    <% if (produto.getSubcategoria().getId() == subCategoria.getId()) { %> selected <% }%>><%= subCategoria.getNome()%></option>
                                            <%}
                                            %>
                                        </select>
                                    </div>
                                    <div class="cleaner h20"></div>


                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                                    <button type="submit" class="btn btn-primary">Salvar</button>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
                <div class="cleaner h10"></div>
                <form method="post" action="ver.jsp">
                    <button type="submit" class="btn btn-primary">Voltar</button>
                </form>
            </div>
            <%@include file="../include/footer.html" %>
    </body>
</html>

<%@include file="include.jsp" %>
<%
    SubCategoriaDAO subcategoriaDao = new SubCategoriaDAO();
    MarcaDAO marcaDao = new MarcaDAO();
    int e = -2;
    ArrayList<SubCategoria> subcategorias = subcategoriaDao.listar();
    ArrayList<Marca> marcas = marcaDao.listar();

    ProdutoDAO produtoDao = new ProdutoDAO();
    ArrayList<Produto> produtos = produtoDao.listarTodos();

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
            <button title="Novo produto" data-toggle="modal" data-target="#novo" class="btn btn-primary">Novo Produto</button>
            <div class='modal fade' id="novo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">

                <div class="modal-dialog modal-lg">

                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="myModalLabel">Novo produto</h4>
                        </div>
                        <div class="modal-body">
                            <form role="form" action='../../NovoProduto' method='post' >
                                <div class='cleaner h20'></div>
                                <div class="form-group" name="nome">
                                    <input type='text' name='nome' class="form-control" value='' placeholder="Nome do produto" required autofocus>
                                </div>
                                <div class="form-group" name="preco">
                                    <input type='text' class="form-control" name='preco' placeholder="Preço" required>
                                </div>
                                <div class="form-group" name="marcas">
                                    <select name="marca" class="form-control" required>
                                        <option value="-1">Selecione uma marca</option>
                                        <%
                                            for (Marca marca : marcas) {%>
                                        <option value="<%= marca.getId()%>"><%= marca.getNome()%></option>
                                        <%}
                                        %>
                                    </select>
                                </div>
                                <div class="form-group" name="subCategorias">
                                    <select name="subcategoria" class="form-control" required>
                                        <option value="-1">Selecione uma categoria</option>
                                        <%
                                            for (SubCategoria subCategoria : subcategorias) {%>
                                        <option value="<%= subCategoria.getId()%>"><%= subCategoria.getNome()%></option>
                                        <%}
                                        %>
                                    </select>
                                </div>
                                <div class="cleaner h20"></div>


                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                            <button type="submit" class="btn btn-primary">Salvar</button>
                        </form>

                        </div>
                    </div>

                </div>
            </div><!-- fim modal -->
            <span>Apenas produtos ativos aparecem no site disponíveis para compra.</span>
            <div class="cleaner h20"></div>
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
                }   %>                              

            <div class="cleaner"></div>                               
            <div class="divTable w700">
                <table class="w700">
                    <tr>
                        <th>
                        <th>Nome
                        <th>Preço
                        <th>Marca
                        <th>Categoria 
                        <th>Status
                    </tr>
                    <%
                        for (Produto produto : produtos) {%>
                    <tr>
                        <td>
                            <div class="btn-group">
                                <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#">
                                    Ação
                                    <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a href="#" data-toggle="modal" data-target="#l<%= produto.getId()%>" >Editar</a></li>

                                    <li><a href="detalhes.jsp?id=<%= produto.getId()%>">Ver Detalhes</a></li>
                                        <%
                                            if (produto.getStatus() == 1) {%>
                                    <li><a href="../../DesativarProduto?id=<%= produto.getId()%>&v=0">Desativar</a></li>
                                        <% } else {%>
                                    <li><a href="../../DesativarProduto?id=<%= produto.getId()%>&v=1">Ativar</a></li> <% }%>
                                </ul>
                            </div>
                        </td>
                        <td><%= produto.getNome()%>
                        <td><%= produto.formatarPreco()%>
                        <td><%= produto.getMarca().getNome() %>
                        <td><%= produto.getSubcategoria().getNome()%>
                            <td> <%
                                if (produto.getStatus() == 1) { %>Ativo
                            <% } else { %> Inativo <% } %>

                    </tr>
                    <%
                        }
                    %>
                </table>
            </div>
        </div>
        <%
            for (Produto produto : produtos) {%>
        <div class="modal fade" id="l<%= produto.getId()%>" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">

                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModalLabel">Editar dados do produto</h4>
                    </div> 
                    <form role="form" action='../../EditarProduto' method='post' >
                        <div class="modal-body">
                             <input type="hidden" name="id" value="<%= produto.getId() %>" />
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
        <% }%>
        <%@include file="../include/footer.html" %>
    </body>
</html>

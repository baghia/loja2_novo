<%@include file="include.jsp" %>
<%
    SubCategoriaDAO subcategoriaDao = new SubCategoriaDAO();
    MarcaDAO marcaDao = new MarcaDAO();

    ArrayList<SubCategoria> subcategorias = subcategoriaDao.listar();
    ArrayList<Marca> marcas = marcaDao.listar();
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
        <script>
            $(document).ready(function() {
                $(".navbar-nav li:nth-child(2) a").addClass("selected");

            });
        </script>
        <style>
            .alert{
                display:none;
            }
        </style>
    </head>
    <body>
        <%@include file="../include/menu.html" %>
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
                            <form role="form" action='editDeficiencia.php?t=' method='post' >
                                <div class='cleaner h20'></div>
                                <div class="form-group" name="nome">
                                    <span>*&nbsp;Nome&nbsp;</span><input type='text' name='nome' class="form-control" value='' placeholder="Nome do produto">
                                </div>
                                <div class="form-group" name="preco">
                                    <span>*&nbsp;Preço R$&nbsp;</span><input type='text' class="form-control" name='preco' value=''placeholder="Preço">
                                </div>
                                <div class="form-group" name="marcas">
                                    <span>*&nbsp;Marca &nbsp;</span>
                                    <select name="marca" class="form-control">
                                        <option value="-1">Selecione uma marca</option>
                                        <%
                                            for (Marca marca : marcas) {%>
                                        <option value="<%= marca.getId()%>"><%= marca.getNome()%></option>
                                        <%}
                                        %>
                                    </select>
                                </div>
                                <div class="form-group" name="subCategorias">
                                    <span>*&nbsp;Sub-categoria &nbsp;</span>
                                    <select name="subcategoria" class="form-control">
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
                            <button type="button" class="btn btn-primary">Salvar</button>
                            </form>

                        </div>
                    </div>

                </div>
            </div>
            <div class="cleaner h20"></div>
            <table class="table table-striped w500">
                <tr>
                    <th>
                    <th>Nome
                    <th>Preço
                    <th>Categoria   
                </tr>
                <tr>
                    <td>
                        <div class="btn-group">
                            <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#">
                                Ação
                                <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="#" data-toggle="modal" data-target="#l1" >Editar</a></li>

                                <li><a href="#">Ver Detalhes</a></li>
                                <li><a href="#">Desativar</a></li>
                            </ul>
                        </div>
                    </td>
                    <td>Samsung Galaxy Y
                    <td>R$ 999,99
                    <td>Celulares
                </tr>
                <tr>
                    <td>
                        <div class="btn-group">
                            <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#">
                                Ação
                                <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="" clas="editar">Editar</a>
                                <li><a href="#">Ver Detalhes</a>
                                <li><a href="#">Desativar</a>
                            </ul>
                        </div>
                    </td>
                    <td>Notebook HP Dv6000
                    <td>R$ 2.999,99
                    <td>Notebook
                </tr>
            </table>
        </div>
        <div class="modal fade" id="l1" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
            <form class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModalLabel">Editar dados do produto</h4>
                    </div>
                    <div class="modal-body">
                        ...
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                        <button type="button" class="btn btn-primary">Salvar</button>
                    </div>
                </div>
            </form>
        </div>
        <%@include file="../include/footer.html" %>
    </body>
</html>

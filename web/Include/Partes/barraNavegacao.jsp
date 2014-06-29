<%-- 
    Document   : barraNavegacao
    Created on : 26/03/2014, 15:01:09
    Author     : Renan Huf Silveira
--%>

<%@page import="model.SubCategoria"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Categoria"%>
<%@page import="dao.CategoriaDAO"%>
<%@page import="dao.SubCategoriaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<nav id="navPosicao" class="navbar navbar-default" role="navigation">    
    <div class="container">
        <div class="navbar-header">
            <button id="btResposivo" type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>

        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li><a href="http://localhost:8084/E-Commerce/">Pagina Inicial</a></li>

                <%
                    CategoriaDAO daoCat = new CategoriaDAO();
                    SubCategoriaDAO daoSubCat = new SubCategoriaDAO();
                    ArrayList<Categoria> listaCategoria = daoCat.consultarCodDescricao(2);
                    for (int i = 0; i < listaCategoria.size(); i++) {
                        Categoria cat = listaCategoria.get(i);
                %>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><%= cat.getNome()%><b class="caret"></b></a>
                    <ul class="dropdown-menu" >
                        <%
                            int a = i + 1;
                            ArrayList<SubCategoria> listaSubCategoria = daoSubCat.listarCategoria(cat.getId());
                            for (int j = 0; j < listaSubCategoria.size(); j++) {
                                SubCategoria subCat = listaSubCategoria.get(j);
                        %>
                        <li><a href="http://localhost:8084/E-Commerce/produtos.jsp?id=<%= subCat.getId()%> "><%= subCat.getNome()%></a></li>
                            <%
                                }
                            %>
                    </ul>
                    <%
                        }
                    %>

                </li>

                <li><a href="#">Contato</a></li>
            </ul>

            <form class="navbar-form navbar-right" role="search">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="">
                </div>
                <button type="submit" class="btn btn-default">Pesquisar</button>
            </form>   
        </div><!--/.nav-collapse -->
    </div>
</nav>

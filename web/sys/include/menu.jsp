<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="navbar navbar-default" role="navigation">    
    <div class="navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="#">Pagina Inicial</a></li>
                <li><a href="../produto/ver.jsp" >Produtos</a></li>
                <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" >Outros</a>
                    <ul class="dropdown-menu">
                        <li><a href="../tipo/ver.jsp?c=2" >Categoria de Produto</a></li>
                        <li><a href="../tipo/ver.jsp?c=3" >Descrição do Produto</a></li>
                    </ul>
                </li>
                <li><a href="../produto/ver.jsp" >Clientes</a></li>
                <li><a href="#">Sair</a></li>
            </ul>
    </div><!--/.nav-collapse -->
</div>

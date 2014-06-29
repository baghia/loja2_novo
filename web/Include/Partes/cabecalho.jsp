<%-- 
    Document   : cabecalho
    Created on : 26/03/2014, 15:01:18
    Author     : Renan Huf Silveira
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
        <style> .login{color:write;}</style>
        <div id="cabecalho">
        <br/><br/><br/><br/><br/>
        <div class="col-md-2 col-xs-offset-9">
<<<<<<< HEAD
            <%if(session.getAttribute("usuario") != null){%>
            <p class="login">Bem-Vindo,<%= session.getAttribute("usuario")%></p>
            <form action="<% session.invalidate(); %>" method="post">
                    <div class="form-group">
                        <div class="col-md-3 col-lg-offset-0">
                            <button type="submit" class="btn btn-default" name="sair"><span class="glyphicon glyphicon-log-in"></span> Sair</button>
                        </div>
                    </div>
                </form>
            <%}else{%>
            <a href="http://localhost:8084/E-Commerce/login.jsp" class="login"> Faça seu <u>login</u><br/>ou <u>cadastre-se</u></a>
            <%}%>
=======
            <a href="http://localhost:8084/E-Commerce/login.jsp" class="login"> Faça seu <u>login</u><br/>ou <u>cadastre-se</u></a>
>>>>>>> origin/master
        </div> 
        </div>


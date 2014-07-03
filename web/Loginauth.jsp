<%-- 
    Document   : Loginauth
    Created on : 03/07/2014, 18:46:39
    Author     : Renan Huf Silveira
--%>

<%@page import="model.CarrinhoCompras"%>
<%@page import="model.Cliente"%>
<%@page import="dao.ClienteDAO"%>
<%
    ClienteDAO cdao = new ClienteDAO();
    Cliente c = cdao.consultar(request.getParameter("usuario"), request.getParameter("senha"));
    if (c != null) {
        session.setAttribute("usuario", c);
        session.setAttribute("carrinho", new CarrinhoCompras());
        System.out.print("sessao iniciada\n");
        response.sendRedirect("index.jsp");
    }else{
    response.sendRedirect("index.jsp");
    }
%>
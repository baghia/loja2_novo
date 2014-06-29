package control.produto;

import dao.ProdutoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Produto;

@WebServlet(name = "Editar", urlPatterns = {"/EditarProduto"})
public class Editar extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        ProdutoDAO produtoDao = new ProdutoDAO();
        Produto produto = produtoDao.consultar(id);
        Double preco = 0.0;
        String nome = request.getParameter("nome");
        String preco_ = request.getParameter("preco");
        int marca = Integer.parseInt(request.getParameter("marca"));
        int subcategoria = Integer.parseInt(request.getParameter("subcategoria"));
        boolean result = true, result2 = true, result3 = true, result4 = true;
        if (!preco_.equals(Double.toString(produto.getPreco()) )) {
            preco_ = preco_.replace(",", ".");
            preco = Double.parseDouble(preco_);
            produto.setPreco(preco);
            produtoDao = new ProdutoDAO();
            result = produtoDao.alterarPreco(produto, id);
        }
        if (!nome.equals(produto.getNome())) {
            produto.setNome(nome);
            produtoDao = new ProdutoDAO();
            result2 = produtoDao.alterarNome(produto, id);
        }
        if (produto.getSubcategoria().getId() != subcategoria) {
            produtoDao = new ProdutoDAO();
            result3 = produtoDao.alterarSubCategoria(subcategoria, id);
        }
        if (marca != produto.getMarca().getId()) {
            produtoDao = new ProdutoDAO();
            result4 = produtoDao.alterarMarca(marca, id);
        }
        /*response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Teste</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Teste at " + request.getContextPath() + "</h1>");
            out.println("PReco: "+ preco_ + ". " + Double.toString(preco));
            if(result){
                out.println("<p>Result true.</p>");
            } else {
               out.println("<p>Result false.</p>"); 
            }
            if(result2){
                out.println("<p>Result2 true.</p>");
            } else {
               out.println("<p>Result2 false.</p>"); 
            }
            if(result3){
                out.println("<p>Result3 true.</p>");
            } else {
               out.println("<p>Result3 false.</p>"); 
            }
            if(result4){
                out.println("<p>Result4 true.</p>");
            } else {
               out.println("<p>Result4 false.</p>"); 
            }
            out.println("</body>");
            out.println("</html>");
        }*/
        if (result && result2 && result3 && result4) {
            response.sendRedirect("sys/produto/ver.jsp?e=0");
        } else {
            response.sendRedirect("sys/produto/ver.jsp?e=3");
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

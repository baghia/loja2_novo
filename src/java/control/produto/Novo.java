package control.produto;

import dao.ProdutoDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Marca;
import model.Produto;
import model.SubCategoria;

/**
 *
 * @author surume
 */
@WebServlet(name = "NovoProduto", urlPatterns = {"/NovoProduto"})
public class Novo extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Produto produto = new Produto();
        produto.setNome(request.getParameter("nome"));
        String preco = request.getParameter("preco");
        preco = preco.replace(".", "");
        preco = preco.replace(",", ".");
        produto.setPreco(Double.parseDouble(preco));
        produto.setMarca(new Marca());
        produto.getMarca().setId(Integer.parseInt(request.getParameter("marca")));
        produto.setSubcategoria(new SubCategoria());
        produto.getSubcategoria().setId(Integer.parseInt(request.getParameter("subcategoria")));
        
        ProdutoDAO produtoDao = new ProdutoDAO();
        int result = produtoDao.inserir(produto);
        if(result > 0){
            response.sendRedirect("sys/produto/ver.jsp?e-0");
        } else {
            response.sendRedirect("sys/produto/ver.jsp?e=2");
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

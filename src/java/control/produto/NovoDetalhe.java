package control.produto;

import dao.DetalheProdutoDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Categoria;
import model.DetalheProduto;
import model.Produto;
@WebServlet(name = "NovoDetalhe", urlPatterns = {"/NovoDetalhe"})
public class NovoDetalhe extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int detalhe = Integer.parseInt(request.getParameter("desc"));
        int produto = Integer.parseInt(request.getParameter("id"));
        String descricao = request.getParameter("descricao");
        
        if( (detalhe > 0) && (produto > 0) && (! descricao.isEmpty()) ){
            DetalheProduto detalheProduto = new DetalheProduto();
            DetalheProdutoDao detalheDao = new DetalheProdutoDao();

            detalheProduto.setProduto(new Produto());
            detalheProduto.setDescricao(new Categoria());

            detalheProduto.getProduto().setId(produto);
            detalheProduto.getDescricao().setId(detalhe);
            detalheProduto.setValor(descricao);

            boolean result = detalheDao.inserir(detalheProduto);
            if(result){
                response.sendRedirect("sys/produto/detalhes.jsp?id=" + produto + "&e=0");
            } else {
                response.sendRedirect("sys/produto/detalhes.jsp?id=" + produto + "&e=2");
            }
        } else {
            response.sendRedirect("sys/produto/detalhes.jsp?id=" + produto + "&e=1");
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

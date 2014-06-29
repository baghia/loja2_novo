package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Categoria;
import model.DetalheProduto;

public class DetalheProdutoDao {
    Conexao con;
    PreparedStatement stm;
    ResultSet rs;
    
    public DetalheProdutoDao(){
         con = new Conexao();
    }
       
    public boolean inserir(DetalheProduto detalhe){
        String sql = "INSERT INTO descricaoProduto VALUES(?, ?, ?)";
        try {
            stm = con.conectar().prepareStatement(sql);
            stm.setInt(1, detalhe.getProduto().getId());
            stm.setInt(2, detalhe.getDescricao().getId());
            stm.setString(3, detalhe.getValor());
            stm.execute();
            return true;
        } catch (SQLException ex) {
            System.out.println("Erro inserir produto: " + ex.getMessage());
            return false;
        }        
    }
    
    public ArrayList<DetalheProduto> listarProduto( int idProduto) {
        ArrayList<DetalheProduto> detalhes = new ArrayList<>();
        String sql = "SELECT tipo.id as idTipo, tipo.nome as tipoNome, valor "
                + "FROM descricaoProduto join tipo "
                +       "on (descricaoProduto.descricao = tipo.id)"
                + "WHERE produto=?";
        try {
            stm = con.conectar().prepareStatement(sql);
            stm.setInt(1, idProduto);
            rs = stm.executeQuery();
            while(rs.next()){    //move o curso de registros
                DetalheProduto detalhe = new DetalheProduto();
                detalhe.setDescricao(new Categoria());
                detalhe.getDescricao().setId(rs.getInt("idTipo"));
                detalhe.getDescricao().setNome(rs.getString("tipoNome"));
                detalhe.setValor(rs.getString("valor"));
                detalhes.add(detalhe);
            }
            stm.close();
            con.desconectar();
        } catch (SQLException ex) {
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return detalhes;
    }
}

package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Imagem;
import model.Produto;

public class ImagemDAO {
    Conexao con = new Conexao();
    
    public void inserirImagem(Imagem imagem){
        String sql = "INSERT INTO imagem VALUES(default,?, ?, ?)";
        try {
            PreparedStatement stm = con.conectar().prepareStatement(sql);
            stm.setString(1, imagem.getCaminho());
            stm.setString(2, imagem.getDescricao());
            stm.setInt(3, imagem.getProduto().getId());
            stm.executeQuery(sql);
            stm.close();
            con.desconectar();
        } catch (SQLException ex) {
            
        }
    }
    
    public void alterarCaminho (Imagem imagem){
        String sql = "UPDATE imagem SET caminho=? where id=?";
        try {
            PreparedStatement stm = con.conectar().prepareStatement(sql);
            stm.setString(1, imagem.getCaminho());
            stm.setInt(2, imagem.getId());
            stm.executeQuery(sql);
            stm.close();
            con.desconectar();
        } catch (SQLException ex) {
            
        }
    }
    public void alterarDescricao (Imagem imagem){
        String sql = "UPDATE imagem SET descricao=? where id=?";
        try {
            PreparedStatement stm = con.conectar().prepareStatement(sql);
            stm.setString(1, imagem.getDescricao());
            stm.setInt(2, imagem.getId());
            stm.executeQuery(sql);
            stm.close();
            con.desconectar();
        } catch (SQLException ex) {
            
        }
    }
    public void alterarProduto (Imagem sub){
        String sql = "UPDATE imagem SET produto=? where id=?";
        try {
            PreparedStatement stm = con.conectar().prepareStatement(sql);
            stm.setInt(1, sub.getProduto().getId());
            stm.setInt(2, sub.getId());
            stm.executeQuery(sql);
            stm.close();
            con.desconectar();
        } catch (SQLException ex) {
            
        }
    }
    public ArrayList<Imagem> consultaPorProduto(int produtoId) {
        ArrayList<Imagem> lista = new ArrayList();
        String sql = "SELECT imagem.*, produto.nome as produtoNome FROM imagem join produto on (imagem.produto = produto.id)  where produto=?";
        try {
            PreparedStatement stm = con.conectar().prepareStatement(sql);
            stm.setInt(1, produtoId);
            ResultSet rs = stm.executeQuery(sql);
            while(rs.next()){    //move o curso de registros
                Imagem imagem = new Imagem();
                Produto produto = new Produto();
                
                imagem.setId(rs.getInt("id"));
                imagem.setCaminho(rs.getString("caminho"));
                imagem.setDescricao(rs.getString("descricao"));
                
                produto.setId(rs.getInt("produto"));
                produto.setNome(rs.getString("produtoNome"));
                imagem.setProduto(produto);
                lista.add(imagem);
            }
            stm.close();
            con.desconectar();
        } catch (SQLException ex) {
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
    public ArrayList<Imagem> consultar(int id) {
        ArrayList<Imagem> lista = new ArrayList();
        String sql = "SELECT imagem.*, produto.nome as produtoNome FROM imagem join produto on (imagem.produto = produto.id)  where id=?";
        try {
            PreparedStatement stm = con.conectar().prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery(sql);
            while(rs.next()){    //move o curso de registros
                Imagem imagem = new Imagem();
                Produto produto = new Produto();
                
                imagem.setId(rs.getInt("id"));
                imagem.setCaminho(rs.getString("caminho"));
                imagem.setDescricao(rs.getString("descricao"));
                
                produto.setId(rs.getInt("produto"));
                produto.setNome(rs.getString("produtoNome"));
                imagem.setProduto(produto);
                lista.add(imagem);
            }
            stm.close();
            con.desconectar();
        } catch (SQLException ex) {
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
}

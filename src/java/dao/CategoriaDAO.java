
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Categoria;

/**
 *
 * @author Renan Huf Silveira
 */
public class CategoriaDAO {
    Conexao con;
    PreparedStatement pstm;
    ResultSet rs;
    
    public CategoriaDAO() {
        con = new Conexao();
    }
    
    public void inserir (Categoria cat){
        String sql = "INSERT INTO tipo VALUES(default, ?, ?, ?);";
        try {
            pstm = con.conectar().prepareStatement(sql);
            pstm.setString(1, cat.getNome());
            pstm.setString(2, cat.getDescricao());
            pstm.setInt(3, cat.getCodDescricao());
            pstm.executeQuery();
            pstm.close();
            con.desconectar();
        } catch (SQLException ex) {
            
        }        
    }
    
    public void alterarNome (Categoria cat){
        String sql = "UPDATE tipo SET nome=? where id=?";
        try {
            pstm = con.conectar().prepareStatement(sql);
            pstm.setString(1, cat.getNome());
            pstm.setInt(2, cat.getId());
            pstm.executeQuery();
            pstm.close();
            con.desconectar();
        } catch (SQLException ex) {
            
        }        
    }
    public void alterarDescricao (Categoria cat){
        String sql = "UPDATE tipo SET descricao=? where id=?";
        try {
            pstm = con.conectar().prepareStatement(sql);
            pstm.setString(1, cat.getDescricao());
            pstm.setInt(2, cat.getId());
            pstm.executeQuery();
            pstm.close();
            con.desconectar();
        } catch (SQLException ex) {
            
        }        
    }
    public ArrayList<Categoria> consultarCodDescricao(int cod) {
        ArrayList<Categoria> lista = new ArrayList();
        String sql = "SELECT * FROM tipo WHERE codDescricao= ?;";
     
        try {
            pstm = this.con.conectar().prepareStatement(sql);
            pstm.setInt(1, cod);
            rs = pstm.executeQuery();
            
            while(rs.next()){    //move o curso de registros
                Categoria cat = new Categoria();
                cat.setId(rs.getInt("id"));
                cat.setNome(rs.getString("nome"));
                cat.setDescricao(rs.getString("descricao"));
                cat.setCodDescricao(rs.getInt("coddescricao"));
                lista.add(cat);
            }
            pstm.close();
            con.desconectar();
        } catch (SQLException ex) {
            Logger.getLogger(CategoriaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
    public Categoria consultar(int cod) {
        Categoria categoria = new Categoria();
        String sql = "SELECT * FROM tipo WHERE id= ?;";
     
        try {
            pstm = this.con.conectar().prepareStatement(sql);
            pstm.setInt(1, cod);
            rs = pstm.executeQuery();
            
            while(rs.next()){    //move o curso de registros
                categoria.setId(rs.getInt("id"));
                categoria.setNome(rs.getString("nome"));
                categoria.setDescricao(rs.getString("descricao"));
                categoria.setCodDescricao(rs.getInt("codDescricao"));
            }
            pstm.close();
            con.desconectar();
        } catch (SQLException ex) {
            Logger.getLogger(CategoriaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return categoria;
    }
    public ArrayList<Categoria> listar() {
        ArrayList<Categoria> lista = new ArrayList();
        String sql = "SELECT * FROM tipo order by codDescricao asc";
     
        try {
            pstm = this.con.conectar().prepareStatement(sql);
            rs = pstm.executeQuery();
            
            while(rs.next()){    //move o curso de registros
                Categoria cat = new Categoria();
                cat.setId(rs.getInt("id"));
                cat.setNome(rs.getString("nome"));
                cat.setDescricao(rs.getString("descricao"));
                cat.setCodDescricao(rs.getInt("codDescricao"));
                lista.add(cat);
            }
            pstm.close();
            con.desconectar();
        } catch (SQLException ex) {
            Logger.getLogger(CategoriaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
}

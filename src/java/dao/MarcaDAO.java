package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Marca;

/**
 *
 * @author Renan Huf Silveira
 */
public class MarcaDAO {
    Conexao con;
    PreparedStatement pstm;
    ResultSet rs;
    
    public MarcaDAO(){
         con = new Conexao();
    }
    
    public void inserir(Marca marca){
        String sql = "INSERT INTO marca VALUES(default,?);";
        try {
            pstm = con.conectar().prepareStatement(sql);
            pstm.setString(1, marca.getNome());
            pstm.executeQuery();
            pstm.close();
            con.desconectar();
        } catch (SQLException ex) {
            
        }        
    }
    
    public void alterarNome (Marca marca){
        String sql = "UPDATE marca SET nome=? where id=?";
        try {
            pstm = con.conectar().prepareStatement(sql);
            pstm.setString(1, marca.getNome());
            pstm.setInt(2, marca.getId());
            pstm.executeQuery();
            pstm.close();
            con.desconectar();
        } catch (SQLException ex) {
            
        }
    }
    public Marca consultar(int id) {
        String sql = "SELECT * FROM marca WHERE id=?;";
        Marca marca = new Marca();
        try {
            pstm = con.conectar().prepareStatement(sql);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
            while(rs.next()){    //move o curso de registros
                marca.setId(rs.getInt("id"));
                marca.setNome(rs.getString("nome"));
            }
            pstm.close();
            con.desconectar();
        } catch (SQLException ex) {
            Logger.getLogger(CategoriaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return marca;
    }
    public ArrayList<Marca> listar() {
        ArrayList<Marca> lista = new ArrayList();
        String sql = "SELECT * FROM marca;";
        try {
            pstm = con.conectar().prepareStatement(sql);            
            rs = pstm.executeQuery();
            while(rs.next()){    //move o curso de registros
                Marca marca = new Marca();
                marca.setId(rs.getInt("id"));
                marca.setNome(rs.getString("nome"));
                lista.add(marca);
            }
            pstm.close();
            con.desconectar();
        } catch (SQLException ex) {
            Logger.getLogger(CategoriaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
}

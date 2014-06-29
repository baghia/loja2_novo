package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Categoria;
import model.SubCategoria;

public class SubCategoriaDAO {
    Conexao con;
    PreparedStatement stm;
    ResultSet rs;
    
    public SubCategoriaDAO(){
         con = new Conexao();
    }
    
    public void inserir(SubCategoria subCat){
        String sql = "INSERT INTO subcategoria VALUES(default,?, ?)";
        try {
            stm = con.conectar().prepareStatement(sql);
            stm.setString(1, subCat.getNome());
            stm.setInt(2, subCat.getCategoria().getId());
            stm.executeQuery();
            stm.close();
            con.desconectar();
        } catch (SQLException ex) {
            
        }
    }
    
    public void alterarNome (SubCategoria sub){
        String sql = "UPDATE subCategoria SET nome=? where id=?";
        try {
            stm = con.conectar().prepareStatement(sql);
            stm.setString(1, sub.getNome());
            stm.setInt(2, sub.getId());
            stm.executeQuery();
            stm.close();
            con.desconectar();
        } catch (SQLException ex) {
            
        }
    }
    public void alterarCategoria (SubCategoria sub){
        String sql = "UPDATE subCategoria SET categoria=? where id=?";
        try {
            stm = con.conectar().prepareStatement(sql);
            stm.setInt(1, sub.getCategoria().getId());
            stm.setInt(2, sub.getId());
            stm.executeQuery();
            stm.close();
            con.desconectar();
        } catch (SQLException ex) {
            
        }
    }
    public ArrayList<SubCategoria> listarCategoria(int cat) {
        ArrayList<SubCategoria> lista = new ArrayList();
        String sql = "SELECT subcategoria.*, tipo.nome as categoriaNome FROM subcategoria join tipo on (subcategoria.categoria = tipo.id)  where categoria=?";
        try {
            stm = con.conectar().prepareStatement(sql);
                stm.setInt(1, cat);
                ResultSet rs = stm.executeQuery();
                while(rs.next()){    //move o curso de registros
                    SubCategoria subCat = new SubCategoria();
                    Categoria categoria = new Categoria();
                    
                    subCat.setId(rs.getInt("id"));
                    subCat.setNome(rs.getString("nome"));
                    categoria.setId(rs.getInt("categoria"));
                    categoria.setNome(rs.getString("categoriaNome"));
                    subCat.setCategoria(categoria);
                    lista.add(subCat);
                }
            con.desconectar();
        } catch (SQLException ex) {
            Logger.getLogger(CategoriaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
    public ArrayList<SubCategoria> listar() {
        ArrayList<SubCategoria> lista = new ArrayList();
<<<<<<< HEAD
        String sql = "SELECT subcategoria.*, categoria.nome as categoriaNome FROM subcategoria join categoria on (subcategoria.categoria = categoria.id) ORDER BY categoria asc";
=======
        String sql = "SELECT subcategoria.*, tipo.nome as categoriaNome FROM subcategoria join tipo on (subcategoria.categoria = tipo.id) ORDER BY tipo asc";
>>>>>>> origin/master
        try {
            stm = con.conectar().prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){    //move o curso de registros
                SubCategoria subCat = new SubCategoria();
                Categoria categoria = new Categoria();
                
                subCat.setId(rs.getInt("id"));
                subCat.setNome(rs.getString("nome"));
                categoria.setId(rs.getInt("categoria"));
                categoria.setNome(rs.getString("categoriaNome"));
                subCat.setCategoria(categoria);
                lista.add(subCat);
            }
            stm.close();
            con.desconectar();
        } catch (SQLException ex) {
            Logger.getLogger(CategoriaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
    public SubCategoria consultar(int id) {
        SubCategoria subcategoria = new SubCategoria();
        String sql = "SELECT subcategoria.*, tipo.nome as categoriaNome FROM subcategoria join tipo on (subcategoria.categoria = tipo.id)  where subcategoria.id=?";
        
        try {
            stm = con.conectar().prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){    //move o curso de registros
                Categoria categoria = new Categoria();
                
                subcategoria.setId(rs.getInt("id"));
                subcategoria.setNome(rs.getString("nome"));
                categoria.setId(rs.getInt("categoria"));
                categoria.setNome(rs.getString("categoriaNome"));
                subcategoria.setCategoria(categoria);
            }
            stm.close();
            con.desconectar();
        } catch (SQLException ex) {
            Logger.getLogger(CategoriaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return subcategoria;
    }
}

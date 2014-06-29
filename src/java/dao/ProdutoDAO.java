package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Marca;
import model.Produto;
import model.SubCategoria;

public class ProdutoDAO {
    Conexao con;
    PreparedStatement stm;
    ResultSet rs;
    
    public ProdutoDAO(){
         con = new Conexao();
    }
       
<<<<<<< HEAD
    public void inserir(Produto p){
        String sql = "INSERT INTO produto VALUES(default,?, ?, ?, ?)";
        try {
            stm = con.conectar().prepareStatement(sql);
            stm.setString(1, p.getNome());
            stm.setDouble(2, p.getPreco());
            stm.setInt(3, p.getMarca().getId());
            stm.setInt(4, p.getSubcategoria().getId());
            stm.executeQuery();
            stm.close();
            con.desconectar();
        } catch (SQLException ex) {
            
        }        
    }
    
    public void alterarNome (Produto pro, int id){
        String sql = "UPDATE tipo SET nome=? where id=?";
        try {
            stm = con.conectar().prepareStatement(sql);
            stm.setString(1, pro.getNome());
            stm.setInt(2, pro.getId());
            stm.executeQuery();
            stm.close();
            con.desconectar();
        } catch (SQLException ex) {
            
        }
    }
    public void alterarPreco (Produto pro, int id){
        String sql = "UPDATE tipo SET preco=? where id=?";
        try {
            stm = con.conectar().prepareStatement(sql);
            stm.setDouble(1, pro.getPreco());
            stm.setInt(2, pro.getId());
            stm.executeQuery();
            stm.close();
            con.desconectar();
        } catch (SQLException ex) {
            
        }
    }
    public void alterarStatus (int status, int id){
        String sql = "UPDATE tipo SET status=? where id=?";
        try {
            stm = con.conectar().prepareStatement(sql);
            stm.setInt(1, status);
            stm.setInt(2, id);
            stm.executeQuery();
            stm.close();
            con.desconectar();
        } catch (SQLException ex) {
            
        }
    }
    public void alterarMarca (int marca, int id){
        String sql = "UPDATE tipo SET marca=? where id=?";
        try {
            stm = con.conectar().prepareStatement(sql);
            stm.setInt(1, marca);
            stm.setInt(2, id);
            stm.executeQuery();
            stm.close();
            con.desconectar();
        } catch (SQLException ex) {
            
        }
    }
    public void alterarSubCategoria (int subcategoria, int id){
        String sql = "UPDATE tipo SET subcategoria=? where id=?";
        try {
            stm = con.conectar().prepareStatement(sql);
            stm.setInt(1, subcategoria);
            stm.setInt(2, id);
            stm.executeQuery();
            stm.close();
            con.desconectar();
        } catch (SQLException ex) {
            
        }
    }
    public Produto consultar( int id) {
        Produto produto = new Produto();
        String sql = "SELECT produto.*, marca.id as idMarca, marca.nome as nomeMarca, subcategoria.id as idSubcategoria, subcategoria.nome as nomeSub FROM marca join produto on (marca.id = produto.marca) join subcategoria  on (produto.subcategoria = subcategoria.id) where produto.id=?";
        try {
            stm = con.conectar().prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){    //move o curso de registros
                Marca marca = new Marca();
                SubCategoria subcategoria = new SubCategoria();
                
                produto.setId(rs.getInt("id"));
                produto.setNome(rs.getString("nome"));
                produto.setPreco(rs.getDouble("preco"));
                marca.setId(rs.getInt("idMarca"));
                marca.setNome(rs.getString("nomeMarca"));
                produto.setMarca(marca);
                subcategoria.setId(rs.getInt("idSubcategoria"));
                subcategoria.setNome(rs.getString("nomeSub"));
                produto.setSubcategoria(subcategoria);
                produto.setStatus(rs.getInt("status"));
            }
            stm.close();
            con.desconectar();
        } catch (SQLException ex) {
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return produto;
    }
    public ArrayList<Produto> listarSubcategoria( int sub) {
        ArrayList<Produto> lista = new ArrayList();
        String sql = "SELECT produto.*, marca.id as idMarca, marca.nome as nomeMarca, subcategoria.id as idSubcategoria, subcategoria.nome as nomeSub FROM marca join produto on (marca.id = produto.marca) join subcategoria on (produto.subcategoria = subcategoria.id) where subcategoria=?";
        
        try {
            stm = con.conectar().prepareStatement(sql);
            stm.setInt(1, sub);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){    //move o curso de registros
                Produto produto = new Produto();
                Marca marca = new Marca();
                SubCategoria subcategoria = new SubCategoria();
                
                produto.setId(rs.getInt("id"));
                produto.setNome(rs.getString("nome"));
                produto.setPreco(rs.getDouble("preco"));
                marca.setId(rs.getInt("idMarca"));
                marca.setNome(rs.getString("nomeMarca"));
                produto.setMarca(marca);
                subcategoria.setId(rs.getInt("idSubcategoria"));
                subcategoria.setNome(rs.getString("nomeSub"));
                produto.setSubcategoria(subcategoria);
                produto.setStatus(rs.getInt("status"));
                lista.add(produto);
            }
            stm.close();
            con.desconectar();
        } catch (SQLException ex) {
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    //Terminar - Retorna uma descricao
    public ArrayList<Produto> listarDescricao(int des) {
        ArrayList<Produto> lista = new ArrayList();
        String sql = "select produto.nome,tipo.nome,descricaoproduto.valor from descricaoproduto join tipo on descricaoproduto.descricao = tipo.id join produto on descricaoproduto.produto = produto.id where produto.id=? order by tipo.nome asc;";
        
        try {
            stm = con.conectar().prepareStatement(sql);
            stm.setInt(1, des);
=======
    public int inserir(Produto p){
        String sql = "INSERT INTO produto VALUES(default,?, ?, ?, ?)";
        try {
            stm = con.conectar().prepareStatement(sql);
            stm.setString(1, p.getNome());
            stm.setDouble(2, p.getPreco());
            stm.setInt(3, p.getMarca().getId());
            stm.setInt(4, p.getSubcategoria().getId());
            int id = stm.executeUpdate();
            if(id == 0){
                return -1;
            } else{
                stm.close();
                con.desconectar();
                return id;
            }
        } catch (SQLException ex) {
            System.out.println("Erro inserir produto: " + ex.getMessage());
            return -1;
        }        
    }
    
    public boolean alterarNome (Produto pro, int id){
        String sql = "UPDATE produto SET nome=? where id=?";
        try {
            stm = con.conectar().prepareStatement(sql);
            stm.setString(1, pro.getNome());
            stm.setInt(2, pro.getId());
            stm.execute();
            stm.close();
            con.desconectar();
            return true;
        } catch (SQLException ex) {
            return false;
        }
    }
    public boolean alterarPreco (Produto pro, int id){
        String sql = "UPDATE produto SET preco=? where id=?";
        try {
            stm = con.conectar().prepareStatement(sql);
            stm.setDouble(1, pro.getPreco());
            stm.setInt(2, pro.getId());
            stm.executeUpdate();
            stm.close();
            con.desconectar();
            return true;
        } catch (SQLException ex) {
            return false;
        }
    }
    public boolean alterarStatus (int status, int id){
        String sql = "UPDATE produto SET status=? where id=?";
        try {
            stm = con.conectar().prepareStatement(sql);
            stm.setInt(1, status);
            stm.setInt(2, id);
            stm.executeUpdate();
            stm.close();
            con.desconectar();
            return true;
        } catch (SQLException ex) {
            return false;
        }
    }
    public boolean alterarMarca (int marca, int id){
        String sql = "UPDATE produto SET marca=? where id=?";
        try {
            stm = con.conectar().prepareStatement(sql);
            stm.setInt(1, marca);
            stm.setInt(2, id);
            stm.executeUpdate();
            stm.close();
            con.desconectar();
            return true;
        } catch (SQLException ex) {
            return false;
        }
    }
    public boolean alterarSubCategoria (int subcategoria, int id){
        String sql = "UPDATE produto SET subcategoria=? where id=?";
        try {
            stm = con.conectar().prepareStatement(sql);
            stm.setInt(1, subcategoria);
            stm.setInt(2, id);
            stm.execute();
            stm.close();
            con.desconectar();
            return true;
        } catch (SQLException ex) {
            return false;
        }
    }
    public Produto consultar( int id) {
        Produto produto = new Produto();
        String sql = "SELECT produto.*, marca.id as idMarca, marca.nome as nomeMarca, subcategoria.id as idSubcategoria, subcategoria.nome as nomeSub FROM marca join produto on (marca.id = produto.marca) join subcategoria on (produto.subcategoria = subcategoria.id) where produto.id=?";
        try {
            stm = con.conectar().prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){    //move o curso de registros
                Marca marca = new Marca();
                SubCategoria subcategoria = new SubCategoria();
                
                produto.setId(rs.getInt("id"));
                produto.setNome(rs.getString("nome"));
                produto.setPreco(rs.getDouble("preco"));
                marca.setId(rs.getInt("idMarca"));
                marca.setNome(rs.getString("nomeMarca"));
                produto.setMarca(marca);
                subcategoria.setId(rs.getInt("idSubcategoria"));
                subcategoria.setNome(rs.getString("nomeSub"));
                produto.setSubcategoria(subcategoria);
                produto.setStatus(rs.getInt("status"));
            }
            stm.close();
            con.desconectar();
        } catch (SQLException ex) {
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return produto;
    }
    public ArrayList<Produto> listarSubcategoria( int sub) {
        ArrayList<Produto> lista = new ArrayList();
        String sql = "SELECT produto.*, marca.id as idMarca, marca.nome as nomeMarca, subcategoria.id as idSubcategoria, subcategoria.nome as nomeSub FROM marca join produto on (marca.id = produto.marca) join subcategoria on (produto.subcategoria = subcategoria.id) where subcategoria=?";
        
        try {
            stm = con.conectar().prepareStatement(sql);
            stm.setInt(1, sub);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){    //move o curso de registros
                Produto produto = new Produto();
                Marca marca = new Marca();
                SubCategoria subcategoria = new SubCategoria();
                
                produto.setId(rs.getInt("id"));
                produto.setNome(rs.getString("nome"));
                produto.setPreco(rs.getDouble("preco"));
                marca.setId(rs.getInt("idMarca"));
                marca.setNome(rs.getString("nomeMarca"));
                produto.setMarca(marca);
                subcategoria.setId(rs.getInt("idSubcategoria"));
                subcategoria.setNome(rs.getString("nomeSub"));
                produto.setSubcategoria(subcategoria);
                produto.setStatus(rs.getInt("status"));
                lista.add(produto);
            }
            stm.close();
            con.desconectar();
        } catch (SQLException ex) {
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
    public ArrayList<Produto> listarTodos( ) {
        ArrayList<Produto> lista = new ArrayList();
        String sql = "SELECT produto.*, marca.id as idMarca, marca.nome as nomeMarca, subcategoria.id as idSubcategoria, subcategoria.nome as nomeSub FROM marca join produto on (marca.id = produto.marca) join subcategoria on (produto.subcategoria = subcategoria.id) ORDER BY produto.nome ASC";
        
        try {
            stm = con.conectar().prepareStatement(sql);
>>>>>>> origin/master
            ResultSet rs = stm.executeQuery();
            while(rs.next()){    //move o curso de registros
                Produto produto = new Produto();
                Marca marca = new Marca();
                SubCategoria subcategoria = new SubCategoria();
                
                produto.setId(rs.getInt("id"));
                produto.setNome(rs.getString("nome"));
                produto.setPreco(rs.getDouble("preco"));
                marca.setId(rs.getInt("idMarca"));
                marca.setNome(rs.getString("nomeMarca"));
                produto.setMarca(marca);
                subcategoria.setId(rs.getInt("idSubcategoria"));
                subcategoria.setNome(rs.getString("nomeSub"));
                produto.setSubcategoria(subcategoria);
                produto.setStatus(rs.getInt("status"));
                lista.add(produto);
            }
            stm.close();
            con.desconectar();
        } catch (SQLException ex) {
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
}

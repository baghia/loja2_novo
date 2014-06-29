<<<<<<< HEAD
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package dao;

import dao.Conexao;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Cliente;

/**
 *
 * @author Renan Huf Silveira
 */
public class ClienteDAO {
    Conexao con;
    PreparedStatement pstm;
    ResultSet rs;
    
    public ClienteDAO() {
        con = new Conexao();
    }
    
    public Cliente consultar(String usuario, String senha) {
        Cliente c = new Cliente();
        String sql = "SELECT * FROM usuario WHERE username = ? and senha = ? and tipo = 2;";
     
        try {
            pstm = this.con.conectar().prepareStatement(sql);
            pstm.setString(1, usuario);
            pstm.setString(2, senha);
            rs = pstm.executeQuery();
            
            while(rs.next()){    //move o curso de registros
                c.setNome(rs.getString("nome"));
                c.setCpf(rs.getString("cpf"));
                c.setUsuario(rs.getString("username"));
                c.setSenha(rs.getString("senha"));
                c.setRua(rs.getString("rua"));
                c.setBairro(rs.getString("bairro"));
                c.setCidade(rs.getString("cidade"));
                c.setCep(rs.getString("cep"));
                c.setUf(rs.getString("uf"));
                c.setFixo(rs.getString("fixo"));
                c.setCelular(rs.getString("celular"));
                c.setEmail(rs.getString("email"));
                c.setTipo(rs.getInt("tipo"));                
            }
            
            pstm.close();
            con.desconectar();
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return c;
    }
    
    public void inserirCliente(Cliente c){
        String sql = "INSERT INTO usuario VALUES(default, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
        try {
            pstm = con.conectar().prepareStatement(sql);
            pstm.setString(1, c.getNome());
            pstm.setString(2, c.getCpf());
            pstm.setString(3, c.getUsuario());
            pstm.setString(4, c.getSenha());
            pstm.setString(5, c.getRua());
            pstm.setString(6, c.getBairro());
            pstm.setString(7, c.getCidade());
            pstm.setString(8, c.getCep());
            pstm.setString(9, c.getUf());
            pstm.setString(10, c.getFixo());
            pstm.setString(11, c.getCelular());
            pstm.setString(12, c.getEmail());
            pstm.setInt(13, 2);
            pstm.executeQuery();
            pstm.close();
            con.desconectar();
        } catch (SQLException ex) {

        }
    }
    
    public static void main(String[] args) {
        ClienteDAO c = new ClienteDAO();
        System.out.println(c.consultar("renanHS", "renan03").getSenha());
=======
package dao;

import dao.Conexao;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Cliente;

public class ClienteDAO {
    Conexao con;
    PreparedStatement pstm;
    ResultSet rs;
    
    public ClienteDAO() {
        con = new Conexao();
    }
    
    public Cliente consultar(String usuario, String senha) {
        Cliente c = new Cliente();
        String sql = "SELECT * FROM usuario WHERE username = ? and senha = ?";
     
        try {
            pstm = this.con.conectar().prepareStatement(sql);
            pstm.setString(1, usuario);
            pstm.setString(2, senha);
            rs = pstm.executeQuery();
            
            while(rs.next()){    //move o curso de registros
                c.setUsuario(rs.getString("username"));
                c.setSenha(rs.getString("senha"));
            }
            
            pstm.close();
            con.desconectar();
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return c;
>>>>>>> origin/master
    }
}

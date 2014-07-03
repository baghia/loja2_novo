/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Categoria;
import model.Cliente;
import model.Produto;

/**
 *
 * @author Renan Huf Silveira
 */
public class CarrinhoDAO {
    Conexao con;
    PreparedStatement pstm;
    ResultSet rs;
    
    public CarrinhoDAO() {
        con = new Conexao();
    }
    
    public void inserir (int p, int c){
        String sql = "INSERT INTO carrinho VALUES(default, ?, ?);";
        try {
            pstm = con.conectar().prepareStatement(sql);
            pstm.setInt(1, p);
            pstm.setInt(2, c);
            pstm.executeQuery();
            pstm.close();
            con.desconectar();
        } catch (SQLException ex) {
            
        }        
    }
}

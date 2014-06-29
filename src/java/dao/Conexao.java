package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {

    private String usuario = "postgres";
    private String senha = "postgres";
    private String banco = "dbecommerce";
    private String host = "localhost";
    private String porta = "5432";
    private String url = "jdbc:postgresql://" + this.host  + ":" + this.porta + "/" + this.banco;
    Connection conexao = null;

    public Connection conectar() {
        
        try {
            Class.forName("org.postgresql.Driver");
            conexao = DriverManager.getConnection(url, usuario, senha);
            System.out.println("Conexao estabelecida !");
        } catch (SQLException ex) {
            System.out.println("Erro na conexão");
            throw new RuntimeException("Erro na conexão"+ ex.getMessage());
        } catch (ClassNotFoundException ex) {
            System.out.println("Erro no driver");
            throw new RuntimeException();
        }
        catch (Exception ex){
            throw new RuntimeException("Erro : "+ex.getMessage());
        }
        return conexao;
    }
    public void desconectar() throws SQLException{
        conexao.close();
    }
}



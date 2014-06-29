package control;

import dao.CategoriaDAO;
import dao.MarcaDAO;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Categoria;
import model.Marca;
import model.SubCategoria;

public class Teste {
    public static void main(String[] args){
        MarcaDAO r = new MarcaDAO();
        ArrayList<Marca> listaCategoria = r.listar();
            for(int i = 1; i <= listaCategoria.size(); i++){
            Marca cat = listaCategoria.get(i-1);
                System.out.println(cat.getNome());
            }
        
    }
}

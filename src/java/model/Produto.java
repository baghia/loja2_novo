package model;

import java.text.NumberFormat;

public class Produto {
    private int id;
    private String nome;
    private double preco;
    private Marca marca;
    private SubCategoria subcategoria;
    private int status;

    public int getId() {
        return id;
    }
    public String getNome() {
        return nome;
    }
    public double getPreco() {
        return preco;
    }
    public Marca getMarca() {
        return marca;
    }
    public SubCategoria getSubcategoria() {
        return subcategoria;
    }
    public int getStatus() {
        return status;
    }

    public void setId(int id) {
        this.id = id;
    }
    public void setNome(String nome) {
       this.nome = nome;
    }
    public void setPreco(double preco) {
        this.preco = preco;
    }
    public void setMarca(Marca marca) {
        this.marca = marca;
    }
    public void setSubcategoria(SubCategoria subcategoria) {
        this.subcategoria = subcategoria;
    }
    public void setStatus(int status) {
        this.status = status;
    }
    public String formatarPreco(){
        NumberFormat formato = NumberFormat.getCurrencyInstance(); 
        String format = formato.format(this.preco);
        return format;
    }
}

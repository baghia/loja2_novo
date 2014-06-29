package model;

public class Imagem {
    private int id;
    private String caminho;
    private Produto produto;
    private String descricao;

    public int getId() {
        return id;
    }
    public String getCaminho() {
        return caminho;
    }
    public Produto getProduto() {
        return produto;
    }
    public String getDescricao() {
        return descricao;
    }

    public void setId(int id) {
        this.id = id;
    }
    public void setCaminho(String caminho) {
        this.caminho = caminho;
    }
    public void setProduto(Produto produto) {
        this.produto = produto;
    }
    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }
}

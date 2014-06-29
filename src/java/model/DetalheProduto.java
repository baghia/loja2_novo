package model;
public class DetalheProduto {
    private Produto produto;
    private Categoria descricao;
    private String valor;

    public Produto getProduto() {
        return produto;
    }
    public Categoria getDescricao() {
        return descricao;
    }
    public String getValor() {
        return valor;
    }

    public void setProduto(Produto produto) {
        this.produto = produto;
    }
    public void setDescricao(Categoria descricao) {
        this.descricao = descricao;
    }
    public void setValor(String valor) {
        this.valor = valor;
    }
}

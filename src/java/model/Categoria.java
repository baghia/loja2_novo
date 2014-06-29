/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

/**
 *
 * @author Renan Huf Silveira
 */
public class Categoria {
    private int id;
    private String nome;
    private String descricao;
    private int codDescricao;
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public int getCodDescricao() {
        return codDescricao;
    }

    public void setCodDescricao(int codDescricao) {
        this.codDescricao = codDescricao;
    }
    
    
}

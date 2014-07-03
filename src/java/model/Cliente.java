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
public class Cliente {
    private int id;
    private String nome;
    private String usuario;
    private String senha;
    private String cpf;
    private String rua;
    private String bairro;
    private String cidade;
    private String cep;
    private String uf;
    private String fixo;
    private String celular;
    private String email;
    private int tipo;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public String getNome() {
        return nome;
    }
    public String getUsuario() {
        return usuario;
    }
    public String getSenha() {
        return senha;
    }
    public String getCpf() {
        return cpf;
    }
    public String getRua() {
        return rua;
    }
    public String getBairro() {
        return bairro;
    }
    public String getCidade() {
        return cidade;
    }
    public String getCep() {
        return cep;
    }
    public String getUf() {
        return uf;
    }
    public String getFixo() {
        return fixo;
    }
    public String getCelular() {
        return celular;
    }
    public String getEmail() {
        return email;
    }
    public int getTipo() {
        return tipo;
    }    

    public void setNome(String nome) {
        this.nome = nome;
    }
    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }
    public void setSenha(String senha) {
        this.senha = senha;
    }
    public void setCpf(String cpf) {
        this.cpf = cpf;
    }
    public void setRua(String rua) {
        this.rua = rua;
    }
    public void setBairro(String bairro) {
        this.bairro = bairro;
    }
    public void setCidade(String cidade) {
        this.cidade = cidade;
    }
    public void setCep(String cep) {
        this.cep = cep;
    }
    public void setUf(String uf) {
        this.uf = uf;
    }
    public void setFixo(String fixo) {
        this.fixo = fixo;
    }
    public void setCelular(String celular) {
        this.celular = celular;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public void setTipo(int tipo) {
        this.tipo = tipo;
    }
}
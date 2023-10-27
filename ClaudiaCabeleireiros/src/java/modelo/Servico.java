package modelo;

import lombok.*;

@Getter
@Setter

public class Servico {
    
    private int id;
    private String nome_servico;
    private String descricao;
    private String duracao;
    private double valor;

    public Servico() {
    }

    public Servico(int id, String nome_servico, String descricao, String duracao, double valor) {
        this.id = id;
        this.nome_servico = nome_servico;
        this.descricao = descricao;
        this.duracao = duracao;
        this.valor = valor;
    }
    
    @Override
    public String toString() {
        return getNome_servico();
    }
    
}

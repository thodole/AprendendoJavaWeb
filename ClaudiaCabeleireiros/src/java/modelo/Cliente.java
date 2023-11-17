package modelo;

import lombok.*;

@Getter
@Setter

public class Cliente {
    
    private int id;
    private String nome_cliente;
    private String telefone;

    public Cliente() {
    }

    public Cliente(int id, String nome_cliente, String telefone) {
        this.id = id;
        this.nome_cliente = nome_cliente;
        this.telefone = telefone;
    }

    @Override
    public String toString() {
        return getNome_cliente();
    }
    
    
    
}

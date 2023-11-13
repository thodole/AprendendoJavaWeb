package modelo;

import lombok.*;

@Getter
@Setter

public class ServicoCliente {
    private int id;
    private int idServico;
    private int idCliente;
    private int quantidade;
    private double valor_servico;
    private String status;
    private Servico servico;
    private Usuario usuario;
    

    public ServicoCliente() {
    }

    public ServicoCliente(int id, int idServico, int idCliente, int quantidade, double valor_servico, String status) {
        this.id = id;
        this.idServico = idServico;
        this.idCliente = idCliente;
        this.quantidade = quantidade;
        this.valor_servico = valor_servico;
        this.status = status;
    }
   
}

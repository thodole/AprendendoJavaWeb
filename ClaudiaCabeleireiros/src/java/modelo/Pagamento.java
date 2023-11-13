package modelo;

import lombok.*;

@Getter
@Setter

public class Pagamento {
    
    private int id;
    private int idCliente;
    private double valorTotal;
    private double valorPago;
    private double valorAPagar;
    private Cliente cliente;

    public Pagamento() {
    }

    public Pagamento(int id, int idCliente, double valorTotal, double valorPago, double valorAPagar) {
        this.id = id;
        this.idCliente = idCliente;
        this.valorTotal = valorTotal;
        this.valorPago = valorPago;
        this.valorAPagar = valorAPagar;
    }
    
}

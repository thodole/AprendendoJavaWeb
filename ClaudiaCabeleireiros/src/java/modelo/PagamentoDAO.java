package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class PagamentoDAO extends DataBaseDAO {

    public PagamentoDAO() throws Exception {
    }
    
    public void inserir(Pagamento pagamento) throws Exception {
        PreparedStatement pst;
        String sql = "INSERT INTO pagamento (idCliente,valorTotal,valorPago,valorAPagar) VALUES(?,?,?,?)";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, pagamento.getIdCliente());
        pst.setDouble(2, pagamento.getValorTotal());
        pst.setDouble(3, pagamento.getValorPago());
        pst.setDouble(4, pagamento.getValorAPagar());
        pst.execute();
    }
    
    public ArrayList<Pagamento> listar() throws Exception {
        ArrayList<Pagamento> lista = new ArrayList<Pagamento>();
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM pagamento";
        pst = conn.prepareStatement(sql);
        rs = pst.executeQuery();
        while (rs.next()) {
            ClienteDAO clienteBD = new ClienteDAO();
            Cliente cliente = new Cliente();
            Pagamento pagamentoBD = new Pagamento();
            pagamentoBD.setId(rs.getInt("id"));
            pagamentoBD.setIdCliente(rs.getInt("idCliente"));
            pagamentoBD.setValorTotal(rs.getDouble("valorTotal"));
            pagamentoBD.setValorPago(rs.getDouble("valorPago"));
            pagamentoBD.setValorAPagar(rs.getDouble("valorAPagar"));
            clienteBD.conectar();
            cliente = clienteBD.carregarPorId(pagamentoBD.getIdCliente());
            clienteBD.desconectar();
            pagamentoBD.setCliente(cliente);
            lista.add(pagamentoBD);
        }
        return lista;
    }
    
    public Pagamento carregarPorId(int id) throws Exception {
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM pagamento WHERE idCliente=?";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, id);
        rs = pst.executeQuery();
        Pagamento pagamento = new Pagamento();
        if (rs.next()) {
            pagamento.setId(rs.getInt("id"));
            pagamento.setIdCliente(rs.getInt("idCliente"));
            pagamento.setValorTotal(rs.getDouble("valorTotal"));
            pagamento.setValorPago(rs.getDouble("valorPago"));
            pagamento.setValorAPagar(rs.getDouble("valorAPagar"));
        }
        
        return pagamento;
    }
    
    public void alterar(Pagamento pagamento) throws Exception {
        PreparedStatement pst;
        String sql = "UPDATE pagamento SET valorPago=?,valorAPagar=? WHERE id=?";
        pst = conn.prepareStatement(sql);
        pst.setDouble(1, pagamento.getValorPago());
        pst.setDouble(2, pagamento.getValorAPagar());
        pst.setInt(3, pagamento.getId());
        pst.execute();
    }
    
}

package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ServicoClienteDAO extends DataBaseDAO {

    public ServicoClienteDAO() throws Exception {
    }

    public void inserir(ServicoCliente servicoCliente) throws Exception {
        PreparedStatement pst;
        String sql = "INSERT INTO servico_cliente (idServico,idCliente,quantidade,valor_servico) VALUES(?,?,?,?)";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, servicoCliente.getIdServico());
        pst.setInt(2, servicoCliente.getIdCliente());
        pst.setInt(3, servicoCliente.getQuantidade());
        pst.setDouble(4, servicoCliente.getValor_servico());
        pst.execute();
    }
    
    public ArrayList<ServicoCliente> listar() throws Exception {
        ArrayList<ServicoCliente> lista = new ArrayList<ServicoCliente>();
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM servico_cliente";
        pst = conn.prepareStatement(sql);
        rs = pst.executeQuery();
        while (rs.next()) {
            ServicoDAO servicoDB = new ServicoDAO();
            Servico servico = new Servico();
            ServicoCliente servicoCliente = new ServicoCliente();
            servicoCliente.setId(rs.getInt("id"));
            servicoCliente.setIdServico(rs.getInt("idServico"));
            servicoCliente.setIdCliente(rs.getInt("idCliente"));
            servicoCliente.setQuantidade(rs.getInt("quantidade"));
            servicoCliente.setValor_servico(rs.getDouble("valor_servico"));
            servicoCliente.setStatus(rs.getString("status"));
            servicoDB.conectar();
            servico = servicoDB.carregarPorId(servicoCliente.getIdServico());
            servicoDB.desconectar();
            servicoCliente.setServico(servico);
            lista.add(servicoCliente);
        }
        
        return lista;
    }
    
    public void alterar(ServicoCliente servicoCliente) throws Exception {
        PreparedStatement pst;
        String sql = "UPDATE servico_cliente SET idServico=?,idCliente=?,quantidade=?,valor_servico=? WHERE id=?";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, servicoCliente.getIdServico());
        pst.setInt(2, servicoCliente.getIdCliente());
        pst.setInt(3, servicoCliente.getQuantidade());
        pst.setDouble(4, servicoCliente.getValor_servico());
        pst.setInt(3, servicoCliente.getId());
        pst.execute();
    }
    
    public void excluir(ServicoCliente servicoCliente) throws Exception {
        PreparedStatement pst;
        String sql = "DELETE FROM servico_cliente WHERE id=?";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, servicoCliente.getId());
        pst.execute();
    }
    
    public void excluirTudo(ServicoCliente servicoCliente) throws Exception {
        PreparedStatement pst;
        String sql = "DELETE FROM servico_cliente WHERE idCliente=?";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, servicoCliente.getIdCliente());
        pst.execute();
    }
    
}

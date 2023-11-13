package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ClienteDAO extends DataBaseDAO {

    public ClienteDAO() throws Exception {
    }
    
    public void inserir(Cliente cliente) throws Exception {
        PreparedStatement pst;
        String sql = "INSERT INTO cliente (nome_cliente,telefone) VALUES(?,?)";
        pst = conn.prepareStatement(sql);
        pst.setString(1, cliente.getNome_cliente());
        pst.setString(2, cliente.getTelefone());
        pst.execute();
    }
    
    public ArrayList<Cliente> listar() throws Exception {
        ArrayList<Cliente> lista = new ArrayList<Cliente>();
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM cliente";
        pst = conn.prepareStatement(sql);
        rs = pst.executeQuery();
        while (rs.next()) {
            Cliente cliente = new Cliente();
            cliente.setId(rs.getInt("id"));
            cliente.setNome_cliente(rs.getString("nome_cliente"));
            cliente.setTelefone(rs.getString("telefone"));
            lista.add(cliente);
        }
        
        return lista;
    }
    
    public void excluir(Cliente cliente) throws Exception {
        PreparedStatement pst;
        String sql = "DELETE FROM cliente WHERE id=?";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, cliente.getId());
        pst.execute();
    }
    
    public void alterar(Cliente cliente) throws Exception {
        PreparedStatement pst;
        String sql = "UPDATE cliente SET nome_cliente=?,telefone=? WHERE id=?";
        pst = conn.prepareStatement(sql);
        pst.setString(1, cliente.getNome_cliente());
        pst.setString(2, cliente.getTelefone());
        pst.setInt(3, cliente.getId());
        pst.execute();
    }
    
    public Cliente carregarPorId(int id) throws Exception {
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM cliente WHERE id=?";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, id);
        rs = pst.executeQuery();
        Cliente cliente = new Cliente();
        if (rs.next()) {
            cliente.setId(rs.getInt("id"));
            cliente.setNome_cliente(rs.getString("nome_cliente"));
            cliente.setTelefone(rs.getString("telefone"));
        }
        
        return cliente;
    }
    
}

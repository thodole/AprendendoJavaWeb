package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ServicoDAO extends DataBaseDAO {

    public ServicoDAO() throws Exception {
    }
    
    public void inserir(Servico servico) throws Exception {
        PreparedStatement pst;
        String sql = "INSERT INTO servico (nome_servico,descricao,duracao,valor) VALUES(?,?,?,?)";
        pst = conn.prepareStatement(sql);
        pst.setString(1, servico.getNome_servico());
        pst.setString(2, servico.getDescricao());
        pst.setString(3, servico.getDuracao());
        pst.setDouble(4, servico.getValor());
        pst.execute();
    }
    
    public ArrayList<Servico> listar() throws Exception {
        ArrayList<Servico> lista = new ArrayList<Servico>();
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM servico";
        pst = conn.prepareStatement(sql);
        rs = pst.executeQuery();
        while (rs.next()) {
            Servico servicoBD = new Servico();
            servicoBD.setId(rs.getInt("id"));
            servicoBD.setNome_servico(rs.getString("nome_servico"));
            servicoBD.setDescricao(rs.getString("descricao"));
            servicoBD.setDuracao(rs.getString("duracao"));
            servicoBD.setValor(rs.getDouble("valor"));
            lista.add(servicoBD);
        }
        return lista;
    }
    
    public void alterar(Servico servico) throws Exception {
        PreparedStatement pst;
        String sql = "UPDATE servico SET nome_servico=?,descricao=?,duracao=?,valor=? WHERE id=?";
        pst = conn.prepareStatement(sql);
        pst.setString(1, servico.getNome_servico());
        pst.setString(2, servico.getDescricao());
        pst.setString(3, servico.getDuracao());
        pst.setDouble(4, servico.getValor());
        pst.setInt(5, servico.getId());
        pst.execute();
    }
    
    public void excluir(Servico servico) throws Exception {
        PreparedStatement pst;
        String sql = "DELETE FROM servico WHERE id=?";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, servico.getId());
        pst.execute();
    }
    
    public Servico carregarPorId(int id) throws Exception {
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM servico WHERE id=?";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, id);
        rs = pst.executeQuery();
        Servico servico = new Servico();
        if (rs.next()) {
            servico.setId(rs.getInt("id"));
            servico.setNome_servico(rs.getString("nome_servico"));
            servico.setDescricao(rs.getString("descricao"));
            servico.setDuracao(rs.getString("duracao"));
            servico.setValor(rs.getDouble("valor"));
        }
        
        return servico;
    }
    
}

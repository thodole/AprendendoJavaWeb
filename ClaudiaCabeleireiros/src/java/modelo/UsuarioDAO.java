package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class UsuarioDAO extends DataBaseDAO {

    public UsuarioDAO() throws Exception {
    }

    public void inserir(Usuario usuario) throws Exception {
        PreparedStatement pst;
        String sql = "INSERT INTO usuario (idPerfil,nome_usuario,telefone,login,senha) VALUES(?,?,?,?,?)";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, usuario.getIdPerfil());
        pst.setString(2, usuario.getNome_usuario());
        pst.setString(3, usuario.getTelefone());
        pst.setString(4, usuario.getLogin());
        pst.setString(5, usuario.getSenha());
        pst.execute();
    }
    
    public Usuario logar(String login, String senha) throws Exception {
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM usuario WHERE login=?";
        pst = conn.prepareStatement(sql);
        pst.setString(1, login);

        rs = pst.executeQuery();
        Usuario usuario = new Usuario();
        if (rs.next()) {
            if (senha.equals(rs.getString("senha"))) {
                
                usuario.setId(rs.getInt("id"));
                usuario.setIdPerfil(rs.getInt("idPerfil"));
                usuario.setLogin(rs.getString("login"));
                usuario.setNome_usuario(rs.getString("nome_usuario"));
                usuario.setSenha(rs.getString("senha"));
                
                PerfilDAO perfilBD = new PerfilDAO();
                perfilBD.conectar();
                Perfil perfil = perfilBD.carregarPorId(usuario.getIdPerfil());
                perfilBD.desconectar();
                
                usuario.setPerfil(perfil);
            }
        }
        
        return usuario;
    }   
    
    public ArrayList<Usuario> listar() throws Exception {
        ArrayList<Usuario> lista = new ArrayList<Usuario>();
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM usuario";
        pst = conn.prepareStatement(sql);
        rs = pst.executeQuery();
        while (rs.next()) {
            Usuario usuario = new Usuario();
            PerfilDAO perfilBD = new PerfilDAO();
            Perfil perfil = new Perfil();
            usuario.setId(rs.getInt("id"));
            usuario.setNome_usuario(rs.getString("nome_usuario"));
            usuario.setTelefone(rs.getString("telefone"));
            usuario.setLogin(rs.getString("login"));
            usuario.setSenha(rs.getString("senha"));
            usuario.setIdPerfil(rs.getInt("idPerfil"));
            perfilBD.conectar();
            perfil = perfilBD.carregarPorId(usuario.getIdPerfil());
            perfilBD.desconectar();
            usuario.setPerfil(perfil);
            lista.add(usuario);
        }
        
        return lista;
    }
    
    public void excluir(Usuario usuario) throws Exception {
        PreparedStatement pst;
        String sql = "DELETE FROM usuario WHERE id=?";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, usuario.getId());
        pst.execute();
    }
    
    public void alterar(Usuario usuario) throws Exception {
        PreparedStatement pst;
        String sql = "UPDATE usuario SET idPerfil=?,nome_usuario=?,telefone=?,login=?,senha=? WHERE id=?";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, usuario.getIdPerfil());
        pst.setString(2, usuario.getNome_usuario());
        pst.setString(3, usuario.getTelefone());
        pst.setString(4, usuario.getLogin());
        pst.setString(5, usuario.getSenha());
        pst.setInt(6, usuario.getId());
        pst.execute();
    }
    
    public Usuario carregarPorId(int id) throws Exception {
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM usuario WHERE id=?";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, id);
        rs = pst.executeQuery();
        Usuario usuario = new Usuario();
        if (rs.next()) {
            usuario.setId(rs.getInt("id"));
            usuario.setIdPerfil(rs.getInt("idPerfil"));
            usuario.setNome_usuario(rs.getString("nome_usuario"));
            usuario.setTelefone(rs.getString("telefone"));
            usuario.setLogin(rs.getString("login"));
            usuario.setSenha(rs.getString("senha"));
            PerfilDAO perfilBD = new PerfilDAO();
            Perfil perfil = new Perfil();
            perfilBD.conectar();
            perfil = perfilBD.carregarPorId(usuario.getIdPerfil());
            perfilBD.desconectar();
            usuario.setPerfil(perfil);
        }
        
        return usuario;
    }
    
    public ArrayList<Servico> servicosVinculados(int idUsuario) throws Exception {
        ArrayList<Servico> lista = new ArrayList<Servico>();
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM servico WHERE id IN(SELECT idServico FROM servico_cliente WHERE idUsuario=?)";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, idUsuario);
        rs = pst.executeQuery();
        while (rs.next()) {
            Servico servico = new Servico();
            servico.setId(rs.getInt("id"));
            servico.setNome_servico(rs.getString("nome_servico"));
            servico.setDuracao(rs.getString("duracao"));
            servico.setValor(rs.getDouble("valor"));
            lista.add(servico);
        }

        return lista;
    }
    
    public ArrayList<Servico> servicosDesvinculados(int idUsuario) throws Exception {
        ArrayList<Servico> lista = new ArrayList<Servico>();
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM servico WHERE id NOT IN(SELECT idServico FROM servico_cliente WHERE idUsuario=?)";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, idUsuario);
        rs = pst.executeQuery();
        while (rs.next()) {
            Servico servico = new Servico();
            servico.setId(rs.getInt("id"));
            servico.setNome_servico(rs.getString("nome_servico"));
            servico.setDuracao(rs.getString("duracao"));
            servico.setValor(rs.getDouble("valor"));
            lista.add(servico);
        }

        return lista;
    }

    public void vincularServico(int idServico, int idUsuario) throws Exception {
        PreparedStatement pst;
        String sql = "INSERT INTO servico_cliente (idServico, idUsuario) VALUES(?,?)";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, idServico);
        pst.setInt(2, idUsuario);
        pst.execute();
    }

    public void desvincularServico(int idServico, int idUsuario) throws Exception {
        PreparedStatement pst;
        String sql = "DELETE FROM servico_cliente WHERE idServico=? AND idUsuario=?";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, idServico);
        pst.setInt(2, idUsuario);
        pst.execute();
    }
    
}

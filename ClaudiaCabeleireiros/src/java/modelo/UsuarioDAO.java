package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import org.mindrot.jbcrypt.BCrypt;

public class UsuarioDAO extends DataBaseDAO {

    public UsuarioDAO() throws Exception {
    }

    public void inserir(Usuario usuario) throws Exception {
        PreparedStatement pst;
        String sql = "INSERT INTO usuario (idPerfil,nome_usuario,login,senha) VALUES(?,?,?,?)";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, usuario.getIdPerfil());
        pst.setString(2, usuario.getNome_usuario());
        pst.setString(3, usuario.getLogin());
        pst.setString(4, usuario.getSenha());
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
            if (BCrypt.checkpw(senha, rs.getString("senha"))) {
                
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
    
}

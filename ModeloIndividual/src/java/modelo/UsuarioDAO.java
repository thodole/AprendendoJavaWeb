package modelo;

import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class UsuarioDAO extends DataBaseDAO {

    public UsuarioDAO() throws Exception {
    }

     public void inserir(Usuario usuario) throws Exception {
        PreparedStatement pst;
        String sql = "INSERT INTO usuario (id_perfil,nome,login,senha) VALUES(?,?,?,?)";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, usuario.getId_perfil());
        pst.setString(2, usuario.getNome());
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
        Usuario u = new Usuario();
        if (rs.next()) {
            if (senha.equals(rs.getString("senha"))) {
                
                u.setId(rs.getInt("id"));
                u.setId_perfil(rs.getInt("id_perfil"));
                u.setLogin(rs.getString("login"));
                u.setNome(rs.getString("nome"));
                u.setSenha(rs.getString("senha"));
            }
        }
        return u;
    }
    
    public ArrayList<Usuario> listar() throws Exception {
        ArrayList<Usuario> lista = new ArrayList<Usuario>();
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM usuario";
        pst = conn.prepareStatement(sql);
        rs = pst.executeQuery();
        while (rs.next()) {
            Usuario u = new Usuario();
            u.setId(rs.getInt("id"));
            u.setNome(rs.getString("nome"));
            u.setLogin(rs.getString("login"));
            u.setSenha(rs.getString("senha"));
            u.setId_perfil(rs.getInt("id_perfil"));
            lista.add(u);
        }

        return lista;
    }
    public void excluir(Usuario usuario) throws Exception {
        Statement stm;
        stm = conn.createStatement();
        String sql = "DELETE FROM usuario WHERE id=" + usuario.getId();
        stm.execute(sql);
    }
    
        public void alterar(Usuario usuario) throws Exception {
        PreparedStatement pst;
        String sql = "UPDATE usuario SET id_perfil=?,nome=?,login=?,senha=? WHERE id=?";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, usuario.getId_perfil());
        pst.setString(2, usuario.getNome());
        pst.setString(3, usuario.getLogin());
        pst.setString(4, usuario.getSenha());
        pst.setInt(5, usuario.getId());
        pst.execute();
    }
     public Usuario carregarPorId(int id) throws Exception {
        Statement stm;
        ResultSet rs;
        Usuario usuario = new Usuario();
        stm = conn.createStatement();
        String sql = "SELECT * FROM usuario WHERE id=" + id;
        rs = stm.executeQuery(sql);
        if (rs.next()) {
            usuario.setId(rs.getInt("id"));
            usuario.setId_perfil(rs.getInt("id_perfil"));
            usuario.setNome(rs.getString("nome"));
            usuario.setLogin(rs.getString("login"));
            usuario.setSenha(rs.getString("senha"));
        }
        return usuario;
    }
 }

package modelo;

import java.sql.PreparedStatement;
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
    
}
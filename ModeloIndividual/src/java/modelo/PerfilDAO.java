package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class PerfilDAO extends DataBaseDAO {

    public PerfilDAO() throws Exception {
    }

     public void inserir(Perfil perfil) throws Exception {
        PreparedStatement pst;
        String sql = "INSERT INTO perfil (perfil) VALUES(?)";
        pst = conn.prepareStatement(sql);
        pst.setString(1, perfil.getPerfil());
        pst.execute();
    }
     
     public ArrayList<Perfil> listar() throws Exception {
        ArrayList<Perfil> lista = new ArrayList<Perfil>();
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM perfil";
        pst = conn.prepareStatement(sql);
        rs = pst.executeQuery();
        while (rs.next()) {
            Perfil p = new Perfil();
            p.setId(rs.getInt("id"));
            p.setPerfil(rs.getString("perfil"));
            lista.add(p);
        }
        return lista;
    }
     
    public void excluir(Perfil perfil) throws Exception {
        Statement stm;
        stm = conn.createStatement();
        String sql = "DELETE FROM perfil WHERE id=" + perfil.getId();
        stm.execute(sql);
    }

}

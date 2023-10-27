package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class PerfilDAO extends DataBaseDAO {
    
    public PerfilDAO() throws Exception {
    }
    
    public void inserir(Perfil perfil) throws Exception {
        PreparedStatement pst;
        String sql = "INSERT INTO perfil (nome_perfil) VALUES(?)";
        pst = conn.prepareStatement(sql);
        pst.setString(1, perfil.getNome_perfil());
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
            Perfil perfil = new Perfil();
            perfil.setId(rs.getInt("id"));
            perfil.setNome_perfil(rs.getString("nome_perfil"));
            lista.add(perfil);
        }
        
        return lista;
    }
    
    public void excluir(Perfil perfil) throws Exception {
        PreparedStatement pst;
        String sql = "DELETE FROM perfil WHERE id=?";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, perfil.getId());
        pst.execute();
    }
    
    public Perfil carregarPorId(int id) throws Exception {
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM perfil WHERE id=?";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, id);
        rs = pst.executeQuery();
        Perfil perfil = new Perfil();
        if (rs.next()) {
            perfil.setId(rs.getInt("id"));
            perfil.setNome_perfil(rs.getString("nome_perfil"));
        }
        
        return perfil;
    }
    
    public void alterar(Perfil perfil) throws Exception {
        PreparedStatement pst;
        String sql = "UPDATE perfil SET nome_perfil=? WHERE id=?";
        pst = conn.prepareStatement(sql);
        pst.setString(1, perfil.getNome_perfil());
        pst.setInt(2, perfil.getId());
        pst.execute();
    }
    
    public ArrayList<Menu> menusVinculados(int idPerfil) throws Exception {
        ArrayList<Menu> lista = new ArrayList<Menu>();
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM menu WHERE id IN(SELECT idMenu FROM perfil_menu WHERE idPerfil=?)";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, idPerfil);
        rs = pst.executeQuery();
        while (rs.next()) {
            Menu menu = new Menu();
            menu.setId(rs.getInt("id"));
            menu.setNome_menu(rs.getString("nome_menu"));
            menu.setLink(rs.getString("link"));
            lista.add(menu);
        }

        return lista;
    }
    
    public ArrayList<Menu> menusDesvinculados(int idPerfil) throws Exception {
        ArrayList<Menu> lista = new ArrayList<Menu>();
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM menu WHERE id NOT IN(SELECT idMenu FROM perfil_menu WHERE idPerfil=?)";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, idPerfil);
        rs = pst.executeQuery();
        while (rs.next()) {
            Menu menu = new Menu();
            menu.setId(rs.getInt("id"));
            menu.setNome_menu(rs.getString("nome_menu"));
            menu.setLink(rs.getString("link"));
            lista.add(menu);
        }

        return lista;
    }

    public void vincularMenu(int idMenu, int idPerfil) throws Exception {
        PreparedStatement pst;
        String sql = "INSERT INTO perfil_menu (idMenu, idPerfil) VALUES(?,?)";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, idMenu);
        pst.setInt(2, idPerfil);
        pst.execute();
    }

    public void desvincularMenu(int idMenu, int idPerfil) throws Exception {
        PreparedStatement pst;
        String sql = "DELETE FROM perfil_menu WHERE idMenu=? AND idPerfil=?";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, idMenu);
        pst.setInt(2, idPerfil);
        pst.execute();
    }
    
}

package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MenuDAO extends DataBaseDAO {
    
    public MenuDAO() throws Exception {
    }
    
    public void inserir(Menu menu) throws Exception {
        PreparedStatement pst;
        String sql = "INSERT INTO menu (nome_menu, link) VALUES(?,?)";
        pst = conn.prepareStatement(sql);
        pst.setString(1, menu.getNome_menu());
        pst.setString(2, menu.getLink());
        pst.execute();
    }
    
    public ArrayList<Menu> listar() throws Exception {
        ArrayList<Menu> lista = new ArrayList<Menu>();
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM menu";
        pst = conn.prepareStatement(sql);
        rs = pst.executeQuery();
        while (rs.next()) {
            Menu menuBD = new Menu();
            menuBD.setId(rs.getInt("id"));
            menuBD.setNome_menu(rs.getString("nome_menu"));
            menuBD.setLink(rs.getString("link"));
            lista.add(menuBD);
        }
        return lista;
    }
    
    public void alterar(Menu menu) throws Exception {
        PreparedStatement pst;
        String sql = "UPDATE menu SET nome_menu=?,link=? WHERE id=?";
        pst = conn.prepareStatement(sql);
        pst.setString(1, menu.getNome_menu());
        pst.setString(2, menu.getLink());
        pst.setInt(3, menu.getId());
        pst.execute();
    }
    
    public void excluir(Menu menu) throws Exception {
        PreparedStatement pst;
        String sql = "DELETE FROM menu WHERE id=?";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, menu.getId());
        pst.execute();
    }
    
    public Menu carregarPorId(int id) throws Exception {
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM menu WHERE id=?";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, id);
        rs = pst.executeQuery();
        Menu menu = new Menu();
        if (rs.next()) {
            menu.setId(rs.getInt("id"));
            menu.setNome_menu(rs.getString("nome_menu"));
            menu.setLink(rs.getString("link"));
        }
        
        return menu;
    }
    
}

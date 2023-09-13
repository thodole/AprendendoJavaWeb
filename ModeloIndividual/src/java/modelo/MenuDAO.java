package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MenuDAO extends DataBaseDAO {

    public MenuDAO() throws Exception {
    }

     public void inserir(Menu menu) throws Exception {
        PreparedStatement pst;
        String sql = "INSERT INTO menu (menu,link) VALUES(?,?)";
        pst = conn.prepareStatement(sql);
        pst.setString(1, menu.getMenu());
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
            Menu m = new Menu();
            m.setId(rs.getInt("id"));
            m.setMenu(rs.getString("menu"));
            m.setLink(rs.getString("link"));
            lista.add(m);
        }
        return lista;
    }
     
}

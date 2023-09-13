package modelo;

public class Menu {
    private int id;
    private String menu;
    private String link;
//    private Perfil perfil;

    public Menu() {
    }

    public Menu(String menu, String link) {
        this.menu = menu;
        this.link = link;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getMenu() {
        return menu;
    }

    public void setMenu(String menu) {
        this.menu = menu;
    }

  /*  public Perfil getPerfil() {
        return perfil;
    }

    public void setPerfil(Perfil perfil) {
        this.perfil = perfil;
    }
*/

}

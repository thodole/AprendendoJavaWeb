package modelo;

import lombok.*;

@Getter
@Setter

public class Menu {
    
    private int id;
    private String nome_menu;
    private String link;

    public Menu() {
    }
    
    public Menu(int id, String nome_menu, String link) {
        this.id = id;
        this.nome_menu = nome_menu;
        this.link = link;
    }
    
}

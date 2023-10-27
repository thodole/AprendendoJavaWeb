package modelo;

import java.util.ArrayList;
import lombok.*;

@Getter
@Setter

public class Perfil {
    private int id;
    private String nome_perfil;
    ArrayList<Menu> listaVinculados;

    public Perfil() {
    }
    
    public Perfil(int id, String nome_perfil) {
        this.id = id;
        this.nome_perfil = nome_perfil;
    }
    
    @Override
    public String toString() {
        return getNome_perfil();
    }
    
}

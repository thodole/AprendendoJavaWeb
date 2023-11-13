package modelo;

import java.util.ArrayList;
import lombok.*;

@Getter
@Setter

public class Usuario {
    private int id;
    private String nome_usuario;
    private String telefone;
    private String login;
    private String senha;
    private int idPerfil;
    private Perfil perfil;
    ArrayList<Servico> listaVinculados;

    public Usuario() {
    }
    
    public Usuario(int id, String nome_usuario, String telefone, String login, String senha, int idPerfil) {
        this.id = id;
        this.nome_usuario = nome_usuario;
        this.telefone = telefone;
        this.login = login;
        this.senha = senha;
        this.idPerfil = idPerfil;
    }
        
}

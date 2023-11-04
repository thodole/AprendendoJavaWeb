package modelo;

import lombok.*;

@Getter
@Setter

public class Usuario {
    private int id;
    private String nome_usuario;
    private String login;
    private String senha;
    private int idPerfil;
    private Perfil perfil;
    
    public Usuario() {
    }
    
    public Usuario(int id, String nome_usuario, String login, String senha, int idPerfil) {
        this.id = id;
        this.nome_usuario = nome_usuario;
        this.login = login;
        this.senha = senha;
        this.idPerfil = idPerfil;
    }
        
}

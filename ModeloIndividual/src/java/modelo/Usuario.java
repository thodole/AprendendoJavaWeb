package modelo;

public class Usuario {
    private int id;
    private String nome;
    private String login;
    private String senha;
    private int id_perfil;
    private Perfil perfil;

    public Usuario() {
    }

    public Usuario(String nome, String login, String senha, int id_perfil) {
        this.nome = nome;
        this.login = login;
        this.senha = senha;
        this.id_perfil = id_perfil;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_perfil() {
        return id_perfil;
    }

    public void setId_perfil(int id_perfil) {
        this.id_perfil = id_perfil;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

  /*  public Perfil getPerfil() {
        return perfil;
    }

    public void setPerfil(Perfil perfil) {
        this.perfil = perfil;
    }
*/
    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

}

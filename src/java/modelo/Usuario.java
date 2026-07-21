package modelo;

public class Usuario {

    //Atributos
    private int UsuarioId;
    private String Nombre;
    private String Correo;
    private String Clave;
    private int RolId;

    //Constructor vacío
    public Usuario() {

    }

    //Getters and Setters
    public int getUsuarioId() {
        return UsuarioId;
    }

    public String getNombre() {
        return Nombre;
    }

    public String getCorreo() {
        return Correo;
    }

    public String getClave() {
        return Clave;
    }

    public int getRolId() {
        return RolId;
    }

    public void setUsuarioId(int UsuarioId) {
        this.UsuarioId = UsuarioId;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public void setCorreo(String Correo) {
        this.Correo = Correo;
    }

    public void setClave(String Clave) {
        this.Clave = Clave;
    }

    public void setRolId(int RolId) {
        this.RolId = RolId;
    }

}

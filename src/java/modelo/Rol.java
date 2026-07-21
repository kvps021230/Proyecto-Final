package modelo;

public class Rol {

    //Atributos
    private int RolId;
    private String Nombre;

    //Constructor vacío
    public Rol() {

    }

    //Getters and Setters
    public int getRolId() {
        return RolId;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setRolId(int rolId) {
        this.RolId = rolId;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

}

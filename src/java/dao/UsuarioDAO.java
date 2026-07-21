package dao;

import conexion.Database;
import java.sql.*;
import modelo.Usuario;

public class UsuarioDAO {

//Registrar un nuevo usuario
    public boolean registrarUsuario(Usuario usuario) {

        try {
            Database db = new Database();
            Connection conn = db.getConnection();

            //Variable sql para guardar comando
            String sql = "INSERT INTO usuarios (nombre, correo, clave, rolId) VALUES (?,?,?,?)";

            PreparedStatement pstat = conn.prepareStatement(sql);

            pstat.setString(1, usuario.getNombre());
            pstat.setString(2, usuario.getCorreo());
            pstat.setString(3, usuario.getClave());
            pstat.setInt(4, usuario.getRolId());

            int filasTotales = pstat.executeUpdate();

            return filasTotales > 0;

        } catch (SQLException e) {
            System.out.println("Error al registrar usuario: " + e.getMessage());
            return false;
        }

    }

    //Metodo para validar el inicio de sesión
    public Usuario validarLogin(Usuario usuario) {

        try {
            Database db = new Database();
            Connection conn = db.getConnection();

            String sql = "SELECT * FROM usuarios u "
                    + "LEFT JOIN roles r "
                    + "ON u.rolId = r.rolId "
                    + "WHERE u.correo = ? AND u.clave = ?";

            PreparedStatement pstat = conn.prepareStatement(sql);

            pstat.setString(1, usuario.getCorreo());
            pstat.setString(2, usuario.getClave());

            ResultSet rs = pstat.executeQuery();

            if (rs.next()) {
                usuario.setUsuarioId(rs.getInt("usuarioId"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setCorreo(rs.getString("correo"));
                usuario.setClave(rs.getString("clave"));
                usuario.setRolId(rs.getInt("rolId"));

                return usuario;
            }
            return null;
        } catch (SQLException ex) {
            System.out.println("Error al validar usuario: " + ex.getMessage());
            return null;
        }

    }
    
    //Metodo para validar sin un correo existe para evitar duplicados en la base de datos
    public boolean correoExiste(String correo){
        
        try{
            Database db = new Database();
            Connection conn = db.getConnection();
            
            String sql = "SELECT usuarioId FROM usuarios WHERE correo =?";
            
            PreparedStatement pstat = conn.prepareStatement(sql);
            
            pstat.setString(1, correo);
            
            ResultSet rs = pstat.executeQuery();
            
            return rs.next();
            
        }catch (SQLException e){
            System.out.println("Error al verificar correo: " + e.getMessage());
            return false;
        }
        
    }
}

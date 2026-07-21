/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import dao.UsuarioDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modelo.Usuario;

/**
 *
 * @author Adrian
 */
@WebServlet(name = "RegistroServlet", urlPatterns = {"/RegistroServlet"})
public class RegistroServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String nombre = request.getParameter("nombre");
        String correo = request.getParameter("correo");
        String clave = request.getParameter("clave");

        UsuarioDAO dao = new UsuarioDAO();
        //Llamamos nuestro metodo para saber si existe el correo 
        if (dao.correoExiste(correo)) {
            response.sendRedirect(request.getContextPath()
                    + "/vistas/registro.jsp?error=correoExiste"
            );
            return;
        }

        Usuario usuario = new Usuario();

        usuario.setNombre(nombre);
        usuario.setCorreo(correo);
        usuario.setClave(clave);
        //El usuario tendra el rol 2
        usuario.setRolId(2);

        boolean registrado = dao.registrarUsuario(usuario);

        if (registrado) {
            response.sendRedirect(request.getContextPath() + "/vistas/login.jsp?registro=exitoso"
            );
        } else {
            response.sendRedirect(request.getContextPath() + "/vistas/registro.jsp?error=registro"
            );
        }

    }
}

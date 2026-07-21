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
import jakarta.servlet.http.HttpSession;
import modelo.Usuario;

/**
 *
 * @author Adrian
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //Obtenemos la sesion
        HttpSession session = request.getSession(false);

        if (session != null) {
            session.invalidate();
        }

        response.sendRedirect(request.getContextPath() + "/vistas/Login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Obtenemos la sesion
        HttpSession session = request.getSession(false);

        if (session != null) {
            session.invalidate();
        }

        Usuario usuario = new Usuario();

        usuario.setCorreo(request.getParameter("correo"));
        usuario.setClave(request.getParameter("clave"));

        UsuarioDAO dao = new UsuarioDAO();

        usuario = dao.validarLogin(usuario);

        if (usuario != null) {

            session = request.getSession();
            session.setAttribute("usuarioLogueado", usuario);

            //Validacion para saber si es ADMIN o USUARIO
            if (usuario.getRolId() == 1) {
                response.sendRedirect(request.getContextPath() + "/vistas/admin.jsp");

            } else {
                response.sendRedirect(request.getContextPath() + "/vistas/usuario.jsp");
            }

        } else {
            response.sendRedirect(request.getContextPath() + "/vistas/Login.jsp?error=credenciales");
        }

    }
}

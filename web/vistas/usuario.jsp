<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    //Obtenemos el usuario que inicio sesión
    Usuario usuario = (Usuario) session.getAttribute("usuarioLogueado");

    //Validamos que exista una sesión y que el usuario tenga rol de usuario
    if (usuario == null || usuario.getRolId() != 2) {
        //Redirigimos al login
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
        <title>Panel de usuario</title>
    </head>
    <body class="bg-light">

        <nav class="navbar navbar-dark bg-primary">
            <div class="container">

                <span class="navbar-brand">
                    Sistema de Torneos
                </span>

                <a href="${pageContext.request.contextPath}/LoginServlet"
                   class="btn btn-outline-light"
                   onclick="return confirm('¿Está seguro de que desea cerrar sesión?');">
                    Cerrar sesión
                </a>

            </div>
        </nav>

        <div class="container mt-5">

            <div class="card shadow">

                <div class="card-body p-4">

                    <h1>
                        Bienvenido, <%= usuario.getNombre()%>
                    </h1>

                    <p class="text-muted">
                        Has ingresado como usuario.
                    </p>

                    <hr>

                    <h4>Opciones disponibles</h4>

                    <div class="row mt-4">

                        <div class="col-md-6 mb-3">
                            <div class="card h-100">
                                <div class="card-body">

                                    <h5>Ver torneos</h5>

                                    <p>
                                        Consulta los torneos disponibles.
                                    </p>

                                    <a href="#"
                                       class="btn btn-primary">
                                        Ver torneos
                                    </a>

                                </div>
                            </div>
                        </div>

                        <div class="col-md-6 mb-3">
                            <div class="card h-100">
                                <div class="card-body">

                                    <h5>Mis inscripciones</h5>

                                    <p>
                                        Consulta los torneos en los que estás inscrito.
                                    </p>

                                    <a href="#"
                                       class="btn btn-primary">
                                        Ver inscripciones
                                    </a>

                                </div>
                            </div>
                        </div>

                    </div>

                </div>

            </div>

        </div>

    </body>
</html>

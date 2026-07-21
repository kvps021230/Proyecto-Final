<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
        <title>Registro de usuario</title>
    </head>
    <body class="bg-light">

        <div class="container">

            <div class="row justify-content-center align-items-center min-vh-100">

                <div class="col-md-6 col-lg-5">

                    <div class="card shadow">

                        <div class="card-body p-4">

                            <h2 class="text-center mb-4">
                                Crear cuenta
                            </h2>
                            
                            <!-- Hacemos pequeña validacion para saber si existe el correo -->
                            <% String error = request.getParameter("error"); %>

                            <% if ("correoExiste".equals(error)) { %>

                            <!-- Mensaje de alerta -->
                            <div class="alert alert-warning" role="alert">
                                El correo ingresado ya está registrado.
                            </div>

                            <% } else if ("registro".equals(error)) { %>

                            <div class="alert alert-danger" role="alert">
                                No se pudo registrar el usuario.
                            </div>

                            <% }%>
                            
                            <form action="${pageContext.request.contextPath}/RegistroServlet" method="post">

                                <div class="mb-3">
                                    <label for="nombre" class="form-label">
                                        Nombre
                                    </label>

                                    <input type="text"
                                           class="form-control"
                                           id="nombre"
                                           name="nombre"
                                           placeholder="Ingrese su nombre"
                                           required>
                                </div>

                                <div class="mb-3">
                                    <label for="correo" class="form-label">
                                        Correo electrónico
                                    </label>

                                    <input type="email"
                                           class="form-control"
                                           id="correo"
                                           name="correo"
                                           placeholder="Ingrese su correo"
                                           required>
                                </div>

                                <div class="mb-3">
                                    <label for="clave" class="form-label">
                                        Contraseña
                                    </label>

                                    <input type="password"
                                           class="form-control"
                                           id="clave"
                                           name="clave"
                                           placeholder="Ingrese su contraseña"
                                           required>
                                </div>

                                <div class="d-grid">
                                    <button type="submit"
                                            class="btn btn-success">
                                        Registrarse
                                    </button>
                                </div>

                            </form>

                            <div class="text-center mt-3">

                                <p class="mb-1">
                                    ¿Ya tienes una cuenta?
                                </p>

                                <a href="Login.jsp">
                                    Iniciar sesión
                                </a>

                            </div>

                            <div class="text-center mt-2">

                                <a href="Inicio.jsp"
                                   class="text-secondary">
                                    Volver al inicio
                                </a>

                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </body>
</html>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
        <title>Sistema de Torneos</title>
    </head>
    <body class="bg-light">

        <div class="container">

            <div class="row justify-content-center align-items-center min-vh-100">

                <div class="col-md-6">

                    <div class="card shadow">

                        <div class="card-body text-center p-5">

                            <h1 class="mb-3">
                                Sistema de Torneos
                            </h1>

                            <p class="text-muted mb-4">
                                Regístrate o inicia sesión para continuar.
                            </p>

                            <a href="${pageContext.request.contextPath}/vistas/Login.jsp"
                               class="btn btn-primary me-2">
                                Iniciar sesión
                            </a>

                            <a href="${pageContext.request.contextPath}/vistas/Registro.jsp"
                               class="btn btn-success">
                                Registrarse
                            </a>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </body>
</html>

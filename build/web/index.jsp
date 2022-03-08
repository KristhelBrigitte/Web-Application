<%-- 
    Document   : index
    Created on : 3 mar. 2022, 17:10:24
    Author     : Progra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistema de gestión</title>
        <jsp:include page="WEB-INF/pages/commons/metaData.jsp"/>       
    </head>
    <body>
        <jsp:include page="WEB-INF/pages/commons/menu.jsp"/>

        <main>
            <div class="card text-center">
                <div class="card-header">
                    <h1>Sistema de Gestión Empresarial</h1>
                </div>

                <div class="card-body">
                    <h5 class="card-title">Este será nuestro Landing-Page</h5>
                    <p class="card-text">Ejemplo con JSP</p>
                    <a href="#" class="btn btn-primary">Go somewhere</a>
                </div>

                <div class="card-footer text-muted">
                    Todos los derechos reservados &COPY;Brigitte Rodríguez
                </div>
            </div>
        </main>
    </body>
</html>
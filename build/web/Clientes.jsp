
<%@page import="java.util.List"%>
<%@page import="domain.Client"%>
<%@page import="bussinessLogic.ClientBL"%>
<%@page import="bussinessLogic.ClientBL"%>
<%@page import="bussinessLogic.ClientBL"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <jsp:include page="WEB-INF/pages/commons/metaData.jsp"/>
    </head>
    
    <body>
        <jsp:include page="WEB-INF/pages/commons/menu.jsp"/>
        <tbody>
            <div class="container">
            <div class="card-header">
                <h1>Listado de clientes</h1>
            </div>
            <br>
            
            
            <%if (request.getParameter("msj") != null) {%>
               <div class="alert alert alert-success alert-dismissible fade show" role="alert">
                    <p><%= request.getParameter("msj")%></p>
                   <button type="button" class="close" data-bs-dismiss="alert" aria-label="alert" >&Chi;</button>
                </div>
            <%}
            request.setAttribute("msj","");
            %>
            
            
            <form action="Clientes.jsp" method="post">  
                <div class="input-group">
                    <input type="text" id="txtName" name="txtName" value="" placeholder="Escriba un nombre para filtrar..." class="form-control" />
                    <input type="submit" id="btnFind" name="btnFind" value="Filtrar" class="btn btn-primary" />
                </div>
            </form>
            <br>
            <table class="table table-striped table-secondary">
                <thead >
                    <tr>
                        <th>Código</th>
                        <th>Nombre</th>
                        <th>Teléfono</th>
                        <th>Dirección</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                
          
                    
                    <%
                        String name="";
                        String condition="";
                        if(request.getParameter("txtName")!=null){
                            name=request.getParameter("txtName").toString();
                            condition="name like '%"+name+"%'";
                        
                        }
                        
                    ClientBL logic= new ClientBL();
                    List<Client>list= logic.listAll(condition);
                    for (Client cli:list) { %>
                    <tr>
                        <td><%=cli.getId_client() %></td>
                        <td><%=cli.getName() %></td>
                        <td><%=cli.getPhone() %></td>
                        <td><%=cli.getDirection() %></td>
                        
                        <td>
                           <a href="Cliente.jsp?id=<%= cli.getId_client()%>" > Modificar</a> |
                           <a method="get" href="DeleteClient?id=<%= cli.getId_client()%>" > Eliminar</a>
                        </td>
                    </tr>   
                              
                    <%    
                        }
                    %>
                    
            </table>
                <a href="index.jsp"  class="btn btn-outline-info">Regresar</a>  
                <a href="Cliente.jsp?id=-1"  class="btn btn-outline-success">Agregar</a>        
        </div> 
    </tbody>
    </body>
</html>

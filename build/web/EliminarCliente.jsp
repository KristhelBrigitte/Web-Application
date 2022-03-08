


<%@page import="bussinessLogic.ClientBL"%>
<%@page import="domain.Client"%>
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
        <main>
            <div class="container">
                <div class="row justify-content-md-center">
                    <div class="col-md-6">
                        <div class="card-header bg-danger ">
                            <h4 class="text-white" >Desea eliminar el siguiente cliente?</h4>
                        </div>
                        
                         <%
                            String id=request.getParameter("id");
                            int cod=Integer.parseInt(id);
                            
                            Client client;
                            ClientBL logic= new ClientBL();
                                
                            if(cod>0){
                                client=logic.getOne("id_Client="+ id);
                                id=""+client.getId_client();
                            }else{
                                client=new Client();
                                id="";
                            }
                         %>  
                         
                        <form action="DeleteClient" method="post">
                            <div class="form-group">
                                <label for=txtCod class="control-label">
                                    Código:
                                </label>
                                <input type="number" id="txtCod" name="txtCod" readonly value="<%=id%>"class="form-control" />
                            </div>
                            
                            <div class="form-group">
                               <label for=txtName class="control-label">
                                   Nombre:
                               </label>
                               <input type="text" id="txtCod" name="txtName"  readonly value="<%= client.getName() %>"class="form-control" required/>
                            </div>
                             
                            <div class="form-group">
                               <label for=txtPhone class="control-label">
                                   Teléfono:
                               </label>
                               <input type="number" id="txtCod" name="txtPhone"  readonly value="<%= client.getPhone() %>"class="form-control" />
                             </div>
                             
                            <div class="form-group">
                                <label for=txtDirection class="control-label">
                                    Dirección:
                                </label>
                                <input type="text" id="txtCod" name="txtDirection" readonly value="<%= client.getDirection() %>"class="form-control" />
                             </div>
                             
                              <div class="form-group">
                                <div class="input-group">
                                    <input  type="submit" id="btnEliminar" onclick="DeleteClient" value="Eliminar" class="btn btn-outline-danger" >
                                    <input type="button" value="Volver" class="btn btn-outline-info"  onclick="location.href = 'Clientes.jsp'">
                                </div>
                             </div>
                        </form>
                    </div>
                </div>
            </div>    
        </main>
    </body>
</html>

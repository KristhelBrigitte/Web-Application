
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
                        <div class="card-header">
                            <h4>Gestión Ciente</h4>
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
                         
                        <form action="SaveClient" method="post">
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
                               <input type="text" id="txtCod" name="txtName" value="<%= client.getName() %>"class="form-control" required/>
                            </div>
                             
                            <div class="form-group">
                               <label for=txtPhone class="control-label">
                                   Teléfono:
                               </label>
                               <input type="number" id="txtCod" name="txtPhone" value="<%= client.getPhone() %>"class="form-control" />
                             </div>
                             
                            <div class="form-group">
                                <label for=txtDirection class="control-label">
                                    Dirección:
                                </label>
                                <input type="text" id="txtCod" name="txtDirection" value="<%= client.getDirection() %>"class="form-control" />
                             </div>
                             
                              <div class="form-group">
                                  <div class="input-group">
                                      <input type="submit" id="btnSave" value="Guardar" class="btn btn-primary mr-2">
                                      <input type="reset" value="Limpiar" class="btn btn-secondary mr-2">
                                      <input type="submit" value="Regresar" class="btn btn-warning mr-2" onclick="location.href='Clientes.jsp'">
                                  </div>
                             </div>
                        </form>
                    </div>
                </div>
            </div>    
        </main>
    </body>
</html>

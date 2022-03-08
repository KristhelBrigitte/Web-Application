package web;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import bussinessLogic.ClientBL;
import domain.Client;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Progra
 */
public class SaveClient extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
           
            ClientBL logic= new ClientBL();
            Client client = new Client();
            String msj="";
            int result=0;
            int id=0;
            if(!request.getParameter("txtCod").isEmpty()){
              client.setId_client(Integer.parseInt(request.getParameter("txtCod")));
            }else{
                client.setId_client(0);
            
            }
            client.setName(new String(request.getParameter("txtName").getBytes("ISO-8859-1"),"UTF-8"));
            
            client.setPhone(request.getParameter("txtPhone"));
            
            client.setDirection(request.getParameter("txtDirection")); 
            
            if(client.getId_client()>0){
                if(logic.getOne("id_Client ="+client.getId_client()).isExist()){
                    result=logic.update(client);
                    msj="Se ha actualizado el cliente";
                }else{
                 msj="No se logró modificar el cliente ya no existe";
                }
            }else{
                result=logic.insert(client);
                msj=logic.getMessage();
            }
            
            response.sendRedirect("Clientes.jsp?msj="+msj);
     
        }catch(Exception e){
            out.print(e.getMessage());
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

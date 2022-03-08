/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web;

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
public class DeleteClient extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {

            if (!request.getParameter("id").isEmpty()) {
                response.sendRedirect("EliminarCliente.jsp?id=" + request.getParameter("id"));
            }

        } catch (IOException | NumberFormatException e) {
             out.print(e.getMessage());
        }
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

        PrintWriter out = response.getWriter();
        try {
            Client client = new Client();
            ClientBL logic = new ClientBL();
            String msj = "";
            if (!request.getParameter("txtCod").isEmpty()) {
                int id = Integer.parseInt(request.getParameter("txtCod"));
                client.setId_client(id);
                if (logic.getOne(" id_client = " + id).isExist()) {
                    logic.delete(client);
                    msj = logic.getMessage();
                }
            }
            response.sendRedirect("Clientes.jsp?msj=" + msj);
        } catch (Exception e) {
             out.print(e.getMessage());
        }
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

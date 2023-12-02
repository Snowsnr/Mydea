/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import Clases.Conexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Diego
 */
@WebServlet(urlPatterns = {"/SubirNovedad"})
public class SubirNovedad extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            String nombre = request.getParameter("Nom_Pro_inp");
            String descripcion = request.getParameter("Desc_Pro_inp");
            String foto = request.getParameter("ft");
            String id = request.getParameter("idn");
            
            
            Conexion con = new Conexion();
            Connection c;
            con.setCon();
            c=con.getCon();
            
            String mensaje = con.Novedad( nombre,  descripcion,  foto,  id);
            try {
                c.close();
            } catch (SQLException ex) {
                Logger.getLogger(EditarCuenta.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            if(mensaje==null){
                     mensaje="Novedad agregada con exito";
                    request.setAttribute("mensaje", mensaje); 
                   RequestDispatcher rd = request.getRequestDispatcher("Subir_Novedad.jsp");
                   rd.forward(request, response);
                
                    
                //
                }else{
                   request.setAttribute("mensaje", mensaje);
                   RequestDispatcher rd = request.getRequestDispatcher("Subir_Novedad.jsp");
                   rd.forward(request, response);
                }
            
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

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
import javax.servlet.http.HttpSession;


import java.util.Arrays;
import java.util.List;





/**
 *
 * @author 980030870
 */
@WebServlet(urlPatterns = {"/CrearProducto"})
public class CrearProducto extends HttpServlet {

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
        
            String nombre = request.getParameter("Nom_Pro_inp");
            request.setAttribute("valorNombreP", nombre);
            String descripcion = request.getParameter("Desc_Pro_inp");
            request.setAttribute("valorDescripcionP", descripcion);
            String precio = request.getParameter("Pre_Prod_inp");
            request.setAttribute("valorPrecio", precio);
            String imagen = request.getParameter("imgp");
            
            String disponibilidad = request.getParameter("Tip_Pro_inp");
            request.setAttribute("valorDisponibilidad", disponibilidad);
            List<String> opciones_disponibilidad = Arrays.asList("Disponible en todo momento", "Por Pedido", "Mayoreo", "Solo por Unidad", "Disponible por un Tiempo", "Proximamente");
            String neid = request.getParameter("neid");
            
            
            
            boolean error = false;
            //Nombre del producto
                if(nombre != null){
                    nombre = nombre.trim();
                    //Que no este vacio
                    if(nombre.isEmpty()){
                        request.setAttribute("error_nombreProducto_Vacio", "Ingrese el nombre del producto o servicio");
                        error = true;
                    }
                    //Muy largo
                    if(nombre.length() > 60){
                        request.setAttribute("error_nombreProducto_Largo", "Solo se permiten hasta 60 caracteres");
                        error = true;
                    }
                }else{
                    request.setAttribute("error_nombreProducto_Vacio", "Ingrese el nombre del producto o servicio");
                    error = true;
                }
            //Precio
                if(precio != null){
                    precio = precio.trim();
                    
                    if(precio.isEmpty() || !precio.matches("\\d+")){
                        request.setAttribute("error_precioProducto_Vacio", "Añada el precio del producto o servicio");
                        error = true;
                    }
                }else{
                    request.setAttribute("error_precioProducto_Vacio", "Añada el precio del producto o servicio");
                    error = true;
                }
            //Descripcion
                if(descripcion != null){
                    descripcion = descripcion.trim();
                    
                    if(descripcion.isEmpty()){
                        request.setAttribute("error_descripcionProducto_Vacio", "Añada una descripcion del producto o servicio");
                        error = true;
                    }
                    if(descripcion.length() > 500){
                        request.setAttribute("error_descripcionProducto_Largo", "Solo se permiten hasta 500 caracteres");
                        error = true;
                    }                    
                }else {
                    request.setAttribute("error_descripcionProducto_Vacio", "Añada una descripcion del producto o servicio");
                    error = true;
                }
            //Disponibilidad
                if(disponibilidad == null || disponibilidad.isEmpty()){
                    request.setAttribute("error_disponibilidad_Invalido", "Seleccione la disponibilidad del producto o servicio");
                    error = true;
                }
                //Que sea valido el value
                if (!opciones_disponibilidad.contains(disponibilidad)){
                    request.setAttribute("error_disponibilidad_Invalido", "Seleccione la disponibilidad del producto o servicio");
                    error = true;
                }
            
            if(error){
                request.getRequestDispatcher("/CrearNegocio_Formulario.jsp").forward(request, response);
            } else {
                switch(disponibilidad){
                case "Disponible en todo momento":
                    disponibilidad="1";
                    break;
                case "Por Pedido":
                    disponibilidad="2";
                    break;
                case "Mayoreo":
                    disponibilidad="3";
                    break;
                case "Solo por Unidad":
                    disponibilidad="4";
                    break;
                case "Disponible por un Tiempo":
                    disponibilidad="5";
                    break;
                case "Proximamente":
                    disponibilidad="6";
                    break;
            }
            
            System.out.println("Descripcion: " + descripcion);
            System.out.println("precio: " + precio);
            System.out.println("disponibilidad: " + disponibilidad);
            
            
            Conexion con = new Conexion();
            Connection c;
            con.setCon();
            c=con.getCon();

           String mensaje = con.Agprod( neid,  nombre,  descripcion,  imagen,  precio,  disponibilidad);
           
           try {
                c.close();
            } catch (SQLException ex) {
                Logger.getLogger(CrearNegocio.class.getName()).log(Level.SEVERE, null, ex);
            }
           
           request.setAttribute("mensaje", mensaje);
           request.setAttribute("neid", neid);
                  
           RequestDispatcher rd = request.getRequestDispatcher("CrearNegocio_Formulario.jsp");
                   rd.forward(request, response);
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

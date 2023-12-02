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

//enviar correos
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//necesario para validar
import java.util.Arrays;
import java.util.List;

//expresiones
import java.util.regex.Pattern;

//Caducidad 
import java.util.Random;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;



/**
 *
 * @author Diego
 */
@WebServlet(urlPatterns = {"/Registro"})
public class Registro extends HttpServlet {

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
            
            String nombrep = request.getParameter("Nom_com_reg");
            request.setAttribute("valorNombreP", nombrep);
            String nombreu = request.getParameter("Nom_usu_reg");
            request.setAttribute("valorNombreU", nombreu);
            String correo = request.getParameter("Email_reg");
            request.setAttribute("valorCorreo", correo);
            String telefono = request.getParameter("Num_reg");
            request.setAttribute("valorTelefono", telefono);
            String password = request.getParameter("Con_reg");
            request.setAttribute("valorPassword", password);
            String Cpassword = request.getParameter("ConCon_reg");
            request.setAttribute("valorCpassword", Cpassword);
            String TyC = request.getParameter("TyC_reg");
            request.setAttribute("valorTyC", TyC);
            String AP = request.getParameter("AP_reg");
            request.setAttribute("valorAP", AP);
            
            String tipo = request.getParameter("Tipo");
            List<String> opciones_tipoCuenta = Arrays.asList("1", "2");
            
            request.setAttribute("valorTipoCuenta", tipo);
            
            String codigo = request.getParameter("codigo");

            
            //Expresiones regulares
                //Solo letras
                String regex_Letras = "^[a-zA-Z ]*$";
                //Correo
                String regex_Correo = "^[\\w-]+(\\.[\\w-]+)*@[\\w-]+(\\.[\\w-]+)*(\\.[a-zA-Z]{2,})$";
                //Telefono
                String regex_Telefono = "^[0-9]{10}$";
                //Contraseña
                String regex_Contraseña = "^(?=.*[0-9]).*$";
            
            
            if (codigo != null) {
                //Confirmación del código
                String codigoCompletado = (String) request.getSession().getAttribute("confirmationCode");
                LocalDateTime generationTime = (LocalDateTime) request.getSession().getAttribute("generationTime");
                
                // Verifica si han pasado más de 5 minutos
                if (ChronoUnit.MINUTES.between(generationTime, LocalDateTime.now()) > 5) {
                    request.setAttribute("error_codigo", "El código de confirmación ha caducado");
                    request.getRequestDispatcher("ConfirmarCodigo_R.jsp").forward(request, response);
                } else if (codigo.equals(codigoCompletado)) {
                    Conexion con = new Conexion();
            
                    Connection c;
                    con.setCon();
                    c=con.getCon();
                    
                    System.out.println("nombreu: " + nombreu);
                    System.out.println("password: " + password);
                    System.out.println("nombrep: " + nombrep);
                    System.out.println("telefono: " + telefono);
                    System.out.println("correo: " + correo);
                    System.out.println("tipo: " + tipo);

                    String mensaje = con.Registro(nombreu, password, nombrep, telefono, correo, tipo);

                     try {
                        c.close();
                    } catch (SQLException ex) {
                        Logger.getLogger(CrearNegocio.class.getName()).log(Level.SEVERE, null, ex);
                    }
                        //
                        if(mensaje==null){
                            response.sendRedirect("Iniciar_Sesion.jsp");
                        //
                        }else{
                           request.setAttribute("mensaje", mensaje);

                           RequestDispatcher rd = request.getRequestDispatcher("Registro.jsp");
                           rd.forward(request, response);
                        }
                } else {
                    // El código es incorrecto
                    request.setAttribute("error_codigo", "El código de confirmación no es correcto");
                    request.getRequestDispatcher("ConfirmarCodigo_R.jsp").forward(request, response);
                }
            } else {
                
                boolean error = false;
                
                //Validaciones
                
                    //Nombre completo
                    if(nombrep != null){
                        nombrep = nombrep.trim();
                        //Que no este vacio
                        if(nombrep.isEmpty()){
                            request.setAttribute("error_nombreCompleto_Vacio", "Ingrese su nombre");
                            error = true;
                        }
                        //Muy largo
                        if(nombrep.length() > 60){
                            request.setAttribute("error_nombreCompleto_Largo", "Solo se permiten hasta 60 caracteres");
                            error = true;
                        }
                        //Solo letras
                        if(!Pattern.matches(regex_Letras, nombrep)){
                            request.setAttribute("error_nombreCompleto_Invalido", "Solo se permiten letras");
                            error = true;
                        }
                    }else{
                        request.setAttribute("error_nombreCompleto_Vacio", "Ingrese su nombre");
                        error = true;
                    }
                    
                    //Nombre de usuario
                    if(nombreu != null){
                        nombreu = nombreu.trim();
                        //Que no este vacio
                        if(nombreu.isEmpty()){
                            request.setAttribute("error_nombreUsuario_Vacio", "El campo no debe de estar vacio");
                            error = true;
                        }
                        //Muy largo
                        if(nombreu.length() > 60){
                            request.setAttribute("error_nombreUsuario_Largo", "Solo se permiten hasta 60 caracteres");
                            error = true;
                        }
                    } else {
                        request.setAttribute("error_nombreUsuario_Vacio", "El campo no debe de estar vacio");
                        error = true;
                    }
                    
                    //Correo
                    if(correo != null){
                        correo = correo.trim();
                        //Que no este vacio
                        if(correo.isEmpty()){
                            request.setAttribute("error_correo_Vacio", "El campo no debe de estar vacio");
                            error = true;
                        }
                        //Que sea correcto el correo
                        if(!Pattern.matches(regex_Correo, correo)){
                            request.setAttribute("error_correo_Invalido", "Ingrese un correo electronico valido");
                            error = true;
                        } 
                    } else {
                        request.setAttribute("error_correo_Vacio", "El campo no debe de estar vacio");
                        error = true;
                    }
                    
                    //Telefono
                    if(telefono != null){
                        telefono = telefono.trim();
                        //Que no este vacio
                        if(telefono.isEmpty()){
                            request.setAttribute("error_telefono_Vacio", "El campo no debe de estar vacio");
                            error = true;
                        }
                        //Que sea valido el telefono
                        if(!Pattern.matches(regex_Telefono, telefono)){
                            request.setAttribute("error_telefono_Invalido", "Ingrese un numero de telefono valido");
                            error = true;
                        }
                    } else {
                        request.setAttribute("error_telefono_Vacio", "El campo no debe de estar vacio");
                        error = true;
                    }
                    
                    //Contraseña
                    if(password != null){
                        password = password.trim();
                        //Que no este vacio
                        if(password.isEmpty()){
                            request.setAttribute("error_contraseña_Vacio", "El campo no debe de estar vacio");
                            error = true;
                        }
                        //Que tenga minimo 1 numero
                        if(!Pattern.matches(regex_Contraseña, password)){
                            request.setAttribute("error_contraseña_Invalido", "La contraseña debe contener al menos un numero");
                            error = true;
                        }
                    } else {
                        request.setAttribute("error_contraseña_Vacio", "El campo no debe de estar vacio");
                        error = true;
                    }

                    //Confirmar contraseña                    
                    if(Cpassword != null){
                        Cpassword = Cpassword.trim();
                        //Que no este vacio
                        if(Cpassword.isEmpty()){
                            request.setAttribute("error_confirmarContraseña_Vacio", "El campo no debe de estar vacio");
                            error = true;
                        }
                        //Contraseñas iguales
                        if(!Cpassword.equals(password)){
                            request.setAttribute("error_confirmarContraseña_Invalido", "Las contraseñas no coinciden");
                            error = true;
                        }
                    }
                    
                    //Tipo de cuenta
                        //Que no este vacio
                        if(tipo == null || tipo.isEmpty()){
                            request.setAttribute("error_tipoCuenta_Invalido", "Seleccione su tipo de negocio");
                            error = true;
                        }
                        //Que sea valido el value
                        if (!opciones_tipoCuenta.contains(tipo)){
                            request.setAttribute("error_tipoCuenta_Invalido", "Seleccione un tipo de negocio valido");
                            error = true;
                        }
                        
                    //Terminos y condiciones
                        if(TyC == null || TyC.isEmpty()){
                            request.setAttribute("error_TyC_Vacio", "Acepte los terminos y condiciones");
                            error = true;
                        }
                    //Aviso de privacidad
                        if(AP == null || AP.isEmpty()){
                            request.setAttribute("error_AP_Vacio", "Acepte el aviso de privacidad");
                            error = true;
                        }
                    
                if (error){
                    request.getRequestDispatcher("Registro.jsp").forward(request, response);
                }        
                
                else {
                    request.getSession().setAttribute("nombrep", nombrep);
                    request.getSession().setAttribute("nombreu", nombreu);
                    request.getSession().setAttribute("email", correo);
                    request.getSession().setAttribute("telefono", telefono);
                    request.getSession().setAttribute("password", password);
                    request.getSession().setAttribute("tipo", tipo);
                    
                    
                    VerificacionCorreo_R emailSender = new VerificacionCorreo_R();
                    String confirmationCode = emailSender.sendConfirmationCode(request);
                    request.getSession().setAttribute("confirmationCode", confirmationCode);
                    response.sendRedirect("ConfirmarCodigo_R.jsp");
                }
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

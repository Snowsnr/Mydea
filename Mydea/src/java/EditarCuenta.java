/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import Clases.Conexion;
import Clases.Persona;
import Clases.Usuario;
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
@WebServlet(urlPatterns = {"/EditarCuenta"})
public class EditarCuenta extends HttpServlet {

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
            
            String nombreu = request.getParameter("nomu");
            String nombrec = request.getParameter("nomc");
            String correo = request.getParameter("correo");
            String descripcion = request.getParameter("desc");
            String telefono = request.getParameter("telefono");
            String facebook = request.getParameter("fb");
            String instagram = request.getParameter("ig");
            String twitter = request.getParameter("tw");
            String web = request.getParameter("web");
            String foto = request.getParameter("foto");
            
            
            //Expresiones regulares
                //Solo letras
                String regex_Letras = "^[a-zA-Z ]*$";
                //Correo
                String regex_Correo = "^[\\w-]+(\\.[\\w-]+)*@[\\w-]+(\\.[\\w-]+)*(\\.[a-zA-Z]{2,})$";
                //Telefono
                String regex_Telefono = "^[0-9]{10}$";
                //Contraseña
                String regex_Contraseña = "^(?=.*[0-9]).*$";
                
                
            
            
            
            HttpSession misession= (HttpSession) request.getSession();
            Usuario usuario= (Usuario) misession.getAttribute("usuario");
            String nombreua = usuario.getUsu_nom();
            Persona per= (Persona) misession.getAttribute("persona");
            String correoa = per.getPer_correo();
            String fotoa = per.getPer_foto();
            String telefonoa = per.getPer_telefono();
            String nombreca = per.getPer_nombrereal();
            String fba = per.getPer_fb();
            String iga = per.getPer_ig();
            String twa = per.getPer_twitter();
            String weba = per.getPer_web();
            String desca = per.getPer_descripcion();
            
            
                
            if(nombreu.equals("")){
            nombreu=nombreua;
            }
            if(nombrec.equals("")){
                nombrec=nombreca;
            }
            if(correo.equals("")){
                correo=correoa;
            }
            if(descripcion.equals("")){
                descripcion=desca;
            }
            if(telefono.equals("")){
                telefono=telefonoa;
            }
            if(facebook.equals("")){
                facebook=fba;
            }
            if(instagram.equals("")){
                instagram=iga;
            }
            if(twitter.equals("")){
                twitter=twa;
            }
            if(web.equals("")){
                web=weba;
            }
            if(foto.equals("")){
                foto=fotoa;
            }
            
            boolean error = false;
            
            //Nombre completo
            if(nombrec != null){
                nombrec = nombrec.trim();
                if(!nombrec.equals(nombreca)){
                     
                    if(nombrec.isEmpty()){
                        request.setAttribute("error_nombreC_Vacio", "El campo no debe de estar vacio");
                        error = true;
                    }
                    
                    if(nombrec.length() > 60){
                        request.setAttribute("error_nombreC_Largo", "Solo se permiten 60 caracteres");
                        error = true;
                    }
                    
                    if(!Pattern.matches(regex_Letras, nombrec)){
                            request.setAttribute("error_nombreC_Invalido", "Solo se permiten letras");
                            error = true;
                        }
                }
            }
            //Nombre de usuario
            if(nombreu != null){
                nombreu = nombreu.trim();
                if(!nombreu.equals(nombreua)){
                     
                    if(nombreu.isEmpty()){
                        request.setAttribute("error_nombreU_Vacio", "El campo no debe de estar vacio");
                        error = true;
                    }
                    
                    if(nombreu.length() > 60){
                        request.setAttribute("error_nombreu_Largo", "Solo se permiten 60 caracteres");
                        error = true;
                    }
                }
            }
            //Telefono
            
            if(telefono != null){
                telefono = telefono.trim();
                if(!telefono.equals(telefonoa)){
                     
                    if(telefono.isEmpty()){
                        request.setAttribute("error_telefono_Vacio", "El campo no debe de estar vacio");
                        error = true;
                    }
                    //Que sea valido el telefono
                    if(!Pattern.matches(regex_Telefono, telefono)){
                        request.setAttribute("error_telefono_Invalido", "Ingrese un numero de telefono valido");
                        error = true;
                    }
                }
            }
            
            //Correos
            if(correo != null){
                correo = correo.trim();
                if(!correo.equals(correoa)){
                     
                    if(correo.isEmpty()){
                        request.setAttribute("error_correo_Vacio", "El campo no debe de estar vacio");
                        error = true;
                    }
                    //Que sea valido el telefono
                    if(!Pattern.matches(regex_Correo, correo)){
                        request.setAttribute("error_correo_Invalido", "Ingrese un correo valido");
                        error = true;
                    }
                }
            }
            
            
            else{
                request.setAttribute("error_nombreUsuario_Vacio", "El campo no debe de estar vacio");
                error = true;
            }
            
            if(error){
                request.getRequestDispatcher("Editar_CuentaCV.jsp").forward(request, response);
            } else {
            
            Conexion con = new Conexion();
            Connection c;
            con.setCon();
            c=con.getCon();
            
            String mensaje = con.EUsuario(nombreu,nombreua,nombrec,correo,descripcion,telefono,facebook,instagram,twitter,
                    web,foto,correoa,telefonoa);
            
            try {
                c.close();
            } catch (SQLException ex) {
                Logger.getLogger(EditarCuenta.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            if(mensaje==null){
                     mensaje="Datos actualizados correctamente";
                    request.setAttribute("mensaje", mensaje);
                    
                    usuario.setUsu_nom(nombreu);
                    per.setPer_correo(correo);
                    per.setPer_descripcion(descripcion);
                    per.setPer_fb(facebook);
                    per.setPer_foto(foto);
                    per.setPer_ig(instagram);
                    per.setPer_nombrereal(nombrec);
                    per.setPer_telefono(telefono);
                    per.setPer_twitter(twitter);
                    per.setPer_web(web);
                   
                   RequestDispatcher rd = request.getRequestDispatcher("Editar_CuentaCV.jsp");
                   rd.forward(request, response);
                
                    
                //
                }else{
                   request.setAttribute("mensaje", mensaje);
                   
                   RequestDispatcher rd = request.getRequestDispatcher("Editar_CuentaCV.jsp");
                   rd.forward(request, response);
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

/*
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditarCuenta</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1> Datos a cambiar</h1>");
            out.println("<h3>Nombre de usuario antiguo: "+nombreua+" Nombre nuevo: "+nombreu+" </h3>");
            out.println("<h3>Nombre completo antiguo: "+nombreca+" Nombre completo nuevo: "+nombrec+" </h3>");
            out.println("<h3>Descripcion antigua: "+desca+" Descripcion nueva: "+descripcion+" </h3>");
            out.println("<h3>Telefono antiguo: "+telefonoa+" Telefono nuevo: "+telefono+" </h3>");
            out.println("<h3>Correo antiguo: "+correoa+" Correo nuevo: "+correo+" </h3>");
            out.println("<h3>Facebook antiguo: "+fba+" Facebook nuevo: "+facebook+" </h3>");
            out.println("<h3>Instagram antiguo: "+iga+" Instagram nuevo: "+instagram+" </h3>");
            out.println("<h3>Twitter antiguo: "+twa+" Twitter nuevo: "+twitter+" </h3>");
            out.println("<h3>Pagina web antigua: "+weba+" Pagina web nueva: "+web+" </h3>");
            out.println("<h3>Foto antigua: "+foto+" Foto nueva: "+foto+" </h3>");
            out.println("</body>");
            out.println("</html>");
            */

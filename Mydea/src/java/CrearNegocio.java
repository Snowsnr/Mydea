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


//imports para validar
import java.util.Arrays;
import java.util.List;

//expresiones
import java.util.regex.Pattern;

/**
 *
 * @author Diego
 */
@WebServlet(urlPatterns = {"/CrearNegocio"})
public class CrearNegocio extends HttpServlet {

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
            
            //Datos del negocio
            String Nombre = request.getParameter("N_Neg_cnf");
            request.setAttribute("valorNombreNegocio", Nombre);
            String Tipo = request.getParameter("TP_cnf");
            List<String> opciones_tipoNegocio = Arrays.asList("Abarrotes", "Materia_Prima", "Restaurantes", "SyP", "Cafeteria", "Catering", "Panaderia", "OyF");
            request.setAttribute("valorTipoNegocio", Tipo);
            String Descripcion = request.getParameter("desc");
            request.setAttribute("valorDescripcion", Descripcion);
            
            //Horario
            
            //Lunes
                String AbiertoL = request.getParameter("Abierto_L");
                String CerradoL = request.getParameter("Cerrado_L");
                String DiaCerradoL = request.getParameter("cerr_lun");
                String SheL = request.getParameter("she_lun");

                request.setAttribute("valor_horaApertura_L", AbiertoL);
                request.setAttribute("valor_horaCierre_L", CerradoL);
                request.setAttribute("cerr_lun", DiaCerradoL);
                request.setAttribute("she_lun", SheL);
            
            //Martes
                String AbiertoM = request.getParameter("Abierto_M");
                String CerradoM = request.getParameter("Cerrado_M");
                String DiaCerradoM = request.getParameter("cerr_mar");
                String SheM = request.getParameter("she_mar");
                
                request.setAttribute("valor_horaApertura_M", AbiertoM);
                request.setAttribute("valor_horaCierre_M", CerradoM);
                request.setAttribute("cerr_mar", DiaCerradoM);
                request.setAttribute("she_mar", DiaCerradoM);
            
            //Miercoles
                String AbiertoMI = request.getParameter("Abierto_Mi");
                String CerradoMI = request.getParameter("Cerrado_Mi");
                String DiaCerradoMI = request.getParameter("cerr_mie");
                String SheMI = request.getParameter("she_mie");
                
                request.setAttribute("valor_horaApertura_Mie", AbiertoMI);
                request.setAttribute("valor_horaCierre_Mie", CerradoMI);
                request.setAttribute("cerr_mie", DiaCerradoMI);
                request.setAttribute("she_mie", SheMI);
            
            //Jueves
                String AbiertoJ = request.getParameter("Abierto_J");
                String CerradoJ = request.getParameter("Cerrado_J");
                String DiaCerradoJ = request.getParameter("cerr_jue");
                String SheJ = request.getParameter("she_jue");
                
                request.setAttribute("valor_horaApertura_J", AbiertoJ);
                request.setAttribute("valor_horaCierre_J", CerradoJ);
                request.setAttribute("cerr_jue", DiaCerradoJ);
                request.setAttribute("she_jue", SheJ);
            
            //Viernes
                String AbiertoV = request.getParameter("Abierto_V");
                String CerradoV = request.getParameter("Cerrado_V");
                String DiaCerradoV = request.getParameter("cerr_vie");
                String SheV = request.getParameter("she_vie");
                
                request.setAttribute("valor_horaApertura_V", AbiertoV);
                request.setAttribute("valor_horaCierre_V", CerradoV);
                request.setAttribute("cerr_vie", DiaCerradoV);
                request.setAttribute("she_vie", SheV);
            
            //Sabado
                String AbiertoS = request.getParameter("Abierto_S");
                String CerradoS = request.getParameter("Cerrado_S");
                String DiaCerradoS = request.getParameter("cerr_sab");
                String SheS = request.getParameter("she_sab");
                
                request.setAttribute("valor_horaApertura_S", AbiertoS);
                request.setAttribute("valor_horaCierre_S", CerradoS);
                request.setAttribute("cerr_sab", DiaCerradoS);
                request.setAttribute("she_sab", SheS);
            
            //Domingo
                String AbiertoD = request.getParameter("Abierto_D");
                String CerradoD = request.getParameter("Cerrado_D");
                String DiaCerradoD = request.getParameter("cerr_dom");
                String SheD = request.getParameter("she_dom");
                
                request.setAttribute("valor_horaApertura_D", AbiertoD);
                request.setAttribute("valor_horaCierre_D", CerradoD);
                request.setAttribute("cerr_dom", DiaCerradoD);
                request.setAttribute("she_dom", SheD);
            
            //Direccion
            String Cp = request.getParameter("cpp");
            request.setAttribute("valorCp", Cp);
            String Colonia = request.getParameter("colonia");
            request.setAttribute("valorColonia", Colonia);
            String Numero = request.getParameter("numero");
            request.setAttribute("valorNumero", Numero);
            String Calle = request.getParameter("calle");
            request.setAttribute("valorCalle", Calle);
            String Iextra = request.getParameter("iextra");
            request.setAttribute("valorIextra", Iextra);
            
            //contactos
            String Telefono = request.getParameter("tel_loc_cnf");
            request.setAttribute("valorTelefono", Telefono);
            String Correo = request.getParameter("mail_loc_cnf");
            request.setAttribute("valorCorreo", Correo);
            String Facebook = request.getParameter("face_loc_cnf");
            request.setAttribute("valorFacebook", Facebook);
            String Instagram = request.getParameter("inst_loc_cnf");
            request.setAttribute("valorInstagram", Instagram);
            String Twitter = request.getParameter("twit_loc_cnf");
            request.setAttribute("valorTwitter", Twitter);
            String Pagina = request.getParameter("web_loc_cnf");
            request.setAttribute("valorPagina", Pagina);

            //Imagenes
            String logo = request.getParameter("logo");
            String img1 = request.getParameter("img1");
            String img2 = request.getParameter("img2");
            String img3 = request.getParameter("img3"); 
            
            //Expresiones regulares
                //Contactos
                    //Telefono
                    String regex_Telefono = "^[0-9]{10}$";
                    //Correo
                    String regex_Correo = "^[\\w-]+(\\.[\\w-]+)*@[\\w-]+(\\.[\\w-]+)*(\\.[a-zA-Z]{2,})$";
                    //Facebook
                    String regex_Facebook = "^(https?:\\\\/\\\\/)?(www\\\\.)?facebook\\\\.com\\\\/.*";
                    //Instagram
                    String regex_Instagram = "^(https?:\\\\/\\\\/)?(www\\\\.)?instagram\\\\.com\\\\/.*";
                    //Twitter
                    String regex_Twitter = "^(https?:\\\\/\\\\/)?(www\\\\.)?twitter\\\\.com\\\\/.*";
                    //Pagina
                    String regex_Pagina = "^(http:\\\\/\\\\/www\\\\.|https:\\\\/\\\\/www\\\\.|http:\\\\/\\\\/|https:\\\\/\\\\/)?[a-z0-9]+([\\\\-\\\\.]{1}[a-z0-9]+)*\\\\.[a-z]{2,5}(:[0-9]{1,5})?(\\\\/.*)?$";

            
            
            //Validaciones
            
            boolean error = false;
            
            //Nombre del negocio
                    if(Nombre != null){
                        Nombre = Nombre.trim();
                        //Que no este vacio
                        if(Nombre.isEmpty()){
                            request.setAttribute("error_nombreNegocio_Vacio", "Ingrese el nombre de su local");
                            error = true;
                        }
                        //Muy largo
                        if(Nombre.length() > 60){
                            request.setAttribute("error_nombreNegocio_Largo", "Solo se permiten hasta 60 caracteres");
                            error = true;
                        }
                    }else{
                        request.setAttribute("error_nombreNegocio_Vacio", "Ingrese el nombre de su local");
                        error = true;
                    }
            //Tipo de negocio
                    //Que no este vacio
                    if(Tipo == null || Tipo.isEmpty()){
                        request.setAttribute("error_tipoNegocio_Invalido", "Seleccione su tipo de negocio");
                        error = true;
                    }
                    //Que sea valido el value
                    if (!opciones_tipoNegocio.contains(Tipo)){
                        request.setAttribute("error_tipoNegocio_Invalido", "Seleccione un tipo de negocio valido");
                        error = true;
                    }
                    
                    
            //Descripcion del negocio
                    if(Descripcion != null){
                        Descripcion = Descripcion.trim();
                        //Que no este vacio
                        if(Descripcion.isEmpty()){
                            request.setAttribute("error_descripcionNegocio_Vacio", "Ingrese la descripcion de su negocio");
                            error = true;
                        }
                        //Muy largo
                        if(Descripcion.length() > 500){
                            request.setAttribute("error_descripcionNegocio_Largo", "Solo se permiten hasta 500 caracteres");
                            error = true;
                        }
                    }else{
                        request.setAttribute("error_descripcionNegocio_Vacio", "Ingrese la descripcion de su local");
                        error = true;
                    }
                    
            //Horario
                    //Lunes
                    if("lun_cerr".equals(DiaCerradoL) || "lun_snhor".equals(SheL)){

                    } else {
                        if(AbiertoL == null || AbiertoL.isEmpty() || CerradoL == null || CerradoL.isEmpty()){
                        request.setAttribute("error_horarioLunes_Vacio", "Seleccione un horario para el dia lunes");
                        error = true;
                        }
                    }

                    //Martes

                    if("mar_cerr".equals(DiaCerradoM) || "mar_snhor".equals(SheM)){

                    } else {
                        if(AbiertoM == null || AbiertoM.isEmpty() || CerradoM == null || CerradoM.isEmpty()){
                        request.setAttribute("error_horarioMartes_Vacio", "Seleccione un horario para el dia martes");
                        error = true;
                        }
                    }

                    //Miercoles

                    if("mie_cerr".equals(DiaCerradoMI) || "mie_snhor".equals(SheMI)){

                    } else {
                        if(AbiertoMI == null || AbiertoMI.isEmpty() || CerradoMI == null || CerradoMI.isEmpty()){
                        request.setAttribute("error_horarioMiercoles_Vacio", "Seleccione un horario para el dia miercoles");
                        error = true;
                        }
                    }

                    //Jueves
                    if("jue_cerr".equals(DiaCerradoJ) || "jue_snhor".equals(SheJ)){

                    } else {
                        if(AbiertoJ == null || AbiertoJ.isEmpty() || CerradoJ == null || CerradoJ.isEmpty()){
                        request.setAttribute("error_horarioJueves_Vacio", "Seleccione un horario para el dia jueves");
                        error = true;
                        }
                    }

                    //Viernes

                    if("vie_cerr".equals(DiaCerradoV) || "vie_snhor".equals(SheV)){

                    } else {
                        if(AbiertoV == null || AbiertoV.isEmpty() || CerradoV == null || CerradoV.isEmpty()){
                        request.setAttribute("error_horarioViernes_Vacio", "Seleccione un horario para el dia viernes");
                        error = true;
                        }
                    }

                    //Sabado
                    if("sab_cerr".equals(DiaCerradoS) || "sab_snhor".equals(SheS)){

                    } else {
                        if(AbiertoS == null || AbiertoS.isEmpty() || CerradoS == null || CerradoS.isEmpty()){
                        request.setAttribute("error_horarioSabado_Vacio", "Seleccione un horario para el dia sabado");
                        error = true;
                        }
                    }

                    //Domingo

                    if("dom_cerr".equals(DiaCerradoD) || "dom_snhor".equals(SheD)){

                    } else {
                        if(AbiertoD == null || AbiertoD.isEmpty() || CerradoD == null || CerradoD.isEmpty()){
                        request.setAttribute("error_horarioDomingo_Vacio", "Seleccione un horario para el dia domingo");
                        error = true;
                        }
                    }
                    
                //Direccion del local
                    //Cp
                    if(Cp != null){
                        Cp = Cp.trim();
                        if(Cp == null || Cp.isEmpty() || !Cp.matches("\\d+") || Cp.length() != 5){
                            request.setAttribute("error_codigoPostal_Invalido", "Ingrese un codigo postal");
                            error = true;
                        }
                    } else {
                        request.setAttribute("error_codigoPostal_Invalido", "Ingrese un codigo postal");
                        error = true;
                    }
                    
                    //Colonia
                    if(Colonia != null){
                        Colonia = Colonia.trim();
                        
                        if (Colonia == null || Colonia.isEmpty()){
                            request.setAttribute("error_colonia_Vacio", "Ingrese la colonia donde se ubica su local");
                            error = true;
                        }

                        if (Colonia == null || Colonia.length() > 80){
                            request.setAttribute("error_colonia_Largo", "Solo se permite un maximo de 80 caracteres");
                            error = true;
                        }
                    } else {
                        request.setAttribute("error_colonia_Vacio", "Ingrese la colonia donde se ubica su local");
                        error = true;
                    }
                    
                    //Calle
                    if(Calle != null){
                        Calle = Calle.trim();
                        if(Calle == null || Calle.isEmpty()){
                            request.setAttribute("error_calle_Vacio", "Ingrese la calle donde esta ubicado su local");
                            error = true;
                        }

                        if(Calle == null || Calle.length() > 100){
                            request.setAttribute("error_calle_Largo", "Solo se permite un maximo de 100 caracteres");
                            error = true;
                        }
                    } else {
                        request.setAttribute("error_calle_Vacio", "Ingrese la calle donde esta ubicado su local");
                        error = true;
                    }
                    
                    //Numero
                    if(Numero != null){
                        Numero = Numero.trim();
                        if(Numero == null || Numero.isEmpty() || !Numero.matches("\\d+")){
                            request.setAttribute("error_numero_Invalido", "Ingrese el numero de su calle");
                            error = true;
                        }
                    } else {
                        request.setAttribute("error_numero_Invalido", "Ingrese el numero de su calle");
                        error = true;
                    }
                    
                    //Info extra                    
                    if(Iextra.length() > 300){
                        request.setAttribute("error_infoExtra_Largo", "Se permite un maximo de 300 caracteres");
                        error = true;
                    }
                    
                //Contactos
                    //Minimo un contacto
                    
                    if(Telefono.isEmpty() && Correo.isEmpty() && Facebook.isEmpty() && Instagram.isEmpty() && Twitter.isEmpty() && Pagina.isEmpty()){
                        request.setAttribute("error_contactos_Vacio", "Por favor, seleccione al menos un medio de contactacto");
                        error = true;
                    }
                    
                    //Telefono
                    if(!Telefono.isEmpty() && !Pattern.matches(regex_Telefono, Telefono)){
                        request.setAttribute("error_telefono_Invalido", "Ingrese un numero de telefono valido");
                        error = true;
                    }
                    
                    //Correo
                    if(!Correo.isEmpty() && !Pattern.matches(regex_Correo, Correo)){
                        request.setAttribute("error_correo_Invalido", "Ingrese un correo electronico valido");
                        error = true;
                    }
                    
                    //Facebook
                    if(!Facebook.isEmpty() && !Pattern.matches(regex_Facebook, Facebook)){
                        request.setAttribute("error_facebook_Invalido", "Ingrese un link de facebook valido");
                        error = true;
                    }
                    
                    //Instagram
                    if(!Instagram.isEmpty() && !Pattern.matches(regex_Instagram, Instagram)){
                        request.setAttribute("error_instagram_Invalido", "Ingrese un link de instagram valido");
                        error = true;
                    }
                    
                    //Twitter
                    if(!Twitter.isEmpty() && !Pattern.matches(regex_Twitter, Twitter)){
                        request.setAttribute("error_twitter_Invalido", "Ingrese un link de twitter valido");
                        error = true;
                    }
                    
                    //Pagina
                    if(!Pagina.isEmpty() && !Pattern.matches(regex_Pagina, Pagina)){
                        request.setAttribute("error_pagina_Invalido", "Ingrese un link valido");
                        error = true;
                    }
                    
                    
                if (error) {
                    request.getRequestDispatcher("/CrearNegocio_Formulario.jsp").forward(request, response);
                } else {
                    switch(Tipo){
                    case "Abarrotes":
                        Tipo="1";
                        break;
                    case "Materia_Prima":
                        Tipo="2";
                        break;
                    case "Restaurantes":
                        Tipo="3";
                        break;
                    case "SyP":
                        Tipo="4";
                        break;
                    case "Cafeteria":
                        Tipo="5";
                        break;
                    case "Catering":
                        Tipo="6";
                        break;
                    case "Panaderia":
                        Tipo="7";
                        break;
                    case "OyF":
                        Tipo="8";
                        break;
                    case "Otro":
                        Tipo="9";
                        break;
                }

                Conexion con = new Conexion();

                Connection c;
                con.setCon();
                c=con.getCon();
                HttpSession misession= (HttpSession) request.getSession();
                Persona per= (Persona) misession.getAttribute("persona");
                String correo = per.getPer_correo();
                int id = con.Pid(correo);


                String pid = Integer.toString(id);
                String mensaje = con.AgNeg(pid, Nombre, Descripcion, Colonia, Calle, Numero, Iextra, Cp, 
                        Pagina, logo, Tipo, Facebook, Twitter, Instagram, img1, img2, Correo, img3, Telefono);

                int nid = con.Nid(Nombre);

                String neid = Integer.toString(nid);
                
                System.out.println("Correo: " + correo);
                System.out.println("ID: " + id);
                System.out.println("PID: " + pid);
                System.out.println("Mensaje: " + mensaje);
                System.out.println("NID: " + nid);
                System.out.println("NEID: " + neid);

                String especialL="";
                String especialM="";
                String especialMI="";
                String especialJ="";
                String especialV="";
                String especialS="";
                String especialD="";

                if(SheL == null && DiaCerradoL == null ){       
                    especialL="No";
                }else if(DiaCerradoL==null){               
                    especialL="Sin horario especifico";
                    AbiertoL = "No";
                    CerradoL = "No";
                }else{               
                    especialL="Cerrado";  
                    AbiertoL = "No";
                    CerradoL = "No";
                }

                if(SheM == null && DiaCerradoM == null ){
                    especialM="No";            
                }else if(DiaCerradoM==null){  
                    especialM="Sin horario especifico";
                    AbiertoM = "No";
                    CerradoM = "No";
                }else{
                    especialM="Cerrado";
                    AbiertoM = "No";
                    CerradoM = "No";
                }

                if(SheMI == null && DiaCerradoMI == null ){
                    especialMI="No";
                }else if(DiaCerradoMI==null){
                    especialMI="Sin horario especifico";
                    AbiertoMI = "No";
                    CerradoMI = "No";
                }else{
                    especialMI="Cerrado";
                    AbiertoMI = "No";
                    CerradoMI = "No";
                }

                if(SheJ == null && DiaCerradoJ == null ){
                    especialJ="No";
                }else if(DiaCerradoJ==null){
                    especialJ="Sin horario especifico";
                    AbiertoJ = "No";
                    CerradoJ = "No";
                }else{
                    especialJ="Cerrado";
                    AbiertoJ = "No";
                    CerradoJ = "No";
                }

                if(SheV == null && DiaCerradoV == null ){
                    especialV="No";
                }else if(DiaCerradoV==null){
                    especialV="Sin horario especifico";
                    AbiertoV = "No";
                    CerradoV = "No";
                }else{
                    especialV="Cerrado";
                    AbiertoV = "No";
                    CerradoV = "No";
                }

                if(SheS == null && DiaCerradoS == null ){
                    especialS="No";
                }else if(DiaCerradoS==null){
                    especialS="Sin horario especifico";
                    AbiertoS = "No";
                    CerradoS = "No";
                }else{
                    especialS="Cerrado";
                    AbiertoS = "No";
                    CerradoS = "No";
                }

                if(SheD == null && DiaCerradoD == null ){
                    especialD="No";
                }else if(DiaCerradoD==null){
                    especialD="Sin horario especifico";
                    AbiertoD = "No";
                    CerradoD = "No";
                }else{
                    especialD="Cerrado";
                    AbiertoD = "No";
                    CerradoD = "No";
                }

                con.Horario(AbiertoL, CerradoL, especialL, "Lunes", neid);
                con.Horario(AbiertoM, CerradoM, especialM, "Martes", neid);
                con.Horario(AbiertoMI, CerradoMI, especialMI, "Miercoles", neid);
                con.Horario(AbiertoJ, CerradoJ, especialJ, "Jueves", neid);
                con.Horario(AbiertoV, CerradoV, especialV, "Viernes", neid);
                con.Horario(AbiertoS, CerradoS, especialS, "Sabado", neid);
                con.Horario(AbiertoD, CerradoD, especialD, "Domingo", neid);

                try {
                    c.close();
                } catch (SQLException ex) {
                    Logger.getLogger(CrearNegocio.class.getName()).log(Level.SEVERE, null, ex);
                }
                    //
                    if(mensaje==null){

                        mensaje="Negocio agregado con exito, ahora puede agregar productos";

                      request.setAttribute("mensaje", mensaje);
                      request.setAttribute("neid", neid);

                       RequestDispatcher rd = request.getRequestDispatcher("CrearNegocio_Formulario.jsp");
                       rd.forward(request, response);


                    //
                    }else{
                       request.setAttribute("mensaje", mensaje);

                       RequestDispatcher rd = request.getRequestDispatcher("CrearNegocio_Formulario.jsp");
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
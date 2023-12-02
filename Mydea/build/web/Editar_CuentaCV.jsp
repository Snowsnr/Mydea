<%-- 
    Document   : Editar_Perfil
    Created on : 20 nov 2023, 9:59:50
    Author     : altro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession session1 = request.getSession(false);
    if (session1.getAttribute("usuario") != null) {

    %>

<%@page session="true"%>

<%@page import="Clases.Usuario" %>
<%@page import="Clases.Persona" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="templates/Referencias/Todas_Ref.jsp"/>
        <title>Editar Cuenta</title>
    </head>
    <body>
        <jsp:include page="templates/Navegadores/Navegador_CV.jsp"/>
        <%
            HttpSession misession= (HttpSession) request.getSession();
Usuario usuario= (Usuario) misession.getAttribute("usuario");
String nombre = usuario.getUsu_nom();
String pass = usuario.getUsu_pass();
Persona per= (Persona) misession.getAttribute("persona");
String correo = per.getPer_correo();
String foto = per.getPer_foto();
String telefono = per.getPer_telefono();
String nombrereal = per.getPer_nombrereal();
String fb = per.getPer_fb();
String ig = per.getPer_ig();
String tw = per.getPer_twitter();
String web = per.getPer_web();
String desc = per.getPer_descripcion();
            %>
            <form class="main-container" method="POST" action="EditarCuenta" id="forme" >
            <div class="elementos-izquierda">
                <div class="textos">
                    <p class="p4">Datos Personales</p>
                    <section class="d-flex inpts_names_ec">
                        <section class="d-flex flex-column">
                            <label for="">Nombre Completo</label>
                            <input type="text" class="inpts" name="nomc" placeholder="<%=nombrereal%>" >
                            <span class="error">${error_nombreC_Vacio}</span>
                            <span class="error">${error_nombreC_Largo}</span>
                            <span class="error">${error_nombreC_Invalido}</span>
                        </section>
                        <section class="d-flex flex-column">
                            <label for="">Nombre de Usuario</label>
                            <input type="text" class="inpts" name="nomu" placeholder="<%=nombre%>" >
                            <span class="error">${error_nombreU_Vacio}</span>
                            <span class="error">${error_nombreU_Largo}</span>
                        </section>
                    </section>
                    <section class="d-flex flex-column txtar">
                        <label for="">Descripcion</label>
                        <textarea name="desc" id="" class="inpts " placeholder="<%=desc%>" ></textarea>
                    </section>
                </div>
                <div class="contactos">
                    <p class="p4">Contactos</p>
                    <div class="Iconos">
                        <section class="d-flex justify-content-center align-items-center">
                            <i class="bi bi-telephone contactos_usu_perfil" id="Telefono"></i>
                            <section class="inpt_ing_cont h-50" id="inpt_tel">
                                <input type="tel" placeholder="<%=telefono%>" name="telefono" >
                                <span class="error">${error_telefono_Vacio}</span>
                                <span class="error">${error_telefono_Invalido}</span>
                                <button type="button"><i class="bi bi-check-circle" id="confirm_btn"></i></button>
                            </section>
                        </section>
                        <section class="d-flex justify-content-center align-items-center">
                            <i class="bi bi-envelope-fill contactos_usu_perfil" id="Email"></i>
                            <section class="inpt_ing_cont h-50" id="inpt_ema">
                                <input type="email" placeholder="<%=correo%>" name="correo" >
                                <span class="error">${error_correo_Vacio}</span>
                                <span class="error">${error_correo_Invalido}</span>
                                <button type="button"><i class="bi bi-check-circle" id="confirm_btn"></i></button>
                            </section>
                        </section>
                        <section class="d-flex justify-content-center align-items-center">
                            <i class="bi bi-facebook contactos_usu_perfil" id="Facebook"></i>
                            <section class="inpt_ing_cont h-50" id="inpt_face">
                                <input type="text" placeholder="<%=fb%>" name="fb" >
                                <button type="button"><i class="bi bi-check-circle" id="confirm_btn"></i></button>
                            </section>
                        </section>
                        <section class="d-flex justify-content-center align-items-center">
                            <i class="bi bi-instagram contactos_usu_perfil" id="Instagram"></i>
                            <section class="inpt_ing_cont h-50" id="inpt_inst">
                                <input type="text" placeholder="<%=ig%>" name="ig" >
                                <button type="button"><i class="bi bi-check-circle" id="confirm_btn"></i></button>
                            </section>
                        </section>
                        <section class="d-flex justify-content-center align-items-center">
                            <i class="bi bi-twitter contactos_usu_perfil" id="Twitter"></i>
                            <section class="inpt_ing_cont h-50" id="inpt_twit">
                                <input type="text" placeholder="<%=tw%>" name="tw">
                                <button type="button"><i class="bi bi-check-circle" id="confirm_btn"></i></button>
                            </section>
                        </section>
                        <section class="d-flex justify-content-center align-items-center">
                            <i class="bi bi-globe2 contactos_usu_perfil" id="Web"></i>
                            <section class="inpt_ing_cont h-50" id="inpt_web">
                                <input type="text" placeholder="<%=web%>" name="web" >
                                <button type="button"><i class="bi bi-check-circle" id="confirm_btn"></i></button>
                            </section>
                        </section>
                    </div>
                </div>
                <div class="botones d-flex justify-content-between">
                    <button type="button" class="btn btn_negro btn-outline-dark">Salir</button>
                    <button type="submit" id="btnsubmit" class="btn btn_negro btn-outline-dark" >Guardar Cambios</button>
                </div>
            </div>

            <div class="elementos-derecha">
                <input type="file" name="" id="inpt_file_img_perf">
                <div class="cont-img" id="nue_img">
                    <img class="img" src="<%=foto%>" alt="" id="nimg_most">
                    <i class="bi bi-image icon_img_most" id="icon_img_most"></i>
                </div>
            </div>
                    <input type="hidden" id="foto" name="foto" value=""/>
        </form>
        <script>
            // Activar todos los tooltips
            var tooltips = new bootstrap.Tooltip(document.body, {
                selector: '[data-bs-toggle="tooltip"]',
            });
        </script>
         <%
            if(request.getAttribute("mensaje")!=null) 
            {  
        %>          
                <script>
    window.onload=function() {
       alert( "Error:  <%=request.getAttribute("mensaje")%>");
    };
 </script>      
        <%
            }
                %>
                                        <%
            }else{
    System.out.println("Error: Sesión no existe");
    response.sendRedirect("index.jsp");
}
            %>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.min.js"></script>
        <script src="js/ec.js"></script>
    </body>
</html>

<%-- 
    Document   : Cuenta_Usuario
    Created on : 17 nov 2023, 9:22:55
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
        <title>Cuenta</title>
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
    
        <div class="main-container">
            <div class="elementos-izquierda">
                <div class="textos">
                    <p class="p1"><%=nombrereal%></p>
                    <p class="p2"><%=nombre%></p>
                    <p class="p3"><%=desc%></p>
                </div>
                <div class="contactos">
                    <p class="p4">Contactos</p>
                    <div class="Iconos">
                        <i class="bi bi-telephone contactos_usu_perfil" data-bs-toggle="tooltip" data-bs-placement="bottom"
                           data-bs-title="<%=telefono%>" id="Telefono"></i>
                        <i class="bi bi-envelope-fill contactos_usu_perfil" data-bs-toggle="tooltip" data-bs-placement="bottom"
                           data-bs-title="<%=correo%>"></i>
                        
                           <%
                               if(fb.equals("Sin configurar")){
                               
                               %>
                               <a href="" class="contact_red_cu2"><i class="bi bi-facebook" data-bs-toggle="tooltip" data-bs-placement="bottom"
                                                             data-bs-title="Facebok"></i></a>
                               <%
                               }else{
                               
                               %>
                        <a href="<%=fb%>" class="contact_red_cu"><i class="bi bi-facebook" data-bs-toggle="tooltip" data-bs-placement="bottom"
                                                             data-bs-title="Facebok"></i></a>
                               <%
                                   }
                                   
                               if(ig.equals("Sin configurar")){
%>
                                <a href="" class="contact_red_cu2"><i class="bi bi-instagram" data-bs-toggle="tooltip" data-bs-placement="bottom"
                                                             data-bs-title="Instagram"></i></a>
                               <%
                               }else{
                               %>
                        <a href="<%=ig%>" class="contact_red_cu"><i class="bi bi-instagram" data-bs-toggle="tooltip" data-bs-placement="bottom"
                                                             data-bs-title="Instagram"></i></a>
                              <%
                                   }
                                   
                               if(tw.equals("Sin configurar")){
 %>
                               <a href="" class="contact_red_cu2"><i class="bi bi-twitter" data-bs-toggle="tooltip" data-bs-placement="bottom"
                                                             data-bs-title="Twitter"></i></a>
                               <%
                               }else{
                               %>                               
                        <a href="<%=tw%>" class="contact_red_cu"><i class="bi bi-twitter" data-bs-toggle="tooltip" data-bs-placement="bottom"
                                                             data-bs-title="Twitter"></i></a>
                        <%
                                   }
                                   
                            if(web.equals("Sin configurar")){
 %>
                               <a href="" class="contact_red_cu2"><i class="bi bi-globe2 " data-bs-toggle="tooltip" data-bs-placement="bottom"
                                                             data-bs-title="Web"></i></a>
                               <%
                               }else{
                               %>  
                        <a href="<%=web%>" class="contact_red_cu"><i class="bi bi-globe2 " data-bs-toggle="tooltip" data-bs-placement="bottom"
                                                             data-bs-title="Web"></i></a>
                         <%
                                   }
                                   
                            
                               %>  
                    </div>
                </div>
                <div class="botones">
                    <a href="Mis_Comentarios.html"><button class="btn btn_negro btn-outline-dark">Reseñas
                            Hechas</button></a>
                    <a href="GuardadosCV.jsp"><button class="btn btn_negro btn-outline-dark">Guardados</button></a>
                    <a href="Editar_CuentaCV.jsp"><button class="btn btn_negro btn-outline-dark">Editar Datos</button></a>
                </div>
            </div>

            <div class="elementos-derecha">
                <div class="cont-img">
                    <img class="img" src="<%=foto%>" alt="">
                </div>
            </div>

        </div>
        <script>
            // Activar todos los tooltips
            var tooltips = new bootstrap.Tooltip(document.body, {
                selector: '[data-bs-toggle="tooltip"]',
            });
        </script>
                <%
            }else{
    System.out.println("Error: Sesión no existe");
    response.sendRedirect("index.jsp");
}
            %>
        <script src="js/cv.js"></script>
    </body>
</html>

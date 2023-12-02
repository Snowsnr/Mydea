<%-- 
    Document   : CrearNegocio_Info
    Created on : 8 nov 2023, 10:02:05
    Author     : altro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
      <%
    HttpSession session1 = request.getSession(false);
    if (session1.getAttribute("usuario") != null) {

    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="templates/Referencias/Todas_Ref.jsp"/>
        <title>Difunde tú Negocio con Mydea</title>
    </head>
    <body>
        <jsp:include page="templates/Navegadores/Navegador_CV.jsp"/>
        <div class="d-flex w-100 cni">
            <div class="d-flex flex-column w-75 h justify-content-center align-items-center txt_cni">
                <section class="d-flex flex-column w-75">
                    <span class="tittle_info_cn display-5">ÚNETE A MYDEA Y COMIENZA A DARLE IMPULSO A TU NEGOCIO.</span>
                    <span class="info_cn text-sm Inria">Mydea es mucho más que una plataforma; es una oportunidad para los emprendedores en la alcaldía de Xochimilco. 
                        Está diseñada para apoyar y potenciar los pequeños negocios, ofreciéndoles visibilidad, recursos y respaldo para aumentar su reconocimiento y crecimiento en la comunidad. 
                        Con Mydea, podrás expandir tu alcance, conectarte con nuevos clientes y fortalecer tu presencia en el mercado local. 
                        ¡Súmate a esta iniciativa y empieza a hacer crecer tu negocio con nosotros!</span>
                </section>
                <section class="d-flex w-75 justify-content-between">
                    <button class="btn btn-outline-dark btn_negro" id="cancel_cn">Cancelar</button>
                    <button class="btn btn_rosa text-white" id="constr_cn">Construir mi Negocio</button>
                </section>
            </div>
            <div class="d-flex flex-column justify-content-center align-items-center w-50 beneficios p-3">
                <img class="img-fluid h-50" src="assets/mydea_com.png" alt="Mydea">
                <div class="h-50 w-100 d-flex align-items-center flex-column">
                    <span class="Inria_t m-2 text-white ">¿Por qué unirte a Mydea?</span>
                    <div class="d-flex w-100 beneficio m-2">
                        <section class="d-flex h-100 w-50 m-2">
                            <svg class="w-25 h-50 p-1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512">
                            <path
                                d="M36.8 192H603.2c20.3 0 36.8-16.5 36.8-36.8c0-7.3-2.2-14.4-6.2-20.4L558.2 21.4C549.3 8 534.4 0 518.3 0H121.7c-16 0-31 8-39.9 21.4L6.2 134.7c-4 6.1-6.2 13.2-6.2 20.4C0 175.5 16.5 192 36.8 192zM64 224V384v80c0 26.5 21.5 48 48 48H336c26.5 0 48-21.5 48-48V384 224H320V384H128V224H64zm448 0V480c0 17.7 14.3 32 32 32s32-14.3 32-32V224H512z" />
                            </svg>
                            <span class="txt_cni text-white w-75 Inria">Obtendrás acceso a herramientas y recursos clave para promover tu negocio y aumentar su visibilidad.</span>
                        </section>
                        <section class="d-flex h-100 w-50 m-2">
                            <svg class="w-25 h-50 p-1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">
                            <path
                                d="M160 112c0-35.3 28.7-64 64-64s64 28.7 64 64v48H160V112zm-48 48H48c-26.5 0-48 21.5-48 48V416c0 53 43 96 96 96H352c53 0 96-43 96-96V208c0-26.5-21.5-48-48-48H336V112C336 50.1 285.9 0 224 0S112 50.1 112 112v48zm24 48a24 24 0 1 1 0 48 24 24 0 1 1 0-48zm152 24a24 24 0 1 1 48 0 24 24 0 1 1 -48 0z" />
                            </svg>
                            <span class="txt_cni text-white w-75 Inria">Te ofrecemos una vitrina digital para mostrar tus productos de manera atractiva y efectiva.</span>
                        </section>
                    </div>
                    <div class="d-flex w-100m-2">
                        <section class="d-flex h-100 w-50 m-2">
                            <svg class="w-25 h-50 p-1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                            <path
                                d="M320 96H192L144.6 24.9C137.5 14.2 145.1 0 157.9 0H354.1c12.8 0 20.4 14.2 13.3 24.9L320 96zM192 128H320c3.8 2.5 8.1 5.3 13 8.4C389.7 172.7 512 250.9 512 416c0 53-43 96-96 96H96c-53 0-96-43-96-96C0 250.9 122.3 172.7 179 136.4l0 0 0 0c4.8-3.1 9.2-5.9 13-8.4zm84 88c0-11-9-20-20-20s-20 9-20 20v14c-7.6 1.7-15.2 4.4-22.2 8.5c-13.9 8.3-25.9 22.8-25.8 43.9c.1 20.3 12 33.1 24.7 40.7c11 6.6 24.7 10.8 35.6 14l1.7 .5c12.6 3.8 21.8 6.8 28 10.7c5.1 3.2 5.8 5.4 5.9 8.2c.1 5-1.8 8-5.9 10.5c-5 3.1-12.9 5-21.4 4.7c-11.1-.4-21.5-3.9-35.1-8.5c-2.3-.8-4.7-1.6-7.2-2.4c-10.5-3.5-21.8 2.2-25.3 12.6s2.2 21.8 12.6 25.3c1.9 .6 4 1.3 6.1 2.1l0 0 0 0c8.3 2.9 17.9 6.2 28.2 8.4V424c0 11 9 20 20 20s20-9 20-20V410.2c8-1.7 16-4.5 23.2-9c14.3-8.9 25.1-24.1 24.8-45c-.3-20.3-11.7-33.4-24.6-41.6c-11.5-7.2-25.9-11.6-37.1-15l0 0-.7-.2c-12.8-3.9-21.9-6.7-28.3-10.5c-5.2-3.1-5.3-4.9-5.3-6.7c0-3.7 1.4-6.5 6.2-9.3c5.4-3.2 13.6-5.1 21.5-5c9.6 .1 20.2 2.2 31.2 5.2c10.7 2.8 21.6-3.5 24.5-14.2s-3.5-21.6-14.2-24.5c-6.5-1.7-13.7-3.4-21.1-4.7V216z" />
                            </svg>
                            <span class="txt_cni text-white w-75 Inria">Entendemos que cada centavo cuenta en el mundo empresarial. Mydea se compromete a ofrecerte oportunidades rentables. </span>
                        </section>
                        <section class="d-flex h-100 w-50 m-2">
                            <svg class="w-25 h-50 p-1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512">
                            <path
                                d="M323.4 85.2l-96.8 78.4c-16.1 13-19.2 36.4-7 53.1c12.9 17.8 38 21.3 55.3 7.8l99.3-77.2c7-5.4 17-4.2 22.5 2.8s4.2 17-2.8 22.5l-20.9 16.2L512 316.8V128h-.7l-3.9-2.5L434.8 79c-15.3-9.8-33.2-15-51.4-15c-21.8 0-43 7.5-60 21.2zm22.8 124.4l-51.7 40.2C263 274.4 217.3 268 193.7 235.6c-22.2-30.5-16.6-73.1 12.7-96.8l83.2-67.3c-11.6-4.9-24.1-7.4-36.8-7.4C234 64 215.7 69.6 200 80l-72 48V352h28.2l91.4 83.4c19.6 17.9 49.9 16.5 67.8-3.1c5.5-6.1 9.2-13.2 11.1-20.6l17 15.6c19.5 17.9 49.9 16.6 67.8-2.9c4.5-4.9 7.8-10.6 9.9-16.5c19.4 13 45.8 10.3 62.1-7.5c17.9-19.5 16.6-49.9-2.9-67.8l-134.2-123zM16 128c-8.8 0-16 7.2-16 16V352c0 17.7 14.3 32 32 32H64c17.7 0 32-14.3 32-32V128H16zM48 320a16 16 0 1 1 0 32 16 16 0 1 1 0-32zM544 128V352c0 17.7 14.3 32 32 32h32c17.7 0 32-14.3 32-32V144c0-8.8-7.2-16-16-16H544zm32 208a16 16 0 1 1 32 0 16 16 0 1 1 -32 0z" />
                            </svg>
                            <span class="txt_cni text-white w-75 Inria">Te ofrecemos la oportunidad de alcanzar nuevos clientes en cualquier parte de la Ciudad de México.</span>
                        </section>
                    </div>
                </div>
            </div>
        </div>
        <script>
            // Activar todos los tooltips
            var tooltips = new bootstrap.Tooltip(document.body, {
                selector: '[data-bs-toggle="tooltip"]'
            });
        </script>
        <%
            }else{
    System.out.println("Error: Sesión no existe");
    response.sendRedirect("index.jsp");
}
            %>
        <script src="js/Nav.js"></script>
        <script src="js/cni.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </body>
</html>

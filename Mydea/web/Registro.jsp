<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="templates/Referencias/Todas_Ref.jsp"/>

        <title>Se parte de MYDEA</title>
    </head>
    <body>
        <jsp:include page="templates/Navegadores/Navegador_SC.jsp"/>
        <div class="content_registro d-flex flex-column justify-content-between" data-aos="fade-up">
            <section class="color1_reg deslizari"></section>
            <section class="color2_reg deslizari"></section>
            <form class="w-100 container_reg align-items-center justify-content-center flex-column subir" method="post" action="Registro">
                <div class="reg_form_container justify-content-between align-items-center">
                    <section class="Txt_reg d-flex flex-column justify-content-center align-items-center">
                        <span>BIENVENIDO.</span>
                        <span>Ya estás un paso más cerca de formar parte de la enorme comunidad de MYDEA.<br> Por favor complete los campos solicitados para terminar su registro.</span>
                    </section>
                    <ul class="d-flex list_inp_reg justify-content-around">
                        <li><label for="Nom_com_reg">Nombre Completo</label><input value="${valorNombreP}" type="text" id="Nom_com_reg" name="Nom_com_reg" class="form-control" placeholder=" Nombre Completo">
                            <span class="error">${error_nombreCompleto_Vacio}</span>
                            <span class="error">${error_nombreCompleto_Largo}</span>
                            <span class="error">${error_nombreCompleto_Invalido}</span></li>
                        <li><label for="Nom_usu_reg">Nombre de Usuario</label><input value="${valorNombreU}" type="text" id="Nom_usu_reg" name="Nom_usu_reg" class="form-control" placeholder=" Nombre de Usuario">
                            <span class="error">${error_nombreUsuario_Vacio}</span>
                            <span class="error">${error_nombreUsuario_Largo}</span>
                        </li>
                        <li><label for="Email_reg">Correo Electrónico</label><input value="${valorCorreo}" type="email" id="Email_reg" name="Email_reg" class="form-control" placeholder=" Correo Electronico">
                            <span class="error">${error_correo_Vacio}</span>
                            <span class="error">${error_correo_Invalido}</span>
                        </li>
                        <li><label for="Num_reg">Número Telefónico</label><input value="${valorTelefono}" type="tel" id="Num_reg" name="Num_reg" class="form-control" placeholder=" Numero Telefonico" autocomplete="new-password">
                            <span class="error">${error_telefono_Vacio}</span>
                            <span class="error">${error_telefono_Invalido}</span>
                        </li>
                        <li><label for="Con_reg">Contraseña</label><input value="${valorPassword}" type="password" class="form-control" placeholder=" Ingresar" id="Con_reg" name="Con_reg" autocomplete="new-password">
                            <span class="error">${error_contraseña_Vacio}</span>
                            <span class="error">${error_contraseña_Invalido}</span>
                        </li>
                        <li><label for="ConCon_reg">Confirmar Contraseña</label><input value="${valorCpassword}" type="password" class="form-control" placeholder=" Confirmar" id="ConCon_reg" name="ConCon_reg">
                            <span class="error">${error_confirmarContraseña_Vacio}</span>
                            <span class="error">${error_confirmarContraseña_Invalido}</span>
                        </li>   
                    </ul>
                    <select class="form-select" aria-label="Default select example" id="TP_cnf" name="Tipo" >
                        <option selected disabled hidden>
                            Seleccione su Tipo de Cuenta
                        </option>
                        <option value="1" ${valorTipoCuenta == '1' ? 'selected' : ''}>Cuenta Común</option>
                        <option value="2" ${valorTipoCuenta == '2' ? 'selected' : ''}>Cuenta Vendedor</option>
                    </select>
                    <span class="error">${error_tipoCuenta_Invalido}</span>
                    <ul class="d-flex w-100 justify-content-around avisos">
                        <li><input type="checkbox" id="TyC_reg" name="TyC_reg" ${not empty requestScope.valorTyC ? 'checked' : ''}><a href="Avisos.jsp"><span>Aceptar Términos y Condiciones</span></a></li>
                        <li><input type="checkbox" id="AP_reg" name="AP_reg"><a href="Avisos.jsp" ${not empty requestScope.valorAP ? 'checked' : ''}><span>Aceptar Aviso de Privacidad</span></a></li>
                    </ul>        
                    <span class="error">${error_TyC_Vacio}</span>
                    <span class="error">${error_AP_Vacio}</span>
                    
                    <span>¿Ya tienes una cuenta? <a href="Iniciar_Sesion.jsp" class="txt_or">Iniciar Sesión</a> </span>

                </div>
                <button class="btn btns_reg" id="btns_reg" type="submit">
                    Registrarse
                </button>
            </form>
        </div>
        <%
            if (request.getAttribute("mensaje") != null)
            {
        %>          
        <script>
            window.onload = function () {
                alert("Error:  <%=request.getAttribute("mensaje")%>");
            };
        </script>      
        <%
            }
        %>
        <script src="js/Nav.js"></script>
        <script src="js/reg.js"></script>
    </body>
</html>

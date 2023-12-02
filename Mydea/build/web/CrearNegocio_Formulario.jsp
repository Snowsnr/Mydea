<%-- 
    Document   : CrearNEgocio_Formulario
    Created on : 12 nov 2023, 19:38:27
    Author     : altro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
  <%
    HttpSession session1 = request.getSession(false);
    if (session1.getAttribute("usuario") != null) {

    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="templates/Referencias/Todas_Ref.jsp"/>
        <title>Sube tu Negocio!</title>
    </head>
    <jsp:include page="templates/Navegadores/Navegador_CV.jsp"/>
    <body>


        <div class="d-flex flex-column w-100 justify-content-between cnf1 Inria">
            <section class="color1"></section>
            <section class="color2"></section>
            <div class="content_form w-100">
                <section class="d-flex text-white align-items-center p1_cnf">
                    <span class="txt_prin_cnf fw-bolder">¡EMPECEMOS!</span>
                    <i class="bi bi-question-circle quicon_cnf_lg" data-bs-toggle="tooltip" data-bs-placement="right"
                       data-bs-title="Tooltip on right"></i>
                </section>
                <div class="p2_cnf d-flex flex-column" method="post" id="FORM_CNF">
                    <section class="d-flex p21_cnf">
  
                        
                        
                                                                                          <%
            if(request.getAttribute("neid")!=null || request.getParameter("neid")!=null){  
        %>                             
        <button type="button" class="btn text-white btn_nav_cnf bg-dark" id="Btn_DtNg" disabled>
                            Datos del Negocio
                        </button>
                             <%
            }else{
                %>
                        
                    <button type="button" class="btn text-white btn_nav_cnf bg-dark" id="Btn_DtNg">
                            Datos del Negocio
                        </button>
                
                <%
                    }
                    %>
                    
                        <button type="button" class="btn btn_nav_cnf btn_nav_cnf_btn2 btn_APro" id="Btn_AnadirP">
                            Añadir Productos y/o Servicios
                        </button>
                    </section>
                    <div class="p22_cnf p-4 pt-3">
                        <span class="dt_txt_cnf" id="dt_txt_cnf">Datos de Negocio</span>
                        <form class="form_cnf Datos_Negocio" id="Datos_Negocio" action="CrearNegocio" enctype="multipart/form-data">
                            <!--Parte 1-->
                            <section class="p221_cnf d-flex flex-column justify-content-between">
                                <section>
                                    <span class="fw-bold">Nombre del Negocio
                                        <i class="bi bi-question-circle" data-bs-toggle="tooltip" data-bs-placement="right"
                                           data-bs-title="Tooltip on right"></i></span>
                                    <input type="text" class="form-control" placeholder="Nombre de su negocio" id="N_Neg_cnf" name="N_Neg_cnf" value="${valorNombreNegocio}" />
                                    <span class="error">${error_nombreNegocio_Vacio}</span>
                                    <span class="error">${error_nombreNegocio_Largo}</span>
                                </section>                                
                                <section>
                                    <span class="fw-bold">Tipo de Negocio
                                        <i class="bi bi-question-circle" data-bs-toggle="tooltip" data-bs-placement="right"
                                           data-bs-title="Tooltip on right"></i></span>
                                    <select class="form-select" aria-label="Default select example" id="TP_cnf" name="TP_cnf" >
                                        <option selected disabled hidden>
                                            Seleccione su Tipo de Negocio
                                        </option>
                                        <option value="Abarrotes" ${valorTipoNegocio == 'Abarrotes' ? 'selected' : ''}>Abarrotes</option>
                                        <option value="Materia_Prima" ${valorTipoNegocio == 'Materia_Prima' ? 'selected' : ''}>Materia Prima</option>
                                        <option value="Restaurantes" ${valorTipoNegocio == 'Restaurantes' ? 'selected' : ''}>Restaurantes</option>
                                        <option value="SyP" ${valorTipoNegocio == 'SyP' ? 'selected' : ''}>Snacks y Postres</option>
                                        <option value="Cafetería" ${valorTipoNegocio == 'Cafeteria' ? 'selected' : ''}>Cafetería</option>
                                        <option value="Catering" ${valorTipoNegocio == 'Catering' ? 'selected' : ''}>Catering</option>
                                        <option value="Panaderia" ${valorTipoNegocio == 'Panaderia' ? 'selected' : ''}>Panadería</option>
                                        <option value="OyF" ${valorTipoNegocio == 'OyF' ? 'selected' : ''}>Venta de Ortalizas o frutas</option>
                                        <option value="Otro" ${valorTipoNegocio == 'Otro' ? 'selected' : ''}>Otro</option>
                                    </select>
                                    <span class="error">${error_tipoNegocio_Invalido}</span>
                                </section>
                                <!--HORARIOS-->
                                <div class="d-flex flex-column horarios_cnf">
                                    <span class="fw-bold">Horarios
                                        <i class="bi bi-question-circle" data-bs-toggle="tooltip" data-bs-placement="right"
                                           data-bs-title="Tooltip on right"></i></span>
                                    <section class="d-flex h_cnf justify-content-between">
                                        <div class="line_cnf"></div>
                                        <ul class="h-100 d-flex flex-column justify-content-between ds_cnf">
                                            <li class="form-check">
                                                <input class="form-check-input" type="radio" name="flexRadioDefault" id="lunes" checked />
                                                <label class="form-check-label" for="lunes">
                                                    Lunes
                                                </label>
                                            </li>
                                            <li class="form-check">
                                                <input class="form-check-input" type="radio" name="flexRadioDefault" id="martes" />
                                                <label class="form-check-label" for="martes">
                                                    Martes
                                                </label>
                                            </li>
                                            <li class="form-check">
                                                <input class="form-check-input" type="radio" name="flexRadioDefault" id="miercoles" />
                                                <label class="form-check-label" for="miercoles">
                                                    Miércoles
                                                </label>
                                            </li>
                                            <li class="form-check">
                                                <input class="form-check-input" type="radio" name="flexRadioDefault" id="jueves" />
                                                <label class="form-check-label" for="jueves">
                                                    Jueves
                                                </label>
                                            </li>
                                            <li class="form-check">
                                                <input class="form-check-input" type="radio" name="flexRadioDefault" id="viernes" />
                                                <label class="form-check-label" for="viernes">
                                                    Viernes
                                                </label>
                                            </li>
                                            <li class="form-check">
                                                <input class="form-check-input" type="radio" name="flexRadioDefault" id="sabado" />
                                                <label class="form-check-label" for="sabado">
                                                    Sábado
                                                </label>
                                            </li>
                                            <li class="form-check">
                                                <input class="form-check-input" type="radio" name="flexRadioDefault" id="domingo" />
                                                <label class="form-check-label" for="domingo">
                                                    Domingo
                                                </label>
                                            </li>
                                        </ul>
                                        <div class="inph_cnf">
                                            <!--Horas Lunes-->
                                            <% 
                                            String cerr_lun = (String) request.getAttribute("cerr_lun"); 
                                            String she_lun = (String) request.getAttribute("she_lun"); 
                                            %>
                                            <section class="inpb_cnf flex-column justify-content-evenly align-items-center" id="hlunes_cnf">
                                                <section class="d-flex flex-column">
                                                    <label for="Abierto_L">Hora de Apertura
                                                        <i class="bi bi-question-circle" data-bs-toggle="tooltip" data-bs-placement="right"
                                                           data-bs-title="Tooltip on right"></i></label>
                                                    <input type="time" class="form-control" id="Abierto_L" name="Abierto_L" value="${valor_horaApertura_L}" />
                                                    <label for="Cerrado_L">Hora de Cierre
                                                        <i class="bi bi-question-circle" data-bs-toggle="tooltip" data-bs-placement="right"
                                                           data-bs-title="Tooltip on right"></i></label>
                                                    <input type="time" class="form-control" id="Cerrado_L" name="Cerrado_L" value="${valor_horaCierre_L}" />                                                    
                                                </section>
                                                <section class="d-flex">
                                                    <section class="d-flex">
                                                        <input type="checkbox" class="btn text-white" id="cerr_lun" name="cerr_lun" value="lun_cerr" <% if ("lun_cerr".equals(request.getAttribute("cerr_lun"))) { %> checked <% } %>/><label
                                                            for="cerr_lun" class="radio_hc">Día Cerrado</label>
                                                    </section>
                                                    <section class="d-flex">
                                                        <input type="checkbox" class="btn text-white" id="she_lun" name="she_lun" value="lun_snhor" <% if ("lun_snhor".equals(request.getAttribute("she_lun"))) { %> checked <% } %>/><label
                                                            for="she_lun" class="radio_hs">Sin Horario Específico</label>
                                                    </section>
                                                </section>
                                                <span class="error" id="error">${error_horarioLunes_Vacio}</span>
                                                <span class="error" id="error">${error_horarioMartes_Vacio}</span>
                                                <span class="error" id="error">${error_horarioMiercoles_Vacio}</span>
                                                <span class="error" id="error">${error_horarioJueves_Vacio}</span>
                                                <span class="error" id="error">${error_horarioViernes_Vacio}</span>
                                                <span class="error" id="error">${error_horarioSabado_Vacio}</span>
                                                <span class="error" id="error">${error_horarioDomingo_Vacio}</span>
                                            </section>
                                            <!--Horas Martes-->
                                            <% 
                                            String cerr_mar = (String) request.getAttribute("cerr_mar"); 
                                            String she_mar = (String) request.getAttribute("she_mar"); 
                                            %>
                                            <section class="inpb_cnf flex-column justify-content-evenly align-items-center" id="hmartes_cnf">
                                                <!--Horas Martes-->
                                                <section class="d-flex flex-column">
                                                    <label for="Abierto_M">Hora de Apertura
                                                        <i class="bi bi-question-circle" data-bs-toggle="tooltip" data-bs-placement="right"
                                                           data-bs-title="Tooltip on right"></i></label>
                                                    <input type="time" class="form-control" id="Abierto_M" name="Abierto_M" value="${valor_horaApertura_M}" />
                                                    <label for="Cerrado_M">Hora de Cierre
                                                        <i class="bi bi-question-circle" data-bs-toggle="tooltip" data-bs-placement="right"
                                                           data-bs-title="Tooltip on right"></i></label>
                                                    <input type="time" class="form-control" id="Cerrado_M" name="Cerrado_M" value="${valor_horaCierre_M}" />
                                                </section>
                                                <!--Botones Martes-->
                                                <section class="d-flex">
                                                    <section class="d-flex">
                                                        <input type="checkbox" class="btn btn_rosa text-white" id="cerr_mar" name="cerr_mar" value="mar_cerr" <% if ("mar_cerr".equals(request.getAttribute("cerr_mar"))) { %> checked <% } %>/><label
                                                            for="cerr_mar" class="radio_hc">Día Cerrado</label>
                                                    </section>
                                                    <section class="d-flex">
                                                        <input type="checkbox" class="btn btn_rosa text-white" id="she_mar" name="she_mar" value="mar_snhor" <% if ("mar_snhor".equals(request.getAttribute("she_mar"))) { %> checked <% } %>/><label
                                                            for="she_mar" class="radio_hs">Sin Horario Específico</label>
                                                    </section>
                                                </section>
                                                <span class="error" id="error">${error_horarioLunes_Vacio}</span>
                                                <span class="error" id="error">${error_horarioMartes_Vacio}</span>
                                                <span class="error" id="error">${error_horarioMiercoles_Vacio}</span>
                                                <span class="error" id="error">${error_horarioJueves_Vacio}</span>
                                                <span class="error" id="error">${error_horarioViernes_Vacio}</span>
                                                <span class="error" id="error">${error_horarioSabado_Vacio}</span>
                                                <span class="error" id="error">${error_horarioDomingo_Vacio}</span>
                                            </section>
                                            <!--Horas Miercoles-->
                                            <% 
                                            String cerr_mie = (String) request.getAttribute("cerr_mie"); 
                                            String she_mie = (String) request.getAttribute("she_mie"); 
                                            %>
                                            <section class="inpb_cnf flex-column justify-content-evenly align-items-center" id="hmiercoles_cnf">
                                                <!--Horas Miercoles-->
                                                <section class="d-flex flex-column">
                                                    <label for="Abierto_Mi">Hora de Apertura <i class="bi bi-question-circle"
                                                                                                data-bs-toggle="tooltip" data-bs-placement="right"
                                                                                                data-bs-title="Tooltip on right"></i></label>
                                                    <input type="time" class="form-control" id="Abierto_Mi" name="Abierto_Mi" value="${valor_horaApertura_Mie}"/>
                                                    <label for="Cerrado_Mi">Hora de Cierre
                                                        <i class="bi bi-question-circle" data-bs-toggle="tooltip" data-bs-placement="right"
                                                           data-bs-title="Tooltip on right"></i></label>
                                                    <input type="time" class="form-control" id="Cerrado_Mi" name="Cerrado_Mi" value="${valor_horaCierre_Mie}" />
                                                </section>
                                                <!--Botones Miercoles-->
                                                <section class="d-flex">
                                                    <section class="d-flex">
                                                        <input type="checkbox" class="btn btn_rosa text-white" id="cerr_mie" name="cerr_mie" value="mie_cerr" <% if ("mie_cerr".equals(request.getAttribute("cerr_mie"))) { %> checked <% } %>/><label
                                                            for="cerr_mie" class="radio_hc">Día Cerrado</label>
                                                    </section>
                                                    <section class="d-flex">
                                                        <input type="checkbox" class="btn btn_rosa text-white" id="she_mie" name="she_mie" value="mie_snhor" <% if ("mie_snhor".equals(request.getAttribute("she_mie"))) { %> checked <% } %>/><label
                                                            for="she_mie" class="radio_hs">Sin Horario Específico</label>
                                                    </section>
                                                </section>
                                                <span class="error" id="error">${error_horarioLunes_Vacio}</span>
                                                <span class="error" id="error">${error_horarioMartes_Vacio}</span>
                                                <span class="error" id="error">${error_horarioMiercoles_Vacio}</span>
                                                <span class="error" id="error">${error_horarioJueves_Vacio}</span>
                                                <span class="error" id="error">${error_horarioViernes_Vacio}</span>
                                                <span class="error" id="error">${error_horarioSabado_Vacio}</span>
                                                <span class="error" id="error">${error_horarioDomingo_Vacio}</span>
                                            </section>
                                            <!--Horas Jueves-->
                                            <% 
                                            String cerr_jue = (String) request.getAttribute("cerr_jue"); 
                                            String she_jue = (String) request.getAttribute("she_jue"); 
                                            %>
                                            <section class="inpb_cnf flex-column justify-content-evenly align-items-center" id="hjueves_cnf">
                                                <!--Horas Jueves-->
                                                <section class="d-flex flex-column">
                                                    <label for="Abierto_J">Hora de Apertura
                                                        <i class="bi bi-question-circle" data-bs-toggle="tooltip" data-bs-placement="right"
                                                           data-bs-title="Tooltip on right"></i></label>
                                                    <input type="time" class="form-control" id="Abierto_J" name="Abierto_J" value="${valor_horaApertura_J}"/>
                                                    <label for="Cerrado_J">Hora de Cierre
                                                        <i class="bi bi-question-circle" data-bs-toggle="tooltip" data-bs-placement="right"
                                                           data-bs-title="Tooltip on right"></i></label>
                                                    <input type="time" class="form-control" id="Cerrado_J" name="Cerrado_J" value="${valor_horaApertura_J}"/>
                                                </section>
                                                <!--Botones Jueves-->
                                                <section class="d-flex">
                                                    <section class="d-flex">
                                                        <input type="checkbox" class="btn btn_rosa text-white" id="cerr_jue" name="cerr_jue" value="jue_cerr" <% if ("jue_cerr".equals(request.getAttribute("cerr_jue"))) { %> checked <% } %>/><label
                                                            for="cerr_jue" class="radio_hc">Día Cerrado</label>
                                                    </section>
                                                    <section class="d-flex">
                                                        <input type="checkbox" class="btn btn_rosa text-white" id="she_jue" name="she_jue" value="jue_snhor" <% if ("jue_snhor".equals(request.getAttribute("she_jue"))) { %> checked <% } %>/><label
                                                            for="she_jue" class="radio_hs">Sin Horario Específico</label>
                                                    </section>
                                                </section>
                                                <span class="error" id="error">${error_horarioLunes_Vacio}</span>
                                                <span class="error" id="error">${error_horarioMartes_Vacio}</span>
                                                <span class="error" id="error">${error_horarioMiercoles_Vacio}</span>
                                                <span class="error" id="error">${error_horarioJueves_Vacio}</span>
                                                <span class="error" id="error">${error_horarioViernes_Vacio}</span>
                                                <span class="error" id="error">${error_horarioSabado_Vacio}</span>
                                                <span class="error" id="error">${error_horarioDomingo_Vacio}</span>
                                            </section>
                                            <!--Horas Viernes-->
                                            <% 
                                            String cerr_vie = (String) request.getAttribute("cerr_vie"); 
                                            String she_vie = (String) request.getAttribute("she_vie"); 
                                            %>
                                            <section class="inpb_cnf flex-column justify-content-evenly align-items-center" id="hviernes_cnf">
                                                <!--Horas Viernes-->
                                                <section class="d-flex flex-column">
                                                    <label for="Abierto_V">Hora de Apertura
                                                        <i class="bi bi-question-circle" data-bs-toggle="tooltip" data-bs-placement="right"
                                                           data-bs-title="Tooltip on right"></i></label>
                                                    <input type="time" class="form-control" id="Abierto_V" name="Abierto_V" value="${valor_horaApertura_V}"/>
                                                    <label for="Cerrado_V">Hora de Cierre
                                                        <i class="bi bi-question-circle" data-bs-toggle="tooltip" data-bs-placement="right"
                                                           data-bs-title="Tooltip on right"></i></label>
                                                    <input type="time" class="form-control" id="Cerrado_V" name="Cerrado_V" value="${valor_horaApertura_V}"/>
                                                </section>
                                                <!--Botones Viernes-->
                                                <section class="d-flex">
                                                    <section class="d-flex">
                                                        <input type="checkbox" class="btn btn_rosa text-white" id="cerr_vie" name="cerr_vie" value="vie_cerr" <% if ("vie_cerr".equals(request.getAttribute("cerr_vie"))) { %> checked <% } %>/><label
                                                            for="cerr_vie" class="radio_hc">Día Cerrado</label>
                                                    </section>
                                                    <section class="d-flex">
                                                        <input type="checkbox" class="btn btn_rosa text-white" id="she_vie" name="she_vie" value="vie_snhor" <% if ("vie_snhor".equals(request.getAttribute("she_vie"))) { %> checked <% } %>/><label
                                                            for="she_vie" class="radio_hs">Sin Horario Específico</label>
                                                    </section>
                                                </section>
                                                <span class="error" id="error">${error_horarioLunes_Vacio}</span>
                                                <span class="error" id="error">${error_horarioMartes_Vacio}</span>
                                                <span class="error" id="error">${error_horarioMiercoles_Vacio}</span>
                                                <span class="error" id="error">${error_horarioJueves_Vacio}</span>
                                                <span class="error" id="error">${error_horarioViernes_Vacio}</span>
                                                <span class="error" id="error">${error_horarioSabado_Vacio}</span>
                                                <span class="error" id="error">${error_horarioDomingo_Vacio}</span>
                                            </section>
                                            <!--Horas Sabado-->
                                            <% 
                                            String cerr_sab = (String) request.getAttribute("cerr_sab"); 
                                            String she_sab = (String) request.getAttribute("she_sab"); 
                                            %>
                                            <section class="inpb_cnf flex-column justify-content-evenly align-items-center" id="hsabado_cnf">
                                                <!--Horas Sabado-->
                                                <section class="d-flex flex-column">
                                                    <label for="Abierto_S">Hora de Apertura
                                                        <i class="bi bi-question-circle" data-bs-toggle="tooltip" data-bs-placement="right"
                                                           data-bs-title="Tooltip on right"></i></label>
                                                    <input type="time" class="form-control" id="Abierto_S" name="Abierto_S" value="${valor_horaApertura_S}"/>
                                                    <label for="Cerrado_S">Hora de Cierre
                                                        <i class="bi bi-question-circle" data-bs-toggle="tooltip" data-bs-placement="right"
                                                           data-bs-title="Tooltip on right"></i></label>
                                                    <input type="time" class="form-control" id="Cerrado_S" name="Cerrado_S"value="${valor_horaApertura_S}"/>
                                                </section>
                                                <!--Botones Sabado-->
                                                <section class="d-flex">
                                                    <section class="d-flex">
                                                        <input type="checkbox" class="btn btn_rosa text-white" id="cerr_sab"name="cerr_sab" value="sab_cerr" <% if ("sab_cerr".equals(request.getAttribute("cerr_sab"))) { %> checked <% } %>/><label
                                                            for="cerr_sab" class="radio_hc">Día Cerrado</label>
                                                    </section>
                                                    <section class="d-flex">
                                                        <input type="checkbox" class="btn btn_rosa text-white" id="she_sab" name="she_sab" value="sab_snhor" <% if ("sab_snhor".equals(request.getAttribute("she_sab"))) { %> checked <% } %>/><label
                                                            for="she_sab" class="radio_hs">Sin Horario Específico</label>
                                                    </section>
                                                </section>
                                                <span class="error" id="error">${error_horarioLunes_Vacio}</span>
                                                <span class="error" id="error">${error_horarioMartes_Vacio}</span>
                                                <span class="error" id="error">${error_horarioMiercoles_Vacio}</span>
                                                <span class="error" id="error">${error_horarioJueves_Vacio}</span>
                                                <span class="error" id="error">${error_horarioViernes_Vacio}</span>
                                                <span class="error" id="error">${error_horarioSabado_Vacio}</span>
                                                <span class="error" id="error">${error_horarioDomingo_Vacio}</span>
                                            </section>
                                            <!--Horas Domingo-->
                                            <% 
                                            String cerr_dom = (String) request.getAttribute("cerr_dom"); 
                                            String she_dom = (String) request.getAttribute("she_dom"); 
                                            %>
                                            <section class="inpb_cnf flex-column justify-content-evenly align-items-center" id="hdomingo_cnf">
                                                <!--Horas Domingo-->
                                                <section class="d-flex flex-column">
                                                    <label for="Abierto_D">Hora de Apertura
                                                        <i class="bi bi-question-circle" data-bs-toggle="tooltip" data-bs-placement="right"
                                                           data-bs-title="Tooltip on right"></i></label>
                                                    <input type="time" class="form-control" id="Abierto_D"  name="Abierto_D" value="${valor_horaApertura_D}"/>
                                                    <label for="Cerrado_D">Hora de Cierre
                                                        <i class="bi bi-question-circle" data-bs-toggle="tooltip" data-bs-placement="right"
                                                           data-bs-title="Tooltip on right"></i></label>
                                                    <input type="time" class="form-control" id="Cerrado_D" nae="Cerrado_D" value="${valor_horaApertura_D}"/>
                                                </section>
                                                <!--Botones Domingo-->
                                                <section class="d-flex">
                                                    <section class="d-flex">
                                                        <input type="checkbox" class="btn btn_rosa text-white" id="cerr_dom" name="cerr_dom" value="dom_cerr" <% if ("dom_cerr".equals(request.getAttribute("cerr_dom"))) { %> checked <% } %>/><label
                                                            for="cerr_dom" class="radio_hc">Día Cerrado</label>
                                                    </section>
                                                    <section class="d-flex">
                                                        <input type="checkbox" class="btn btn_rosa text-white" id="she_dom" name="she_dom" value="dom_snhor" <% if ("dom_snhor".equals(request.getAttribute("she_dom"))) { %> checked <% } %>/><label
                                                            for="she_dom" class="radio_hs">Sin Horario Específico</label>
                                                    </section>
                                                </section>
                                                <span class="error" id="error">${error_horarioLunes_Vacio}</span>
                                                <span class="error" id="error">${error_horarioMartes_Vacio}</span>
                                                <span class="error" id="error">${error_horarioMiercoles_Vacio}</span>
                                                <span class="error" id="error">${error_horarioJueves_Vacio}</span>
                                                <span class="error" id="error">${error_horarioViernes_Vacio}</span>
                                                <span class="error" id="error">${error_horarioSabado_Vacio}</span>
                                                <span class="error" id="error">${error_horarioDomingo_Vacio}</span>
                                            </section>
                                        </div>
                                    </section>
                                </div>
                            </section>
                            <!--Parte 2-->
                            <section class="p222_cnf d-flex flex-column justify-content-between">
                                <div class="lyd d-flex justify-content-center align-items-center">
                                    <div class="log_cnf d-flex flex-column justify-content-center align-items-center">
                                        <span class="fw-bold">Logo del Negocio
                                            <i class="bi bi-question-circle" data-bs-toggle="tooltip" data-bs-placement="right"
                                               data-bs-title="Tooltip on right"></i></span>
                                        <section class="Logo_Prev" id="Logo_Prev">
                                            <img src="" alt="Logo" id="Prev_Log" class="Prev_Log" />
                                            <input type="file" class="d-none" name="logo_cnf" id="logo_cnf" accept="image/png, image/jpeg"/>
                                            <i class="bi bi-image Plus_L" id="Plus_L"></i>
                                        </section>
                                        <span class="error">${error_logo_vacio}</span>
                                    </div>
                                    <section class="d-flex flex-column dec_cnf">
                                        <span class="fw-bold">Descripción del Negocio
                                            <i class="bi bi-question-circle" data-bs-toggle="tooltip" data-bs-placement="right"
                                               data-bs-title="Tooltip on right"></i></span>
                                        <textarea class="form-control txta_cnf" name="desc" id="">${valorDescripcion}</textarea>
                                        <span class="error">${error_descripcionNegocio_Vacio}</span>
                                        <span class="error">${error_descripcionNegocio_Largo}</span>
                                    </section>
                                </div>
                                <div class="d-flex justify-content-between align-items-center bg-ob dir">
                                    <section class="d-flex flex-column h-100 justify-content-between">
                                        <span class="fw-bold">Dirección del Local
                                            <i class="bi bi-question-circle" data-bs-toggle="tooltip" data-bs-placement="right"
                                               data-bs-title="Tooltip on right"></i></span>
                                        <iframe
                                            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d120545.72792553862!2d-99.16312141549678!3d19.236478317597356!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x85ce038c6de8dea3%3A0x9b79f71fdabd5384!2sXochimilco%2C%20CDMX!5e0!3m2!1ses-419!2smx!4v1699549046798!5m2!1ses-419!2smx"
                                            width="250" height="140" allowfullscreen="" loading="lazy"
                                            referrerpolicy="no-referrer-when-downgrade"></iframe>
                                        <section>
                                            <label for="cpp">Código Postal
                                                <i class="bi bi-question-circle" data-bs-toggle="tooltip" data-bs-placement="right"
                                                   data-bs-title="Tooltip on right"></i></label>
                                            <input type="text" class="form-control" name="cpp" id="cpp" value="${valorCp}"/>
                                            <span class="error">${error_codigoPostal_Invalido}</span>
                                        </section>
                                    </section>
                                    <section class="d-flex flex-column h-100 justify-content-between">
                                        <label for="colonia">Colonia</label>
                                        <input type="text" class="form-control" id="colonia" name="colonia" value="${valorColonia}"/>
                                        <span class="error">${error_colonia_Vacio}</span>
                                        <span class="error">${error_colonia_Largo}</span>
                                        <label for="calle">Calle</label>
                                        <input type="text" class="form-control" id="calle" name="calle" value="${valorCalle}"/>
                                        <span class="error">${error_calle_Vacio}</span>
                                        <span class="error">${error_calle_Largo}</span>
                                        <label for="numero">Número</label>
                                        <input type="text" class="form-control" id="numero" name="numero" value="${valorNumero}"/>
                                        <span class="error">${error_numero_Invalido}</span>
                                        <label for="iextra">Indicaciones Extra</label>
                                        <input type="text" class="form-control" id="iextra" name="iextra" value="${valorIextra}"/>
                                        <span class="error">${error_infoExtra_Largo}</span>
                                    </section>
                                </div>
                            </section>
                            <!--Parte 3-->
                            <div class="p223_cnf">
                                <div class="container__slider">
                                    <span class="fw-bold">Imágenes del Local
                                        <i class="bi bi-question-circle" data-bs-toggle="tooltip" data-bs-placement="right"
                                           data-bs-title="Tooltip on right"></i></span>
                                    <div class="container_c">
                                        <input type="radio" name="slider" id="item-1" checked />
                                        <input type="radio" name="slider" id="item-2" />
                                        <input type="radio" name="slider" id="item-3" />

                                        <div class="cards">
                                            <label class="card" for="item-1" id="selector-1">
                                                <input type="file" class="d-none" name="inp_img1_cnf" id="inp_img1_cnf"
                                                       accept="image/png, image/jpeg" />
                                                <img src="" alt="Negocio 1" id="imagen1_neg" />
                                                <i class="bi bi-image Plus_L" id="Plus_i1"></i>
                                            </label>
                                            <label class="card" for="item-2" id="selector-2">
                                                <input type="file" class="d-none" name="inp_img2_cnf" id="inp_img2_cnf"
                                                       accept="image/png, image/jpeg" />
                                                <img src="" alt="Negocio 2" id="imagen2_neg" />
                                                <i class="bi bi-image Plus_L" id="Plus_i2"></i>
                                            </label>
                                            <label class="card" for="item-3" id="selector-3">
                                                <input type="file" class="d-none" name="inp_img3_cnf" id="inp_img3_cnf"
                                                       accept="image/png, image/jpeg" />
                                                <img src="" alt="Negocio 3" id="imagen3_neg" />
                                                <i class="bi bi-image Plus_L" id="Plus_i3"></i>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <ul class="d-flex flex-column contacts_cnf justify-content-between bg-ob">
                                    <li class="d-flex fw-bold">
                                        <span>Contactos del Local
                                            <i class="bi bi-question-circle" data-bs-toggle="tooltip" data-bs-placement="right"
                                               data-bs-title="Número Telefonico"></i></span>
                                    </li>
                                    <span class="error">${error_contactos_Vacio}</span>
                                    <!--Telefono-->
                                    <li class="d-flex ctc_l">
                                        <label for="tel_loc_cnf"><i class="bi bi-telephone-fill" data-bs-toggle="tooltip"
                                                                    data-bs-placement="right" data-bs-title="Número Telefonico (Sin espacios)"></i></label><input
                                                                        type="tel" id="tel_loc_cnf" name="tel_loc_cnf" class="form-control" value="${valorTelefono}"/>
                                                                    
                                    </li>
                                    <span class="error">${error_telefono_Invalido}</span>
                                    <!--Email-->
                                    <li class="d-flex ctc_l">
                                        <label for="mail_loc_cnf"><i class="bi bi-envelope-fill" data-bs-toggle="tooltip"
                                                                     data-bs-placement="right"
                                                                     data-bs-title="Correo Electronico (example@dominio.com)"></i></label><input type="text"
                                                                           id="mail_loc_cnf" name="mail_loc_cnf" class="form-control" value="${valorCorreo}"/>
                                    </li>
                                    <span class="error">${error_correo_Invalido}</span>
                                    <!--Facebook-->
                                    <li class="d-flex ctc_l">
                                        <label for="face_loc_cnf"><i class="bi bi-facebook" data-bs-toggle="tooltip" data-bs-placement="right"
                                                                     data-bs-title="Pagina o Cuenta de Facebook (URL)"></i></label><input type="text" id="face_loc_cnf" name="face_loc_cnf"
                                                                                                             class="form-control" value="${valorFacebook}"/>
                                    </li>
                                    <span class="error">${error_facebook_Invalido}</span>
                                    <!--Instagram-->
                                    <li class="d-flex ctc_l">
                                        <label for="inst_loc_cnf"><i class="bi bi-instagram" data-bs-toggle="tooltip"
                                                                     data-bs-placement="right" data-bs-title="Perfil de Instagram (URL)"></i></label><input type="text"
                                                                                                                               id="inst_loc_cnf" name="inst_loc_cnf" class="form-control" value="${valorInstagram}"/>
                                    </li>
                                    <span class="error">${error_instagram_Invalido}</span>
                                    <!--Twitter-->
                                    <li class="d-flex ctc_l">
                                        <label for="twit_loc_cnf"><i class="bi bi-twitter" data-bs-toggle="tooltip" data-bs-placement="right"
                                                                     data-bs-title="Perfil de Twitter (URL)"></i></label><input type="text" id="twit_loc_cnf" name="twit_loc_cnf"
                                                                                                   class="form-control" value="${valorTwitter}"/>
                                    </li>
                                    <span class="error">${error_twitter_Invalido}</span>
                                    <!--Web-->
                                    <li class="d-flex ctc_l">
                                        <label for="web_loc_cnf"><i class="bi bi-globe" data-bs-toggle="tooltip" data-bs-placement="right"
                                                                    data-bs-title="Pagina Web (URL)"></i></label><input type="text" id="web_loc_cnf" name="web_loc_cnf"
                                                                                            class="form-control" value="${valorPagina}"/>
                                    </li>
                                    <span class="error">${error_pagina_Invalido}</span>
                                </ul>
                            </div>
                            
                            <button type="submit" class="btn btn_sub_formsn " id="Btn_SubN">
                                Subir Negocio
                            </button>
                            <input type="hidden" name="img1" id="img1" value="" >
                            <input type="hidden" name="img2" id="media" value="" >
                            <input type="hidden" name="img3" id="asset" value="" >
                            <input type="hidden" name="logo" id="logo" value="" >
                            </form>
                        
                                        <form class="form_cnf Productos_cnf justify-content-between" id="Productos_cnf" action="CrearProducto" >
                            <div class="prof1_cnf d-flex flex-column">
                                <section class="d-flex w-100 h-50 justify-content-around">

                                    <section class="prof1_s1">
                                        <section class="log_cnf d-flex flex-column justify-content-center align-items-center prof1_s11">
                                            <span class="fw-bold">Imagen del Producto o Servicio
                                                <i class="bi bi-question-circle" data-bs-toggle="tooltip" data-bs-placement="right"
                                                   data-bs-title="Tooltip on right"></i></span>
                                            <section class="Logo_Prev" id="Prod_Prev">
                                                <img src="" alt="Logo" id="Prev_img_Prod" class="Prev_Log" />
                                                <input type="file" class="d-none" name="Prod_cnf" id="Prod_cnf" accept="image/png, image/jpeg" />
                                                <i class="bi bi-image Plus_L" id="Plus_Prod"></i>
                                            </section>
                                        </section>
                                    </section>
                                    <section class="prof1_s2 d-flex flex-column justify-content-around">
                                        <section>
                                            <span class="fw-bold">Nombre del Producto o Servicio
                                                <i class="bi bi-question-circle" data-bs-toggle="tooltip" data-bs-placement="right"
                                                   data-bs-title="Tooltip on right"></i></span>
                                            <input type="text" class="form-control" placeholder="Nombre de su Producto" id="Nom_Pro_inp" name="Nom_Pro_inp" value="${valorNombreP}"/>
                                            <span class="error">${error_nombreProducto_Vacio}</span>
                                            <span class="error">${error_nombreProducto_Largo}</span>
                                        </section>
                                        <section>
                                            <span class="fw-bold">Precio del Producto o Servicio
                                                <i class="bi bi-question-circle" data-bs-toggle="tooltip" data-bs-placement="right"
                                                   data-bs-title="Tooltip on right"></i></span>
                                            <input type="number" class="form-control" placeholder="Ingrese el precio de su producto"
                                                   id="Pre_Prod_inp" name="Pre_Prod_inp" value="${valorPrecio}"/>
                                            <span class="error">${error_precioProducto_Vacio}</span>
                                        </section>
                                    </section>
                                </section>
                                <section class="d-flex flex-column w-100 h-50 justify-content-around">
                                    <section class="d-flex flex-column h-50">
                                        <span class="fw-bold">Descripción del Producto o Servicio
                                            <i class="bi bi-question-circle" data-bs-toggle="tooltip" data-bs-placement="right"
                                               data-bs-title="Tooltip on right"></i></span>
                                        <textarea class="form-control txta_cnf" name="Desc_Pro_inp" id="Desc_Pro_inp" >${valorDescripcionP}</textarea>
                                        <span class="error">${error_descripcionProducto_Vacio}</span>
                                    </section>
                                    <section class="d-flex h-50 justify-content-around w-100 flex-column">
                                        <span class="fw-bold">Disponibilidad del Producto o Servicio
                                            <i class="bi bi-question-circle" data-bs-toggle="tooltip" data-bs-placement="right"
                                               data-bs-title="Tooltip on right"></i></span>
                                        <section class="d-flex h-50 w-100 justify-content-between align-items-center">
                                            <select class="form-select w-75" aria-label="Default select example" id="Tip_Pro_inp" name="Tip_Pro_inp" >
                                                <option selected disabled hidden>
                                                    Seleccione la Disponibilidad de su Producto o Servicio
                                                </option>
                                                <option value="Disponible en todo momento"${valorDisponibilidad == 'Disponible en todo momento' ? 'selected' : ''}>Disponible en todo momento</option>
                                                <option value="Por Pedido"${valorDisponibilidad == 'Por Pedido' ? 'selected' : ''}>Por Pedido</option>
                                                <option value="Mayoreo"${valorDisponibilidad == 'Mayoreo' ? 'selected' : ''}>Mayoreo</option>
                                                <option value="Solo por Unidad"${valorDisponibilidad == 'Solo por Unidad' ? 'selected' : ''}>Solo por Unidad</option>
                                                <option value="Disponible por un Tiempo"${valorDisponibilidad == 'Disponible por un Tiempo' ? 'selected' : ''}>Disponible por un Tiempo</option>
                                                <option value="Próximamente"${valorDisponibilidad == 'Proximamente' ? 'selected' : ''}>Proximamente</option>
                                            </select>
                                            <span class="error">${error_disponibilidad_Invalido}</span>
                                        </section>
                                    </section>
                                </section>
                            </div>
                            
                            <button type="submit" class="btn btn_sub_formsn " id="Btn_SubN2">
                                Subir Producto(s)
                            </button>
                            <input type="hidden" name="imgp" id="imgp" value="" >
                            
                                                                  <%
            if(request.getAttribute("neid")!=null) 
            {  
        %>                             
                            <input type="hidden" name="neid" id="neid" value="<%=request.getAttribute("neid")%>" >
                             <%
            }else if(request.getParameter("neid")!=null){
                %>
                
                <input type="hidden" name="neid" id="neid" value="<%=request.getParameter("neid")%>" >
                
                <%
                    }
%>
                        </form>
                    </div>
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
        <script src="js/Nav.js"></script>
        <script src="js/Nav_CC.js"></script>
        <script src="js/cnf.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        
    </body>
</html>

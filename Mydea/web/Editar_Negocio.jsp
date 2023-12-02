<%-- 
    Document   : Editar_Negocio
    Created on : 20 nov 2023, 23:32:55
    Author     : altro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Clases.Conexion"%>
<%@page import="Clases.Persona"%>
<%@page import="Clases.Usuario"%>
<%@page import="java.util.ArrayList" %>
<%
    HttpSession session1 = request.getSession(false);
    if (session1.getAttribute("usuario") != null) {

    %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="templates/Referencias/Todas_Ref.jsp"/>
        <title>Editando...</title>
    </head>
    <body>
        <jsp:include page="templates/Navegadores/Navegador_CV.jsp"/>
        <div class="d-flex flex-column w-100 justify-content-between cnf1 Inria">
            <%
        /*
    HttpSession misession = (HttpSession) request.getSession();
        Usuario usuario = (Usuario) misession.getAttribute("usuario");
        String nombreu = usuario.getUsu_nom();
        
        Persona per = (Persona) misession.getAttribute("persona");
        
        String foto = per.getPer_foto();
        */
        String id = request.getParameter("idn");
     

        Conexion con;
        Connection c;
        Statement stmt;
        ResultSet rs;
        String nombre = "", desc = "", dir = "", imagen1 = "", imagen2 = "", imagen3 = "", tw = "", fb = "", ig = "", web = "", tel = "", usu = "", fp="", correo="", logo="";
        String colonia="", calle="", indicaciones="";
        int cp=0, num=0;
        int neid, tipo=0, did=0;
        int i = 0;

    %>
    <%  con = new Conexion();
        con.setCon();
        c = con.getCon();
        stmt = c.createStatement();
        
        rs = stmt.executeQuery("Select n.*,d.* from Negocio n inner join Direccion d where n.dir_id=d.dir_id and n.neg_id="+id+";");
        
         while (rs.next()) {
            logo=rs.getString("neg_logo");
            nombre = rs.getString("neg_nombre");
            desc = rs.getString("neg_descripcion");
            correo=rs.getString("neg_correo");
            imagen1 = rs.getString("neg_imagen1");
            imagen2 = rs.getString("neg_imagen2");
            imagen3 = rs.getString("neg_imagen3");
            tw = rs.getString("neg_twitter");
            fb = rs.getString("neg_facebook");
            web = rs.getString("neg_web");
            tel = rs.getString("neg_telefono");
            ig=rs.getString("neg_instagram");
            tipo=rs.getInt("tem_id");
            System.out.println("Holaaaaaaaaaaaaa"+tipo);
            colonia=rs.getString("dir_colonia");
            calle=rs.getString("dir_calle");
            indicaciones=rs.getString("dir_indicaciones");
            cp=rs.getInt("dir_cp");
            num=rs.getInt("dir_numero");
            did=rs.getInt("dir_id");
        }
        
        ResultSet rs2 = stmt.executeQuery("select nh.*, h.* from Negocio_Horario nh inner join Horario h  where nh.hor_id=h.hor_id and nh.neg_id =" + id + ";");
        String[] Dia = new String[7];
        String[] Abierto = new String[7];
        String[] Cerrado = new String[7];
        String[] Especial = new String[7];
        
        int a = 0;
        while (rs2.next()) {
        
        
        Abierto[a]= rs2.getString("hor_abierto");
        Cerrado[a]= rs2.getString("hor_cerrado");
        Dia[a]= rs2.getString("hor_dia");
        Especial[a]= rs2.getString("hor_especial");
           a=a+1;
        }
        
        %>
            <section class="color1"></section>
            <section class="color2"></section>
            <div class="content_form w-100">
                <section class="d-flex text-white align-items-center p1_cnf">
                    <span class="txt_prin_cnf fw-bolder">Edita los Datos de tu Negocio</span>
                    <i class="bi bi-question-circle quicon_cnf_lg" data-bs-toggle="tooltip" data-bs-placement="right"
                       data-bs-title="Tooltip on right"></i>
                </section>
                <div class="p2_cnf d-flex flex-column" method="post" id="FORM_CNF">
                    <section class="d-flex p21_cnf">
                        <button type="button" class="btn text-white btn_nav_cnf bg-dark" id="Btn_DtNg">
                            Actualizar Datos del Negocio
                        </button>
                    </section>
                    <div class="p22_cnf p-4 pt-3">
                        <span class="dt_txt_cnf" id="dt_txt_cnf">Datos de Negocio</span>
                        <form class="form_cnf Datos_Negocio" id="Datos_Negocio" method="post" action="EditarNegocio">
                            <!--Parte 1-->
                            <section class="p221_cnf d-flex flex-column justify-content-between">
                                <section>
                                    <span class="fw-bold">Nombre del Negocio
                                        <i class="bi bi-question-circle" data-bs-toggle="tooltip" data-bs-placement="right"
                                           data-bs-title="Tooltip on right"></i></span>
                                    <input type="text" class="form-control" placeholder="<%=nombre%>" id="N_Neg_cnf" name="N_Neg_cnf" />
                                    <input type="hidden" name="anom" value="<%=nombre%>"/> 
                                </section>
                                <section>
                                    <span class="fw-bold">Tipo de Negocio
                                        <i class="bi bi-question-circle" data-bs-toggle="tooltip" data-bs-placement="right"
                                           data-bs-title="Tooltip on right"></i></span>
                                    <input type="hidden" name="atipo" value="<%=tipo%>"/>
                                    <select class="form-select" aria-label="Default select example" id="TP_cnf" name="TP_cnf" >
                                        
                                        <%
                                            
                                                
                                                
                                                    if(tipo==1){
                                                   %>
                                                <option value="Abarrotes" selected>Abarrotes</option>
                                                <option value="Materia_Prima">Materia Prima</option>
                                                <option value="Restaurantes">Restaurantes</option>
                                                <option value="SyP">Snacks y Postres</option>
                                                <option value="Cafeteria">Cafetería</option>
                                                <option value="Catering">Catering</option>
                                                <option value="Panaderia">Panadería</option>
                                                <option value="OyF">Venta de Ortalizas o frutas</option>
                                                <option value="Otro">Otro</option>
                                                   <%
                                                       }else if(tipo==2){
                                                   %>
                                                <option value="Abarrotes">Abarrotes</option>
                                                <option value="Materia_Prima" selected>Materia Prima</option>
                                                <option value="Restaurantes">Restaurantes</option>
                                                <option value="SyP">Snacks y Postres</option>
                                                <option value="Cafeteria">Cafetería</option>
                                                <option value="Catering">Catering</option>
                                                <option value="Panaderia">Panadería</option>
                                                <option value="OyF">Venta de Ortalizas o frutas</option>
                                                <option value="Otro">Otro</option>
                                                   <%
                                                       }else if(tipo==3){
                                                   %>
                                                <option value="Abarrotes">Abarrotes</option>
                                                <option value="Materia_Prima">Materia Prima</option>
                                                <option value="Restaurantes" selected>Restaurantes</option>
                                                <option value="SyP">Snacks y Postres</option>
                                                <option value="Cafeteria">Cafetería</option>
                                                <option value="Catering">Catering</option>
                                                <option value="Panaderia">Panadería</option>
                                                <option value="OyF">Venta de Ortalizas o frutas</option>
                                                <option value="Otro">Otro</option>
                                                   <%
                                                       }else if(tipo==4){
                                                   %>
                                                <option value="Abarrotes">Abarrotes</option>
                                                <option value="Materia_Prima">Materia Prima</option>
                                                <option value="Restaurantes">Restaurantes</option>
                                                <option value="SyP" selected>Snacks y Postres</option>
                                                <option value="Cafeteria">Cafetería</option>
                                                <option value="Catering">Catering</option>
                                                <option value="Panaderia">Panadería</option>
                                                <option value="OyF">Venta de Ortalizas o frutas</option>
                                                <option value="Otro">Otro</option>
                                                   <%
                                                       }else if(tipo==5){
                                                   %>
                                                <option value="Abarrotes">Abarrotes</option>
                                                <option value="Materia_Prima">Materia Prima</option>
                                                <option value="Restaurantes">Restaurantes</option>
                                                <option value="SyP">Snacks y Postres</option>
                                                <option value="Cafeteria" selected>Cafetería</option>
                                                <option value="Catering">Catering</option>
                                                <option value="Panaderia">Panadería</option>
                                                <option value="OyF">Venta de Ortalizas o frutas</option>
                                                <option value="Otro">Otro</option>
                                                   <%
                                                       }else if(tipo==6){
                                                   %>
                                                <option value="Abarrotes">Abarrotes</option>
                                                <option value="Materia_Prima">Materia Prima</option>
                                                <option value="Restaurantes">Restaurantes</option>
                                                <option value="SyP">Snacks y Postres</option>
                                                <option value="Cafeteria">Cafetería</option>
                                                <option value="Catering" selected>Catering</option>
                                                <option value="Panaderia">Panadería</option>
                                                <option value="OyF">Venta de Ortalizas o frutas</option>
                                                <option value="Otro">Otro</option>
                                                   <%
                                                       }else if(tipo==7){
                                                   %>
                                                <option value="Abarrotes">Abarrotes</option>
                                                <option value="Materia_Prima">Materia Prima</option>
                                                <option value="Restaurantes">Restaurantes</option>
                                                <option value="SyP">Snacks y Postres</option>
                                                <option value="Cafeteria">Cafetería</option>
                                                <option value="Catering">Catering</option>
                                                <option value="Panaderia" selected>Panadería</option>
                                                <option value="OyF">Venta de Ortalizas o frutas</option>
                                                <option value="Otro">Otro</option>
                                                   <%
                                                       }else if(tipo==8){
                                                   %>
                                                <option value="Abarrotes">Abarrotes</option>
                                                <option value="Materia_Prima" selected>Materia Prima</option>
                                                <option value="Restaurantes">Restaurantes</option>
                                                <option value="SyP">Snacks y Postres</option>
                                                <option value="Cafeteria">Cafetería</option>
                                                <option value="Catering">Catering</option>
                                                <option value="Panaderia">Panadería</option>
                                                <option value="OyF" selected>Venta de Ortalizas o frutas</option>
                                                <option value="Otro">Otro</option>
                                                   <%
                                                       }else if(tipo==9){
                                                   %>
                                                <option value="Abarrotes">Abarrotes</option>
                                                <option value="Materia_Prima" selected>Materia Prima</option>
                                                <option value="Restaurantes">Restaurantes</option>
                                                <option value="SyP">Snacks y Postres</option>
                                                <option value="Cafeteria">Cafetería</option>
                                                <option value="Catering">Catering</option>
                                                <option value="Panaderia">Panadería</option>
                                                <option value="OyF">Venta de Ortalizas o frutas</option>
                                                <option value="Otro" selected>Otro</option>
                                                   <%
                                                       }
                                            
                                            %>
                                    </select>
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
                                                    Miercoles
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
                                                    Sabado
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
                                            <section class="inpb_cnf flex-column justify-content-evenly align-items-center" id="hlunes_cnf">
                                                
                                                    <%
                                                        if(Especial[0].equals("No")){
                                                        %>
                                                        <section class="d-flex flex-column">
                                                    <label for="Abierto_L">Hora de Apertura
                                                        <i class="bi bi-question-circle" data-bs-toggle="tooltip" data-bs-placement="right"
                                                           data-bs-title="Tooltip on right" ></i></label>
                                                            <input type="time" class="form-control" id="Abierto_L" name="Abierto_L" value="<%=Abierto[0]%>" />
                                                    <label for="Cerrado_L">Hora de Cerrado
                                                        <i class="bi bi-question-circle" data-bs-toggle="tooltip" data-bs-placement="right"
                                                           data-bs-title="Tooltip on right"></i></label>
                                                            <input type="time" class="form-control" id="Cerrado_L" name="Cerrado_L" value="<%=Cerrado[0]%>" />
                                                    </section>
                                                    
                                                 <section class="d-flex">
                                                    <section class="d-flex">
                                                        <input type="checkbox" class="btn text-white" id="cerr_lun" name="cerr_lun" value="lun_cerr" /><label
                                                            for="cerr_lun" class="radio_hc">Día Cerrado</label>
                                                    </section>
                                                    <section class="d-flex">
                                                        <input type="checkbox" class="btn text-white" id="she_lun" name="she_lun" value="lun_snhor" /><label
                                                            for="she_lun" class="radio_hs">Sin Horario Especifico</label>
                                                    </section>
                                                </section>
                                                    <%
                                                        }else{
                                                    %>  
                                                    <section class="d-flex flex-column">
                                                    <label for="Abierto_L">Hora de Apertura
                                                        <i class="bi bi-question-circle" data-bs-toggle="tooltip" data-bs-placement="right"
                                                           data-bs-title="Tooltip on right"></i></label>
                                                        <input type="time" class="form-control" id="Abierto_L" name="Abierto_L" />
                                                    <label for="Cerrado_L">Hora de Cerrado
                                                        <i class="bi bi-question-circle" data-bs-toggle="tooltip" data-bs-placement="right"
                                                           data-bs-title="Tooltip on right"></i></label>
                                                        <input type="time" class="form-control" id="Cerrado_L" name="Cerrado_L" />
                                                    </section>
                                                    <%
                                                        if(Especial[0].equals("Cerrado")){
                                                        %>
                                                    <section class="d-flex">
                                                    <section class="d-flex">
                                                        <input type="checkbox" class="btn text-white" id="cerr_lun" name="cerr_lun" value="lun_cerr" checked/><label
                                                            for="cerr_lun" class="radio_hc" >Día Cerrado</label>
                                                    </section>
                                                    <section class="d-flex">
                                                        <input type="checkbox" class="btn text-white" id="she_lun" name="she_lun" value="lun_snhor" /><label
                                                            for="she_lun" class="radio_hs">Sin Horario Especifico</label>
                                                    </section>
                                                </section>
                                                        <%
                                                            }else if(Especial[0].equals("Sin horario especifico")){
                                                            %>
                                                    
                                                            <section class="d-flex">
                                                    <section class="d-flex">
                                                        <input type="checkbox" class="btn text-white" id="cerr_lun" name="cerr_lun" value="lun_cerr" /><label
                                                            for="cerr_lun" class="radio_hc">Día Cerrado</label>
                                                    </section>
                                                    <section class="d-flex">
                                                        <input type="checkbox" class="btn text-white" id="she_lun" name="she_lun" value="lun_snhor" checked/><label
                                                            for="she_lun" class="radio_hs" >Sin Horario Especifico</label>
                                                    </section>
                                                </section>
                                                                                                                  
                                                    <%
                                                        }
                                                        }
                                                    %>
                                                
                                                
                                            </section>
                                            <!--Horas Martes-->
                                            <section class="inpb_cnf flex-column justify-content-evenly align-items-center" id="hmartes_cnf">
                                               
                                                                                                     <%
                                                        if(Especial[1].equals("No")){
                                                        %>
                                                        <section class="d-flex flex-column">
                                                    <label for="Abierto_M">Hora de Apertura
                                                        <i class="bi bi-question-circle" data-bs-toggle="tooltip" data-bs-placement="right"
                                                           data-bs-title="Tooltip on right" ></i></label>
                                                            <input type="time" class="form-control" id="Abierto_M" name="Abierto_M" value="<%=Abierto[1]%>" />
                                                    <label for="Cerrado_M">Hora de Cerrado
                                                        <i class="bi bi-question-circle" data-bs-toggle="tooltip" data-bs-placement="right"
                                                           data-bs-title="Tooltip on right"></i></label>
                                                            <input type="time" class="form-control" id="Cerrado_M" name="Cerrado_M" value="<%=Cerrado[1]%>" />
                                                    </section>
                                                    
                                                 <section class="d-flex">
                                                    <section class="d-flex">
                                                        <input type="checkbox" class="btn text-white" id="cerr_mar" name="cerr_mar" value="mar_cerr" /><label
                                                            for="cerr_mar" class="radio_hc">Día Cerrado</label>
                                                    </section>
                                                    <section class="d-flex">
                                                        <input type="checkbox" class="btn text-white" id="she_mar" name="she_mar" value="mar_snhor" /><label
                                                            for="she_mar" class="radio_hs">Sin Horario Especifico</label>
                                                    </section>
                                                </section>
                                                    <%
                                                        }else{
                                                    %>  
                                                   <section class="d-flex flex-column">
                                                    <label for="Abierto_M">Hora de Apertura
                                                        <i class="bi bi-question-circle" data-bs-toggle="tooltip" data-bs-placement="right"
                                                           data-bs-title="Tooltip on right" ></i></label>
                                                            <input type="time" class="form-control" id="Abierto_M" name="Abierto_M"  />
                                                    <label for="Cerrado_L">Hora de Cerrado
                                                        <i class="bi bi-question-circle" data-bs-toggle="tooltip" data-bs-placement="right"
                                                           data-bs-title="Tooltip on right"></i></label>
                                                            <input type="time" class="form-control" id="Cerrado_M" name="Cerrado_M"  />
                                                    </section>
                                                    <%
                                                        if(Especial[1].equals("Cerrado")){
                                                        %>
                                                   <section class="d-flex">
                                                    <section class="d-flex">
                                                        <input type="checkbox" class="btn text-white" id="cerr_mar" name="cerr_mar" value="mar_cerr" checked /><label
                                                            for="cerr_mar" class="radio_hc">Día Cerrado</label>
                                                    </section>
                                                    <section class="d-flex">
                                                        <input type="checkbox" class="btn text-white" id="she_mar" name="she_mar" value="mar_snhor" /><label
                                                            for="she_mar" class="radio_hs">Sin Horario Especifico</label>
                                                    </section>
                                                </section>
                                                        <%
                                                            }else if(Especial[1].equals("Sin horario especifico")){
                                                            %>
                                                    <section class="d-flex">
                                                    <section class="d-flex">
                                                        <input type="checkbox" class="btn text-white" id="cerr_mar" name="cerr_mar" value="mar_cerr" /><label
                                                            for="cerr_mar" class="radio_hc">Día Cerrado</label>
                                                    </section>
                                                    <section class="d-flex">
                                                        <input type="checkbox" class="btn text-white" id="she_mar" name="she_mar" value="mar_snhor" checked/><label
                                                            for="she_mar" class="radio_hs">Sin Horario Especifico</label>
                                                    </section>
                                                </section>
                                                                                                                  
                                                    <%
                                                        }
                                                        }
                                                    %>
                                            </section>
                                            <!--Horas Miercoles-->
                                            <section class="inpb_cnf flex-column justify-content-evenly align-items-center" id="hmiercoles_cnf">
                                            <%
                                                        if(Especial[2].equals("No")){
                                                        %>
                                                        <section class="d-flex flex-column">
                                                    <label for="Abierto_Mi">Hora de Apertura
                                                        <i class="bi bi-question-circle" data-bs-toggle="tooltip" data-bs-placement="right"
                                                           data-bs-title="Tooltip on right" ></i></label>
                                                            <input type="time" class="form-control" id="Abierto_Mi" name="Abierto_Mi" value="<%=Abierto[2]%>" />
                                                    <label for="Cerrado_Mi">Hora de Cerrado
                                                        <i class="bi bi-question-circle" data-bs-toggle="tooltip" data-bs-placement="right"
                                                           data-bs-title="Tooltip on right"></i></label>
                                                            <input type="time" class="form-control" id="Cerrado_Mi" name="Cerrado_Mi" value="<%=Cerrado[2]%>" />
                                                    </section>
                                                    
                                                 <section class="d-flex">
                                                    <section class="d-flex">
                                                        <input type="checkbox" class="btn text-white" id="cerr_mie" name="cerr_mie" value="mie_cerr" /><label
                                                            for="cerr_mie" class="radio_hc">Día Cerrado</label>
                                                    </section>
                                                    <section class="d-flex">
                                                        <input type="checkbox" class="btn text-white" id="she_mie" name="she_mie" value="mie_snhor" /><label
                                                            for="she_mie" class="radio_hs">Sin Horario Especifico</label>
                                                    </section>
                                                </section>
                                                    <%
                                                        }else{
                                                    %>  
                                                   <section class="d-flex flex-column">
                                                    <label for="Abierto_Mi">Hora de Apertura
                                                        <i class="bi bi-question-circle" data-bs-toggle="tooltip" data-bs-placement="right"
                                                           data-bs-title="Tooltip on right" ></i></label>
                                                            <input type="time" class="form-control" id="Abierto_Mi" name="Abierto_Mi"/>
                                                    <label for="Cerrado_Mi">Hora de Cerrado
                                                        <i class="bi bi-question-circle" data-bs-toggle="tooltip" data-bs-placement="right"
                                                           data-bs-title="Tooltip on right"></i></label>
                                                            <input type="time" class="form-control" id="Cerrado_Mi" name="Cerrado_Mi"/>
                                                    </section>
                                                    <%
                                                        if(Especial[2].equals("Cerrado")){
                                                        %>
                                                   <section class="d-flex">
                                                    <section class="d-flex">
                                                        <input type="checkbox" class="btn text-white" id="cerr_mie" name="cerr_mie" value="mie_cerr" checked/><label
                                                            for="cerr_mie" class="radio_hc">Día Cerrado</label>
                                                    </section>
                                                    <section class="d-flex">
                                                        <input type="checkbox" class="btn text-white" id="she_mie" name="she_mie" value="mie_snhor" /><label
                                                            for="she_mie" class="radio_hs">Sin Horario Especifico</label>
                                                    </section>
                                                </section>
                                                        <%
                                                            }else if(Especial[2].equals("Sin horario especifico")){
                                                            %>
                                                    <section class="d-flex">
                                                    <section class="d-flex">
                                                        <input type="checkbox" class="btn text-white" id="cerr_mie" name="cerr_mie" value="mie_cerr" /><label
                                                            for="cerr_mie" class="radio_hc">Día Cerrado</label>
                                                    </section>
                                                    <section class="d-flex">
                                                        <input type="checkbox" class="btn text-white" id="she_mie" name="she_mie" value="mie_snhor" checked/><label
                                                            for="she_mie" class="radio_hs">Sin Horario Especifico</label>
                                                    </section>
                                                </section>
                                                                                                                  
                                                    <%
                                                        }
                                                        }
                                                    %>
                                            </section>
                                            <!--Horas Jueves-->
                                            <section class="inpb_cnf flex-column justify-content-evenly align-items-center" id="hjueves_cnf">
                                                <%
                                                        if(Especial[3].equals("No")){
                                                        %>
                                                        <section class="d-flex flex-column">
                                                    <label for="Abierto_J">Hora de Apertura
                                                        <i class="bi bi-question-circle" data-bs-toggle="tooltip" data-bs-placement="right"
                                                           data-bs-title="Tooltip on right" ></i></label>
                                                            <input type="time" class="form-control" id="Abierto_J" name="Abierto_J" value="<%=Abierto[3]%>" />
                                                    <label for="Cerrado_J">Hora de Cerrado
                                                        <i class="bi bi-question-circle" data-bs-toggle="tooltip" data-bs-placement="right"
                                                           data-bs-title="Tooltip on right"></i></label>
                                                            <input type="time" class="form-control" id="Cerrado_J" name="Cerrado_J" value="<%=Cerrado[3]%>" />
                                                    </section>
                                                    
                                                 <section class="d-flex">
                                                    <section class="d-flex">
                                                        <input type="checkbox" class="btn text-white" id="cerr_jue" name="cerr_jue" value="jue_cerr" /><label
                                                            for="cerr_jue" class="radio_hc">Día Cerrado</label>
                                                    </section>
                                                    <section class="d-flex">
                                                        <input type="checkbox" class="btn text-white" id="she_jue" name="she_jue" value="jue_snhor" /><label
                                                            for="she_jue" class="radio_hs">Sin Horario Especifico</label>
                                                    </section>
                                                </section>
                                                    <%
                                                        }else{
                                                    %>  
                                                   <section class="d-flex flex-column">
                                                    <label for="Abierto_J">Hora de Apertura
                                                        <i class="bi bi-question-circle" data-bs-toggle="tooltip" data-bs-placement="right"
                                                           data-bs-title="Tooltip on right" ></i></label>
                                                            <input type="time" class="form-control" id="Abierto_J" name="Abierto_J"  />
                                                    <label for="Cerrado_J">Hora de Cerrado
                                                        <i class="bi bi-question-circle" data-bs-toggle="tooltip" data-bs-placement="right"
                                                           data-bs-title="Tooltip on right"></i></label>
                                                            <input type="time" class="form-control" id="Cerrado_J" name="Cerrado_J" />
                                                    </section>
                                                    <%
                                                        if(Especial[3].equals("Cerrado")){
                                                        %>
                                                  <section class="d-flex">
                                                    <section class="d-flex">
                                                        <input type="checkbox" class="btn text-white" id="cerr_jue" name="cerr_jue" value="jue_cerr" checked /><label
                                                            for="cerr_jue" class="radio_hc">Día Cerrado</label>
                                                    </section>
                                                    <section class="d-flex">
                                                        <input type="checkbox" class="btn text-white" id="she_jue" name="she_jue" value="jue_snhor" /><label
                                                            for="she_jue" class="radio_hs">Sin Horario Especifico</label>
                                                    </section>
                                                </section>
                                                        <%
                                                            }else if(Especial[3].equals("Sin horario especifico")){
                                                            %>
                                                    <section class="d-flex">
                                                    <section class="d-flex">
                                                        <input type="checkbox" class="btn text-white" id="cerr_jue" name="cerr_jue" value="jue_cerr" /><label
                                                            for="cerr_jue" class="radio_hc">Día Cerrado</label>
                                                    </section>
                                                    <section class="d-flex">
                                                        <input type="checkbox" class="btn text-white" id="she_jue" name="she_jue" value="jue_snhor" checked/><label
                                                            for="she_jue" class="radio_hs">Sin Horario Especifico</label>
                                                    </section>
                                                </section>
                                                                                                                  
                                                    <%
                                                        }
                                                        }
                                                    %>
                                            </section>
                                             <!--Horas Viernes-->
                                            <section class="inpb_cnf flex-column justify-content-evenly align-items-center" id="hviernes_cnf">
                                                <%
                                                        if(Especial[4].equals("No")){
                                                        %>
                                                        <section class="d-flex flex-column">
                                                    <label for="Abierto_V">Hora de Apertura
                                                        <i class="bi bi-question-circle" data-bs-toggle="tooltip" data-bs-placement="right"
                                                           data-bs-title="Tooltip on right" ></i></label>
                                                            <input type="time" class="form-control" id="Abierto_V" name="Abierto_V" value="<%=Abierto[4]%>" />
                                                    <label for="Cerrado_V">Hora de Cerrado
                                                        <i class="bi bi-question-circle" data-bs-toggle="tooltip" data-bs-placement="right"
                                                           data-bs-title="Tooltip on right"></i></label>
                                                            <input type="time" class="form-control" id="Cerrado_V" name="Cerrado_V" value="<%=Cerrado[4]%>" />
                                                    </section>
                                                    
                                                 <section class="d-flex">
                                                    <section class="d-flex">
                                                        <input type="checkbox" class="btn text-white" id="cerr_vie" name="cerr_vie" value="vie_cerr" /><label
                                                            for="cerr_vie" class="radio_hc">Día Cerrado</label>
                                                    </section>
                                                    <section class="d-flex">
                                                        <input type="checkbox" class="btn text-white" id="she_vie" name="she_vie" value="vie_snhor" /><label
                                                            for="she_vie" class="radio_hs">Sin Horario Especifico</label>
                                                    </section>
                                                </section>
                                                    <%
                                                        }else{
                                                    %>  
                                                   <section class="d-flex flex-column">
                                                    <label for="Abierto_V">Hora de Apertura
                                                        <i class="bi bi-question-circle" data-bs-toggle="tooltip" data-bs-placement="right"
                                                           data-bs-title="Tooltip on right" ></i></label>
                                                            <input type="time" class="form-control" id="Abierto_V" name="Abierto_V"/>
                                                    <label for="Cerrado_V">Hora de Cerrado
                                                        <i class="bi bi-question-circle" data-bs-toggle="tooltip" data-bs-placement="right"
                                                           data-bs-title="Tooltip on right"></i></label>
                                                            <input type="time" class="form-control" id="Cerrado_V" name="Cerrado_V"  />
                                                    </section>
                                                    <%
                                                        if(Especial[4].equals("Cerrado")){
                                                        %>
                                                  <section class="d-flex">
                                                    <section class="d-flex">
                                                        <input type="checkbox" class="btn text-white" id="cerr_vie" name="cerr_vie" value="vie_cerr" checked/><label
                                                            for="cerr_vie" class="radio_hc">Día Cerrado</label>
                                                    </section>
                                                    <section class="d-flex">
                                                        <input type="checkbox" class="btn text-white" id="she_vie" name="she_vie" value="vie_snhor" /><label
                                                            for="she_vie" class="radio_hs">Sin Horario Especifico</label>
                                                    </section>
                                                </section>
                                                        <%
                                                            }else if(Especial[4].equals("Sin horario especifico")){
                                                            %>
                                                    <section class="d-flex">
                                                    <section class="d-flex">
                                                        <input type="checkbox" class="btn text-white" id="cerr_vie" name="cerr_vie" value="vie_cerr" /><label
                                                            for="cerr_vie" class="radio_hc">Día Cerrado</label>
                                                    </section>
                                                    <section class="d-flex">
                                                        <input type="checkbox" class="btn text-white" id="she_vie" name="she_vie" value="vie_snhor" checked/><label
                                                            for="she_vie" class="radio_hs">Sin Horario Especifico</label>
                                                    </section>
                                                </section>
                                                                                                                  
                                                    <%
                                                        }
                                                        }
                                                    %>
                                            </section>
                                            <!--Horas Sabado-->
                                            <section class="inpb_cnf flex-column justify-content-evenly align-items-center" id="hsabado_cnf">
                                                <%
                                                        if(Especial[5].equals("No")){
                                                        %>
                                                        <section class="d-flex flex-column">
                                                    <label for="Abierto_S">Hora de Apertura
                                                        <i class="bi bi-question-circle" data-bs-toggle="tooltip" data-bs-placement="right"
                                                           data-bs-title="Tooltip on right" ></i></label>
                                                            <input type="time" class="form-control" id="Abierto_S" name="Abierto_S" value="<%=Abierto[5]%>" />
                                                    <label for="Cerrado_S">Hora de Cerrado
                                                        <i class="bi bi-question-circle" data-bs-toggle="tooltip" data-bs-placement="right"
                                                           data-bs-title="Tooltip on right"></i></label>
                                                            <input type="time" class="form-control" id="Cerrado_S" name="Cerrado_S" value="<%=Cerrado[5]%>" />
                                                    </section>
                                                    
                                                 <section class="d-flex">
                                                    <section class="d-flex">
                                                        <input type="checkbox" class="btn text-white" id="cerr_sab" name="cerr_sab" value="sab_cerr" /><label
                                                            for="cerr_sab" class="radio_hc">Día Cerrado</label>
                                                    </section>
                                                    <section class="d-flex">
                                                        <input type="checkbox" class="btn text-white" id="she_sab" name="she_sab" value="sab_snhor" /><label
                                                            for="she_sab" class="radio_hs">Sin Horario Especifico</label>
                                                    </section>
                                                </section>
                                                    <%
                                                        }else{
                                                    %>  
                                                   <section class="d-flex flex-column">
                                                    <label for="Abierto_S">Hora de Apertura
                                                        <i class="bi bi-question-circle" data-bs-toggle="tooltip" data-bs-placement="right"
                                                           data-bs-title="Tooltip on right" ></i></label>
                                                            <input type="time" class="form-control" id="Abierto_S" name="Abierto_S" />
                                                    <label for="Cerrado_S">Hora de Cerrado
                                                        <i class="bi bi-question-circle" data-bs-toggle="tooltip" data-bs-placement="right"
                                                           data-bs-title="Tooltip on right"></i></label>
                                                            <input type="time" class="form-control" id="Cerrado_S" name="Cerrado_S" />
                                                    </section>
                                                    <%
                                                        if(Especial[5].equals("Cerrado")){
                                                        %>
                                                  <section class="d-flex">
                                                    <section class="d-flex">
                                                        <input type="checkbox" class="btn text-white" id="cerr_sab" name="cerr_sab" value="sab_cerr" checked/><label
                                                            for="cerr_sab" class="radio_hc">Día Cerrado</label>
                                                    </section>
                                                    <section class="d-flex">
                                                        <input type="checkbox" class="btn text-white" id="she_sab" name="she_sab" value="sab_snhor" /><label
                                                            for="she_sab" class="radio_hs">Sin Horario Especifico</label>
                                                    </section>
                                                </section>
                                                        <%
                                                            }else if(Especial[5].equals("Sin horario especifico")){
                                                            %>
                                                    <section class="d-flex">
                                                    <section class="d-flex">
                                                        <input type="checkbox" class="btn text-white" id="cerr_sab" name="cerr_sab" value="sab_cerr" /><label
                                                            for="cerr_sab" class="radio_hc">Día Cerrado</label>
                                                    </section>
                                                    <section class="d-flex">
                                                        <input type="checkbox" class="btn text-white" id="she_sab" name="she_sab" value="sab_snhor" checked/><label
                                                            for="she_sab" class="radio_hs">Sin Horario Especifico</label>
                                                    </section>
                                                </section>
                                                                                                                  
                                                    <%
                                                        }
                                                        }
                                                    %>
                                            </section>
                                            <!--Horas Domingo-->
                                            <section class="inpb_cnf flex-column justify-content-evenly align-items-center" id="hdomingo_cnf">
                                                <%
                                                        if(Especial[6].equals("No")){
                                                        %>
                                                        <section class="d-flex flex-column">
                                                    <label for="Abierto_D">Hora de Apertura
                                                        <i class="bi bi-question-circle" data-bs-toggle="tooltip" data-bs-placement="right"
                                                           data-bs-title="Tooltip on right" ></i></label>
                                                            <input type="time" class="form-control" id="Abierto_D" name="Abierto_D" value="<%=Abierto[6]%>" />
                                                    <label for="Cerrado_D">Hora de Cerrado
                                                        <i class="bi bi-question-circle" data-bs-toggle="tooltip" data-bs-placement="right"
                                                           data-bs-title="Tooltip on right"></i></label>
                                                            <input type="time" class="form-control" id="Cerrado_D" name="Cerrado_D" value="<%=Cerrado[6]%>" />
                                                    </section>
                                                    
                                                 <section class="d-flex">
                                                    <section class="d-flex">
                                                        <input type="checkbox" class="btn text-white" id="cerr_dom" name="cerr_dom" value="dom_cerr" /><label
                                                            for="cerr_dom" class="radio_hc">Día Cerrado</label>
                                                    </section>
                                                    <section class="d-flex">
                                                        <input type="checkbox" class="btn text-white" id="she_dom" name="she_dom" value="dom_snhor" /><label
                                                            for="she_dom" class="radio_hs">Sin Horario Especifico</label>
                                                    </section>
                                                </section>
                                                    <%
                                                        }else{
                                                    %>  
                                                   <section class="d-flex flex-column">
                                                    <label for="Abierto_D">Hora de Apertura
                                                        <i class="bi bi-question-circle" data-bs-toggle="tooltip" data-bs-placement="right"
                                                           data-bs-title="Tooltip on right" ></i></label>
                                                            <input type="time" class="form-control" id="Abierto_D" name="Abierto_D" />
                                                    <label for="Cerrado_D">Hora de Cerrado
                                                        <i class="bi bi-question-circle" data-bs-toggle="tooltip" data-bs-placement="right"
                                                           data-bs-title="Tooltip on right"></i></label>
                                                            <input type="time" class="form-control" id="Cerrado_D" name="Cerrado_D" />
                                                    </section>
                                                    <%
                                                        if(Especial[6].equals("Cerrado")){
                                                        %>
                                                  <section class="d-flex">
                                                    <section class="d-flex">
                                                        <input type="checkbox" class="btn text-white" id="cerr_dom" name="cerr_dom" value="dom_cerr" checked/><label
                                                            for="cerr_dom" class="radio_hc">Día Cerrado</label>
                                                    </section>
                                                    <section class="d-flex">
                                                        <input type="checkbox" class="btn text-white" id="she_dom" name="she_dom" value="dom_snhor" /><label
                                                            for="she_dom" class="radio_hs">Sin Horario Especifico</label>
                                                    </section>
                                                </section>
                                                        <%
                                                            }else if(Especial[6].equals("Sin horario especifico")){
                                                            %>
                                                    <section class="d-flex">
                                                    <section class="d-flex">
                                                        <input type="checkbox" class="btn text-white" id="cerr_dom" name="cerr_dom" value="dom_cerr" /><label
                                                            for="cerr_dom" class="radio_hc">Día Cerrado</label>
                                                    </section>
                                                    <section class="d-flex">
                                                        <input type="checkbox" class="btn text-white" id="she_dom" name="she_dom" value="dom_snhor" checked/><label
                                                            for="she_dom" class="radio_hs">Sin Horario Especifico</label>
                                                    </section>
                                                </section>
                                                                                                                  
                                                    <%
                                                        }
                                                        }
                                                    %>
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
                                            <img src="<%=logo%>" alt="Logo" id="Prev_Log" class="Prev_Log" />
                                            <input type="file" class="d-none" name="logo_cnf" id="logo_cnf" accept="image/png, image/jpeg" />
                                            <input type="hidden" name="alogo" value="<%=logo%>"/>
                                            <i class="bi bi-image Plus_L" id="Plus_L"></i>
                                        </section>
                                    </div>
                                    <section class="d-flex flex-column dec_cnf">
                                        <span class="fw-bold">Descripcion del Negocio
                                            <i class="bi bi-question-circle" data-bs-toggle="tooltip" data-bs-placement="right"
                                               data-bs-title="Tooltip on right"></i></span>
                                        <textarea class="form-control txta_cnf" name="desc" id="" placeholder="<%=desc%>" ></textarea>
                                        <input type="hidden" name="adesc" value="<%=desc%>"/>
                                    </section>
                                </div>
                                <div class="d-flex justify-content-between align-items-center bg-ob dir">
                                    <section class="d-flex flex-column h-100 justify-content-between">
                                        <span class="fw-bold">Direccion del Local
                                            <i class="bi bi-question-circle" data-bs-toggle="tooltip" data-bs-placement="right"
                                               data-bs-title="Tooltip on right"></i></span>
                                        <iframe
                                            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d120545.72792553862!2d-99.16312141549678!3d19.236478317597356!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x85ce038c6de8dea3%3A0x9b79f71fdabd5384!2sXochimilco%2C%20CDMX!5e0!3m2!1ses-419!2smx!4v1699549046798!5m2!1ses-419!2smx"
                                            width="250" height="150" allowfullscreen="" loading="lazy"
                                            referrerpolicy="no-referrer-when-downgrade"></iframe>
                                        <section>
                                            <label for="cpp">Codigo Postal
                                                <i class="bi bi-question-circle" data-bs-toggle="tooltip" data-bs-placement="right"
                                                   data-bs-title="Tooltip on right"></i></label>
                                            <input type="text" class="form-control" name="cpp" id="cpp" placeholder="<%=cp%>" />
                                            <input type="hidden" name="acp" value="<%=cp%>"/>
                                        </section>
                                    </section>
                                    <section class="d-flex flex-column h-100 justify-content-between">
                                        <label for="colonia">Colonia</label>
                                        <input type="text" class="form-control" id="colonia" placeholder="<%=colonia%>" name="colonia" />
                                        <input type="hidden" name="acolonia" value="<%=colonia%>"/>
                                        <label for="calle">Calle</label>
                                        <input type="text" class="form-control" id="calle" name="calle" placeholder="<%=calle%>" />
                                        <input type="hidden" name="acalle" value="<%=calle%>"/>
                                        <label for="numero">Número</label>
                                        <input type="text" class="form-control" id="numero" name="numero" placeholder="<%=num%>" />
                                        <input type="hidden" name="anumero" value="<%=num%>"/>
                                        <label for="iextra">Indicaciones Extra</label>
                                        <input type="text" class="form-control" id="iextra" name="iextra" placeholder="<%=indicaciones%>" />
                                        <input type="hidden" name="aiextra" value="<%=indicaciones%>"/>
                                    </section>
                                </div>
                            </section>
                            <!--Parte 3-->
                            <div class="p223_cnf">
                                <div class="container__slider">
                                    <span class="fw-bold">Imagenes del Local
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
                                                <img src="<%=imagen1%>" alt="Negocio 1" id="imagen1_neg" />
                                                <input type="hidden" name="aimagen1" value="<%=imagen1%>"/>
                                                <i class="bi bi-image Plus_L" id="Plus_i1"></i>
                                            </label>
                                            <label class="card" for="item-2" id="selector-2">
                                                <input type="file" class="d-none" name="inp_img2_cnf" id="inp_img2_cnf"
                                                       accept="image/png, image/jpeg" />
                                                <img src="<%=imagen2%>" alt="Negocio 2" id="imagen2_neg" />
                                                <input type="hidden" name="aimagen2" value="<%=imagen2%>"/>
                                                <i class="bi bi-image Plus_L" id="Plus_i2"></i>
                                            </label>
                                            <label class="card" for="item-3" id="selector-3">
                                                <input type="file" class="d-none" name="inp_img3_cnf" id="inp_img3_cnf"
                                                       accept="image/png, image/jpeg" />
                                                <img src="<%=imagen3%>" alt="Negocio 3" id="imagen3_neg" />
                                                <input type="hidden" name="aimagen3" value="<%=imagen3%>"/>
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
                                    <!--Telefono-->
                                    <li class="d-flex ctc_l">
                                        <label for="tel_loc_cnf"><i class="bi bi-telephone-fill" data-bs-toggle="tooltip"
                                                                    data-bs-placement="right" data-bs-title="Número Telefonico (Sin espacios)"></i></label><input
                                                                        type="tel" id="tel_loc_cnf" class="form-control" name="tel_loc_cnf" placeholder="<%=tel%>" />
                                    <input type="hidden" name="atel" value="<%=tel%>"/>
                                    </li>
                                    <!--Email-->
                                    <li class="d-flex ctc_l">
                                        <label for="mail_loc_cnf"><i class="bi bi-envelope-fill" data-bs-toggle="tooltip"
                                                                     data-bs-placement="right"
                                                                     data-bs-title="Correo Electronico (example@dominio.com)"></i></label><input type="text"
                                                                           id="mail_loc_cnf" class="form-control" name="mail_loc_cnf" placeholder="<%=correo%>" />
                                    <input type="hidden" name="acorreo" value="<%=correo%>"/>

                                    </li>
                                    <!--Facebook-->
                                    <li class="d-flex ctc_l">
                                        <label for="face_loc_cnf"><i class="bi bi-facebook" data-bs-toggle="tooltip" data-bs-placement="right"
                                                                     data-bs-title="Pagina o Cuenta de Facebook (URL)"></i></label><input type="text" id="face_loc_cnf"
                                                                           class="form-control" name="face_loc_cnf" placeholder="<%=fb%>" />
                                    <input type="hidden" name="afb" value="<%=fb%>"/>

                                    </li>
                                    <li class="d-flex ctc_l">
                                        <label for="inst_loc_cnf"><i class="bi bi-instagram" data-bs-toggle="tooltip"
                                                                     data-bs-placement="right" data-bs-title="Perfil de Instagram (URL)"></i></label><input type="text"
                                                                           id="inst_loc_cnf" class="form-control" name="inst_loc_cnf" placeholder="<%=ig%>" />
                                    <input type="hidden" name="aig" value="<%=ig%>"/>

                                    </li>
                                    <!--Twitter-->
                                    <li class="d-flex ctc_l">
                                        <label for="twit_loc_cnf"><i class="bi bi-twitter" data-bs-toggle="tooltip" data-bs-placement="right"
                                                                     data-bs-title="Perfil de Twitter (URL)"></i></label><input type="text" id="twit_loc_cnf"
                                                                           class="form-control" name="twit_loc_cnf" placeholder="<%=tw%>" />
                                    <input type="hidden" name="atw" value="<%=tw%>"/>

                                    </li>
                                    <!--Web-->
                                    <li class="d-flex ctc_l">
                                        <label for="web_loc_cnf"><i class="bi bi-globe" data-bs-toggle="tooltip" data-bs-placement="right"
                                                                    data-bs-title="Pagina Web (URL)"></i></label><input type="text" id="web_loc_cnf"
                                                                          class="form-control" name="web_loc_cnf" placeholder="<%=web%>" />
                                    <input type="hidden" name="aweb" value="<%=web%>"/>

                                    </li>
                                </ul>
                            </div>
                            <button type="submit" class="btn btn_sub_formsn " id="Btn_SubN">
                                Actualizar Datos
                            </button>
                                    
                                    <input type="hidden" name="img1" id="img1" value="" >
                            <input type="hidden" name="img2" id="media" value="" >
                            <input type="hidden" name="img3" id="asset" value="" >
                            <input type="hidden" name="logo" id="logo" value="" >
                            <input type="hidden" name="did" value="<%=did%>" >
                            <input type="hidden" name="idn" value="<%=request.getParameter("idn")%>" >        
                        </form>
                    </div>
                </div>
            </div>
        </div>
                        <%
                        c.close();
                        %>
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
       alert( "  <%=request.getAttribute("mensaje")%>");
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
        <script src="js/en.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </body>
</html>
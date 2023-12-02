<%-- 
    Document   : Visitar_Res_Usu
    Created on : 20 nov 2023, 21:45:09
    Author     : altro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="templates/Referencias/Todas_Ref.jsp"/>
        <title>Tus Comentarios</title>
    </head>
    <jsp:include page="templates/Navegadores/Navegador_CC.jsp"/>
    <body>
        <div class="rv_contprin w-100">
            <div class="rv_cont_usu h-100 d-flex justify-content-center align-items-center">
                <section class="h-75 prop_neg_cont">
                    <span class="prop_neg d-flex justify-content-center align-items-center">
                        <section class="card_neg h-100 d-flex flex-column align-items-center justify-content-evenly">
                            <section class="bord_color">
                                <div></div>
                            </section>
                            <img src="assets/neg1.jpg" alt="">
                            <span class="nu_span_n">Nombre de Usuario</span>
                            <section class="d-flex w-100 justify-content-around numcont_section_n">
                                <section class="d-flex flex-column justify-content-center align-items-center">
                                    <span class="num_span_n">00</span>
                                    <span class="txt_span_n">Número de Negocios</span>
                                </section>
                                <section class="d-flex flex-column justify-content-center align-items-center">
                                    <span class="num_span_n">000,000</span>
                                    <span class="txt_span_n">Reseñas de Otros Usuarios</span>
                                </section>
                                <section class="d-flex flex-column justify-content-center align-items-center">
                                    <span class="num_span_n">00/10</span>
                                    <span class="txt_span_n">Reputación</span>
                                </section>
                            </section>
                        </section>

                    </span>
                </section>
            </div>
            <div class="d-flex flex-column res_otr_usu_cont">
                <span class="Inria tt_ch">Comentarios Hechos</span>
                <div class="cont_res_var d- flex-column">
                    <form class="coment_pro_ch d-flex" method="post">
                        <section class="h-100 w-25 img_sect_ch">
                            <section class="h-100 w-100 img_res_ch">
                                <img src="assets/neg1.jpg" alt="">
                            </section>
                            <section class="bar_img_ch"></section>
                        </section>
                        <section class="w-75 h-100 d-flex flex-column justify-content-between">
                            <i class="bi bi-quote quote_ch"></i>
                            <section class="d-flex flex-column">
                                <span class="Nom_neg_ch">Nombre del Negocio</span>
                                <span class="cuerp_res_ch">Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolore sed voluptatem consectetur ratione, voluptatibus nostrum assumenda non tempora temporibus placeat exercitationem aut minima hic voluptas enim impedit velit quasi aspernatur?</span>
                            </section>
                            <section class="d-flex justify-content-between">
                                <section>
                                    <i class="bi bi-heart-fill"></i>
                                    <span>Le gustó</span>
                                </section>
                                <section class="btns_ch">
                                    <button type="button" class="btn btn_visitar_busq">Visitar</button>
                                </section>
                            </section>
                        </section>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>

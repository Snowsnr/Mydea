<%-- 
    Document   : Editar_Producto
    Created on : 29 nov 2023, 8:17:03
    Author     : altro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="templates/Referencias/Todas_Ref.jsp"/>
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="templates/Navegadores/Navegador_CV.jsp"/>
        <div class="d-flex flex-column w-100 justify-content-between cnf1 Inria">
            <section class="color1e"></section>
            <section class="color2e"></section>
            <div class="content_form w-100">
                <section class="d-flex text-white align-items-center p1_cnf">
                    <span class="txt_prin_cnf fw-bolder">Edita los Datos de tu Producto</span>
                    <i class="bi bi-question-circle quicon_cnf_lg" data-bs-toggle="tooltip" data-bs-placement="right"
                       data-bs-title="Tooltip on right"></i>
                </section>
                <div class="p2_cnf d-flex flex-column" method="post" id="FORM_CNF">
                    <section class="d-flex p21_cnf">
                        <a href="Anadir_Productos.html"><button type="button" class="btn btn-light btn_nav_cnf" id="Btn_DtNg">
                                Añadir Productos y/o Servicios
                            </button></a>
                        <button type="button" class="btn text-white btn_nav_cnf bg-dark">
                            Editar Producto
                        </button>
                    </section>
                    <div class="p22_cnf p-4 pt-3">
                        <span class="dt_txt_cnf" id="dt_txt_cnf">Datos de Producto</span>
                        <div class="form_cnf Productos_cnf justify-content-between" id="Productos_cnf">
                            <form class="prof1_cnf d-flex flex-column" method="post">
                                <section class="d-flex w-100 h-50 justify-content-around">

                                    <section class="prof1_s1">
                                        <section
                                            class="log_cnf d-flex flex-column justify-content-center align-items-center prof1_s11">
                                            <span class="fw-bold">Imagen del Producto o Servicio
                                                <i class="bi bi-question-circle" data-bs-toggle="tooltip"
                                                   data-bs-placement="right" data-bs-title="Tooltip on right"></i></span>
                                            <section class="Logo_Prev" id="Prod_Prev">
                                                <img src="" alt="Logo" id="Prev_img_Prod" class="Prev_Log" />
                                                <input type="file" class="d-none" name="Prod_cnf" id="Prod_cnf"
                                                       accept="image/png, image/jpeg" />
                                                <i class="bi bi-image Plus_L" id="Plus_Prod"></i>
                                            </section>
                                        </section>
                                    </section>
                                    <section class="prof1_s2 d-flex flex-column justify-content-around">
                                        <section>
                                            <span class="fw-bold">Nombre del Producto o Servicio
                                                <i class="bi bi-question-circle" data-bs-toggle="tooltip"
                                                   data-bs-placement="right" data-bs-title="Tooltip on right"></i></span>
                                            <input type="text" class="form-control" placeholder="Nombre de su Producto"
                                                   id="Nom_Pro_inp" />
                                        </section>
                                        <section>
                                            <span class="fw-bold">Precio del Producto o Servicio
                                                <i class="bi bi-question-circle" data-bs-toggle="tooltip"
                                                   data-bs-placement="right" data-bs-title="Tooltip on right"></i></span>
                                            <input type="number" class="form-control"
                                                   placeholder="Ingrese el precio de su producto" id="Pre_Prod_inp" />
                                        </section>
                                    </section>
                                </section>
                                <section class="d-flex flex-column w-100 h-50 justify-content-around">
                                    <section class="d-flex flex-column h-50">
                                        <span class="fw-bold">Descripcion del Producto o Servicio
                                            <i class="bi bi-question-circle" data-bs-toggle="tooltip"
                                               data-bs-placement="right" data-bs-title="Tooltip on right"></i></span>
                                        <textarea class="form-control txta_cnf" name="" id="Desc_Pro_inp"></textarea>
                                    </section>
                                    <section class="d-flex h-50 justify-content-around w-100 flex-column">
                                        <span class="fw-bold">Disponibilidad del Producto o Servicio
                                            <i class="bi bi-question-circle" data-bs-toggle="tooltip"
                                               data-bs-placement="right" data-bs-title="Tooltip on right"></i></span>
                                        <section class="d-flex h-50 w-100 justify-content-between align-items-center">
                                            <select class="form-select w-75" aria-label="Default select example"
                                                    id="Tip_Pro_inp">
                                                <option selected disabled hidden>
                                                    Seleccione la Disponibilidad de su Producto o Servicio
                                                </option>
                                                <option value="Disponible en todo momento">Disponible en todo momento
                                                </option>
                                                <option value="Por Pedido">Por Pedido</option>
                                                <option value="Mayoreo">Mayoreo</option>
                                                <option value="Solo por Unidad">Solo por Unidad</option>
                                                <option value="Disponible por un Tiempo">Disponible por un Tiempo</option>
                                                <option value="Proximamente">Proximamente</option>
                                            </select>
                                            <button type="submit" type="button"
                                                    class="btn btn-outline-dark btn_rosa h-75 text-white" id="btn_AProd">
                                                Actualizar Datos
                                            </button>
                                        </section>
                                    </section>
                                </section>
                            </form>
                            <div class="prof2_cnf">
                                <span class="dt_txt_cnf">Lista de Productos <i class="bi bi-question-circle"
                                                                               data-bs-toggle="tooltip" data-bs-placement="right"
                                                                               data-bs-title="Tooltip on right"></i></span>
                                <section class="w-100 Prod_Cont" id="Prod_Cont">
                                    <div class="prod d-flex" id="prod1">
                                        <img src="" alt="prod" class="img_prod_cnf">
                                        <input type="file" class="d-none" disabled>
                                        <section class="d-flex flex-column Prod_Lis">
                                            <input type="text" class="N_ProVP" value=" Nom_Prod_inp.value" disabled>
                                            <textarea type="text" class="D_ProVP" disabled>Desc_Pro_inp.value</textarea>
                                            <section class="d-flex w-100 justify-content-between">
                                                <input type="text" value="$" id="precio" disabled>
                                                <input type="text" id="dis" value="Disponibilidad" disabled>
                                                <form action="" method="post">
                                                    <button class="btn_elim_pro btn_rosa" type="submit">Editar</button>
                                                </form>
                                                <form action="" method="post">
                                                    <button class="btn_elim_pro btn_rosa" type="submit">Eliminar</button>
                                                </form>
                                            </section>
                                        </section>
                                    </div>
                                    <div class="prod d-flex" id="prod1">
                                        <img src="" alt="prod" class="img_prod_cnf">
                                        <input type="file" class="d-none" disabled>
                                        <section class="d-flex flex-column Prod_Lis">
                                            <input type="text" class="N_ProVP" value=" Nom_Prod_inp.value" disabled>
                                            <textarea type="text" class="D_ProVP" disabled>Desc_Pro_inp.value</textarea>
                                            <section class="d-flex w-100 justify-content-between">
                                                <input type="text" value="$" id="precio" disabled>
                                                <input type="text" id="dis" value="Disponibilidad" disabled>
                                                <form action="" method="post">
                                                    <button class="btn_elim_pro btn_rosa" type="submit">Editar</button>
                                                </form>
                                                <form action="" method="post">
                                                    <button class="btn_elim_pro btn_rosa" type="submit">Eliminar</button>
                                                </form>
                                            </section>
                                        </section>
                                    </div>
                                    <div class="prod d-flex" id="prod1">
                                        <img src="" alt="prod" class="img_prod_cnf">
                                        <input type="file" class="d-none" disabled>
                                        <section class="d-flex flex-column Prod_Lis">
                                            <input type="text" class="N_ProVP" value=" Nom_Prod_inp.value" disabled>
                                            <textarea type="text" class="D_ProVP" disabled>Desc_Pro_inp.value</textarea>
                                            <section class="d-flex w-100 justify-content-between">
                                                <input type="text" value="$" id="precio" disabled>
                                                <input type="text" id="dis" value="Disponibilidad" disabled>
                                                <form action="" method="post">
                                                    <button class="btn_elim_pro btn_rosa" type="submit">Editar</button>
                                                </form>
                                                <form action="" method="post">
                                                    <button class="btn_elim_pro btn_rosa" type="submit">Eliminar</button>
                                                </form>
                                            </section>
                                        </section>
                                    </div>
                                </section>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

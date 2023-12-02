<%-- 
    Document   : Hamburguer_CC
    Created on : 3 nov 2023, 0:46:49
    Author     : altro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="offcanvas offcanvas-end mn_hm" tabindex="-1" id="offcanvasNavbar"
     aria-labelledby="offcanvasNavbarLabel">
    <div class="offcanvas-header shadow hamburger_menu d-flex flex-column">
        <div class="d-flex align-items-center justify-content-between w-100">
            <h5 class="offcanvas-title text-white" id="offcanvasNavbarLabel"></h5>
            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas"
                    aria-label="Close"></button>
        </div>
        <div class="d-flex w-100 justify-content-between align-items-center">
            <div class="d-flex flex-column w-80">
                <section class="img_perfil shadow">
                    <img src="assets/Logo_Icon.png" alt="Perfil">
                </section>
                <span class="text-white tittle_c">Nombre de Usuario</span>
                <span class="text-white">correo@electronico.com</span>
            </div>
            <div class="d-flex flex-column justify-content-between ih">
                <button class="btn icons_h" data-bs-toggle="tooltip" id="btn_edit_h" data-bs-placement="left"
                        data-bs-title="Editar Cuenta"><i class="bi bi-gear-wide-connected"></i></button>
                <button class="btn icons_h" data-bs-toggle="tooltip" id="btn_guardado_h"
                        data-bs-placement="left" data-bs-title="Guardados"> <i
                        class="bi bi-bookmark-fill"></i></button>
                <button class="btn icons_h" data-bs-toggle="tooltip" id="btn_lgout_h" data-bs-placement="left"
                        data-bs-title="Cerrar Sesion"><i class="bi bi-box-arrow-right"></i></button>
            </div>
        </div>
    </div>
    <div class="offcanvas-body hamburger_body d-flex flex-column">
        <form class="d-flex mt-3 justify-content-center busq_hamburguer" method="post">
            <input class="form-control input_search" placeholder="Buscar... (Cafeterias, Abarrotes, Snacks)"
                   aria-label="Search">
            <button class="btn button_search" type="submit"><i class="bi bi-search text-white"></i></button>
        </form>
        <ul class="navbar-nav a_hamburguer">
            <li class="nav-item d-flex align-items-center">
                <div id="hamburguer_neg">
                    <i class="bi bi-shop"></i>
                    <span>Negocios</span>
                </div>
            </li>
            <li class="nav-item d-flex align-items-center">
                <div id="hamburguer_prod">
                    <i class="bi bi-bag"></i>
                    <span>Productos</span>
                </div>
            </li>
            <li class="nav-item d-flex align-items-center">
                <div id="hamburguer_prom">
                    <i class="bi bi-percent"></i>
                    <span>Promociones</span>
                </div>
            </li>
            <li class="nav-item d-flex align-items-center">
                <div id="hamburguer_res">
                    <i class="bi bi-chat-right-dots-fill"></i>
                    <span>Reseñas</span>
                </div>
            </li>
            <li class="nav-item d-flex align-items-center">
                <div id="hamburguer_pyr">
                    <i class="bi bi-question-diamond-fill"></i>
                    <span>Preguntas y Respuestas
                    </span>
                </div>
            </li>
            <li class="nav-item d-flex align-items-center">
                <div id="hamburguer_abt">
                    <i class="bi bi-people-fill"></i>
                    <span>Sobre Nosotros</span>
                </div>
            </li>
        </ul>
    </div>
</div>
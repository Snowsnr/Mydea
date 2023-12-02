<%-- 
    Document   : Hamburguer_CV
    Created on : 6 nov 2023, 10:17:08
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
            <div class="d-flex flex-column h-100 justify-content-around">
                <section class="img_perfil shadow">
                    <img src="assets/Logo_Icon.png" alt="Perfil">
                </section>
                <span class="text-white tittle_c">Nombre de Usuario</span>
                <span class="text-white">correo@electronico.com</span>
            </div>
            <div class="d-flex flex-column justify-content-between ih align-items-center">
                <div class="d-flex">
                    <button class="btn icons_h1" data-bs-toggle="tooltip" id="btn_edit_h"
                            data-bs-placement="left" data-bs-title="Editar Cuenta"><i
                            class="bi bi-gear-wide-connected"></i></button>
                    <button class="btn icons_h1" data-bs-toggle="tooltip" id="btn_neg_h"
                            data-bs-placement="left" data-bs-title="Mis Negocios"><svg class="book bh"
                                                                               xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 640 512">
                            <path
                                d="M36.8 192H603.2c20.3 0 36.8-16.5 36.8-36.8c0-7.3-2.2-14.4-6.2-20.4L558.2 21.4C549.3 8 534.4 0 518.3 0H121.7c-16 0-31 8-39.9 21.4L6.2 134.7c-4 6.1-6.2 13.2-6.2 20.4C0 175.5 16.5 192 36.8 192zM64 224V384v80c0 26.5 21.5 48 48 48H336c26.5 0 48-21.5 48-48V384 224H320V384H128V224H64zm448 0V480c0 17.7 14.3 32 32 32s32-14.3 32-32V224H512z" />
                        </svg></button>
                </div>
                <div class="d-flex">
                    <button class="btn icons_h1" data-bs-toggle="tooltip" id="btn_guardado_h"
                            data-bs-placement="left" data-bs-title="Guardados"> <i
                            class="bi bi-bookmark-fill"></i></button>

                    <button class="btn icons_h1" data-bs-toggle="tooltip" id="btn_fbk_h"
                            data-bs-placement="left" data-bs-title="Feedback"><svg class="book bh"
                                                                           xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 640 512">
                            <path
                                d="M88.2 309.1c9.8-18.3 6.8-40.8-7.5-55.8C59.4 230.9 48 204 48 176c0-63.5 63.8-128 160-128s160 64.5 160 128s-63.8 128-160 128c-13.1 0-25.8-1.3-37.8-3.6c-10.4-2-21.2-.6-30.7 4.2c-4.1 2.1-8.3 4.1-12.6 6c-16 7.2-32.9 13.5-49.9 18c2.8-4.6 5.4-9.1 7.9-13.6c1.1-1.9 2.2-3.9 3.2-5.9zM0 176c0 41.8 17.2 80.1 45.9 110.3c-.9 1.7-1.9 3.5-2.8 5.1c-10.3 18.4-22.3 36.5-36.6 52.1c-6.6 7-8.3 17.2-4.6 25.9C5.8 378.3 14.4 384 24 384c43 0 86.5-13.3 122.7-29.7c4.8-2.2 9.6-4.5 14.2-6.8c15.1 3 30.9 4.5 47.1 4.5c114.9 0 208-78.8 208-176S322.9 0 208 0S0 78.8 0 176zM432 480c16.2 0 31.9-1.6 47.1-4.5c4.6 2.3 9.4 4.6 14.2 6.8C529.5 498.7 573 512 616 512c9.6 0 18.2-5.7 22-14.5c3.8-8.8 2-19-4.6-25.9c-14.2-15.6-26.2-33.7-36.6-52.1c-.9-1.7-1.9-3.4-2.8-5.1C622.8 384.1 640 345.8 640 304c0-94.4-87.9-171.5-198.2-175.8c4.1 15.2 6.2 31.2 6.2 47.8l0 .6c87.2 6.7 144 67.5 144 127.4c0 28-11.4 54.9-32.7 77.2c-14.3 15-17.3 37.6-7.5 55.8c1.1 2 2.2 4 3.2 5.9c2.5 4.5 5.2 9 7.9 13.6c-17-4.5-33.9-10.7-49.9-18c-4.3-1.9-8.5-3.9-12.6-6c-9.5-4.8-20.3-6.2-30.7-4.2c-12.1 2.4-24.7 3.6-37.8 3.6c-61.7 0-110-26.5-136.8-62.3c-16 5.4-32.8 9.4-50 11.8C279 439.8 350 480 432 480z" />
                        </svg></button>
                </div>
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
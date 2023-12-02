<%-- 
    Document   : Navegador_CV
    Created on : 6 nov 2023, 10:15:04
    Author     : altro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="bg-body-tertiary container-fluid bg-white">
    <div class="row d-flex align-items-center p-1 h-100">
        <div class="col-3 d-flex">
            <a href="indexCV.jsp"><img src="assets/logo_mydea_comida.png" alt="logotipo" class="img-fluid logo"></a>
        </div>
        <form class="col-6 d-flex w-10" method="post" action="BuscadorCV.jsp" >
            <input class="form-control input_search" placeholder="Buscar... (Cafeterias, Abarrotes, Snacks)"
                   aria-label="Search" name="txt" >
                <button class="btn button_search" type="submit"><i class="bi bi-search text-white"></i></button>
        </form>

        <div class="col-3 d-flex justify-content-evenly">
            <div class="btn-group Cuenta_des w-50">
                <button type="button" class="btn btn-sm btn-secondary btn_count" id="btn_count_nav"><i
                        class="bi bi-person-circle"></i>Cuenta</button>
                <button type="button"
                        class="btn btn-sm btn-secondary dropdown-toggle dropdown-toggle-split btn_des w-0"
                        data-bs-toggle="dropdown" aria-expanded="false">
                </button>
                <ul class="dropdown-menu">
                    <li class="dropdown-item" id="btn_count2_nav">Revisar Cuenta</li>
                    <li class="dropdown-item" id="btn_edit_nav">Editar Cuenta</li>
                    <li class="dropdown-item" id="btn_sav2_nav">Guardados</li>
                    <li class="dropdown-item" id="btn_res_nav">Reseñas</li>
                    <li class="dropdown-item" id="btn_neg2_nav">Mis Negocios</li>
                    <li class="dropdown-item" id="btn_fbk_nav">Feedback</li>
                    <li class="dropdown-item" id="btn_sb_nav">Subir un Negocio</li>
                    <li>
                        <hr class="dropdown-divider">
                    </li>
                  <form action="CerrarSesion" id="formcerrar">
                        <li class="dropdown-item">
                            <button type="submit" id="btn_lgout_nav">Cerrar Sesión</button>
                        </li>
                    </form>
                </ul>
            </div>
            <button type="button" class="btn btn-sm btnp " data-bs-toggle="tooltip" id="btn_sav_nav"
                    data-bs-placement="bottom" data-bs-title="Guardados"> <i class="bi bi-bookmark-fill book"></i>
            </button>
            <button type="button" class="btn btn-sm btnp" data-bs-toggle="tooltip" id="btn_neg_nav"
                    data-bs-placement="bottom" data-bs-title="Mis Negocios"><svg class="book"
                                                                         xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 640 512">
                    <path
                        d="M36.8 192H603.2c20.3 0 36.8-16.5 36.8-36.8c0-7.3-2.2-14.4-6.2-20.4L558.2 21.4C549.3 8 534.4 0 518.3 0H121.7c-16 0-31 8-39.9 21.4L6.2 134.7c-4 6.1-6.2 13.2-6.2 20.4C0 175.5 16.5 192 36.8 192zM64 224V384v80c0 26.5 21.5 48 48 48H336c26.5 0 48-21.5 48-48V384 224H320V384H128V224H64zm448 0V480c0 17.7 14.3 32 32 32s32-14.3 32-32V224H512z" />
                </svg>
            </button>
        </div>
    </div>


</nav>
<script src="js/Nav_CV.js"></script>
let acceso = document.getElementById("btn_acceder");
let registro = document.getElementById("btn_registro");
let registro_h = document.getElementById("btn_registro_h");

acceso.addEventListener("click", () => {
    window.location.href = "Iniciar_Sesion.jsp";
});

registro.addEventListener("click", () => {
    window.location.href = "Registro.jsp";
});

registro_h.addEventListener("click", () => {
    window.location.href = "Registro.jsp";
});

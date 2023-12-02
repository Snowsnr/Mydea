/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
let icon = document.getElementsByClassName("contactos_usu_perfil");

for (var i = 0; i < icon.length; i++) {
    icon[i].addEventListener("click", function() {
        var textoParaCopiar = this.getAttribute("data-bs-title");;

        navigator.clipboard.writeText(textoParaCopiar).then(function() {
            Swal.fire({
                title: "CONTACTO COPIADO EN PORTAPAPELES",
                text: "Contacto copiado: "+textoParaCopiar,
                icon: "success",
                showConfirmButton: false,
                timer: 2000,
                timerProgressBar: true
            });            
        }).catch(function() {
            Swal.fire({
                title: "ERROR AL COPIAR EL CONTACTO",
                text: "Si el problema continua contactese con ETHEV.",
                icon: "warning",
                showConfirmButton: false,
                timer: 2000,
                timerProgressBar: true
            }); 
        });
    });
}

let contact = document.getElementsByClassName("contact_red_cu");

for (var i = 0; i < contact.length; i++) {
    contact[i].addEventListener("click", function(e) {
        var vinculo = this.getAttribute("href");
        e.preventDefault();
        Swal.fire({
            title: "Será redireccionado a otra pagina",
            text: "¿Esta seguro de continuar?",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "rgb(224, 177, 23)",
            cancelButtonColor: "#D95538",
            confirmButtonText: "Aceptar",
            cancelButtonText: "Cancelar"
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = vinculo;
            }
        });
    });
}

let contact2 = document.getElementsByClassName("contact_red_cu2");

for (var i = 0; i < contact2.length; i++) {
    contact2[i].addEventListener("click", function(e) {
        e.preventDefault();
        Swal.fire({
            title: "No ha configurado esta red social",
            text: "¿Desea configurarla?",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "rgb(224, 177, 23)",
            cancelButtonColor: "#D95538",
            confirmButtonText: "Aceptar",
            cancelButtonText: "Cancelar"
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = "Editar_CuentaCV.jsp";
            }
        });
    });
}
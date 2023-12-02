let divs_pro = document.querySelectorAll('.card_pro_most');
let btn_scroll = document.getElementById("btn_sub");
let select_dis = document.getElementById('select_sp');
document.addEventListener('DOMContentLoaded', function () {
    var radiosDias = document.querySelectorAll('.form-check-input');
    radiosDias.forEach(function (radio) {
        radio.addEventListener('click', function () {
            mostrarDiv(this.id);
            console.log(this.id);
        });
    });
});

let buscador_n = document.getElementById("Busq_Pro_inp_n");
buscador_n.addEventListener("keyup", (e) => {
    var letra = e.key;
    let divs_pro = document.querySelectorAll('.card_pro_most');
    for (var i = 0; i < divs_pro.length; i++) {
        let tt = divs_pro[i].querySelector("#tt_pro_most").textContent.toUpperCase();
        divs_pro[i].classList.remove('card_pro_most_active');
        if (tt == buscador_n.value.toUpperCase()) {
            divs_pro[i].classList.add('card_pro_most_active');
        }
        if (buscador_n.value == "") {
            divs_pro[i].classList.add('card_pro_most_active');
        }
    }
});


function mostrarDiv(diaSeleccionado) {
    // Ocultar todos los divs
    console.log(diaSeleccionado)
    var divs = document.getElementsByClassName('inpb_cnf');
    for (var i = 0; i < divs.length; i++) {
        divs[i].style.display = 'none';
    }

    // Mostrar el div correspondiente al día seleccionado
    var divMostrar = document.getElementById('h' + diaSeleccionado + '_cnf');
    console.log(divMostrar);
    if (divMostrar) {
        divMostrar.style.display = 'flex';
    }
}

document.addEventListener('DOMContentLoaded', function () {

    let scrollButton = document.getElementById('btn_Sen');

    scrollButton.addEventListener('click', function () {
        var windowHeight = window.innerHeight;

        var scrollAmount = 0.935 * windowHeight;
        window.scrollBy(0, scrollAmount);
    });
});

window.addEventListener('load', function () {
    window.scrollTo(0, 0);
    if (window.scrollY === 0) {
        btn_scroll.style.display = "none";
    }
});

window.addEventListener('scroll', function () {
    var scrollAmount = window.scrollY;

    var totalHeight = document.documentElement.scrollHeight - window.innerHeight;

    var scrollPercentage = (scrollAmount / totalHeight) * 100;

    if (scrollPercentage > 60) {
        btn_scroll.style.display = "flex";
    } else {
        btn_scroll.style.display = "none";

    }
});
btn_scroll.addEventListener("click", () => {
    window.scrollTo(0, 0);
    if (window.scrollY === 0) {
        btn_scroll.style.display = "none";
    }
});

//CAMBIAR EL COLOR DE LOS BOTONES DE LOS PRODUCTOS
let botones = document.querySelectorAll('.btn_sp');
let txt_busq = document.getElementById("Busqueda_pro");

botones.forEach(function (boton) {
    boton.addEventListener('click', function () {
        botones.forEach(function (b) {
            b.classList.remove('btn_active');
            boton.classList.add('sp_div_n_desactive');
        });

        boton.classList.add('btn_active');

        txt_busq.textContent = boton.textContent;
    });
});



document.getElementById('general_most').addEventListener('click', function () {
    OrdenarGeneral();
});

var ordenOriginal = [];
let contenedor = document.getElementById('Cont_pr_most');

//ORDENAR POR PRECIOS
document.getElementById('precios_most').addEventListener('click', function () {
    OrdenarporPrecio();
});

function OrdenarporPrecio() {
    if (ordenOriginal.length === 0) {
        ordenOriginal = Array.from(contenedor.children);
    }

    var divs = Array.from(contenedor.children).filter(function (child) {
        return child.tagName === 'SECTION';
    });

    var divsOrdenados = divs.map(function (div) {
        return div.cloneNode(true);
    }).sort(function (a, b) {
        var numeroA = parseInt(a.querySelector('.pre_most_pro').textContent);
        var numeroB = parseInt(b.querySelector('.pre_most_pro').textContent);
        return numeroA - numeroB;
    });

    divs.forEach(function (div) {
        div.remove();
    });

    divsOrdenados.forEach(function (div) {
        contenedor.appendChild(div);
    });
}

//ORDENAR POR CALIFICACION
document.getElementById('calif_most').addEventListener('click', function () {
    OrdenarporCalf();
});

function OrdenarporCalf() {
    if (ordenOriginal.length === 0) {
        ordenOriginal = Array.from(contenedor.children);
    }

    var divs = Array.from(contenedor.children).filter(function (child) {
        return child.tagName === 'SECTION';
    });

    var divsOrdenados = divs.map(function (div) {
        return div.cloneNode(true);
    }).sort(function (a, b) {
        var numeroA = parseInt(a.querySelector('.num_calf_most').textContent);
        var numeroB = parseInt(b.querySelector('.num_calf_most').textContent);
        return numeroB - numeroA; // Cambiar la lógica de comparación para ordenar de más alto a más bajo
    });

    divs.forEach(function (div) {
        div.remove();
    });

    divsOrdenados.forEach(function (div) {
        contenedor.appendChild(div);
    });
}

//ORDENAR POR COMENTARIOS
document.getElementById('comen_most').addEventListener('click', function () {
    OrdenarporCom();
});

function OrdenarporCom() {
    if (ordenOriginal.length === 0) {
        ordenOriginal = Array.from(contenedor.children);
    }

    var divs = Array.from(contenedor.children).filter(function (child) {
        return child.tagName === 'SECTION';
    });

    var divsOrdenados = divs.map(function (div) {
        return div.cloneNode(true);
    }).sort(function (a, b) {
        var numeroA = parseInt(a.querySelector('.num_com_most').textContent);
        var numeroB = parseInt(b.querySelector('.num_com_most').textContent);
        return numeroB - numeroA; // Cambiar la lógica de comparación para ordenar de más alto a más bajo
    });

    divs.forEach(function (div) {
        div.remove();
    });

    divsOrdenados.forEach(function (div) {
        contenedor.appendChild(div);
    });
}

function OrdenarGeneral() {
    var contenedor = document.getElementById('Cont_pr_most');

    if (ordenOriginal.length > 0) {
        Array.from(contenedor.children).forEach(function (child) {
            child.remove();
        });

        ordenOriginal.forEach(function (div) {
            contenedor.appendChild(div.cloneNode(true));
        });

        ordenOriginal = [];
    }
    let divs_pro = document.querySelectorAll('.card_pro_most');
    let valorSeleccionado = select_dis.value;
    divs_pro.forEach(function (div) {
        div.classList.remove('card_pro_most_active');
        if (valorSeleccionado == "General" || valorSeleccionado == "Disponibilidad") {
            div.classList.add('card_pro_most_active');
        }
    });
    divs_pro.forEach(function (div) {
        var input = div.querySelector('input');
        if (input && input.value == valorSeleccionado) {
            div.classList.add('card_pro_most_active');
        }
    });
}

//Btn Like
let sin_like_n = document.getElementById("h_sc_n");
let con_like_n = document.getElementById("h_cc_n");

sin_like_n.addEventListener("click", () => {
    sin_like_n.style.display = "none";
    con_like_n.style.display = "flex";
});

con_like_n.addEventListener("click", () => {
    sin_like_n.style.display = "flex";
    con_like_n.style.display = "none";
});

let slider_negou = document.getElementById("res_neg_ou");

document.getElementById('prev_ros').addEventListener('click', function () {
    slider_negou.scrollBy({ left: -680, behavior: 'smooth' });
});

document.getElementById('next_ros').addEventListener('click', function () {
    slider_negou.scrollBy({ left: 680, behavior: 'smooth' });
});
//MANDAR LOS DTS AL NEGOCIO ESPECIFICO

divs_pro.forEach(function (div) {
    div.addEventListener('click', function () {
        copiarDatos(this);
    });
});

function copiarDatos(divClicado) {
    let nombre = divClicado.querySelector("#tt_pro_most").textContent;
    let precio = divClicado.querySelector("#pre_most_pro").textContent;
    let calificacion = divClicado.querySelector("#num_calf_most").textContent;
    let descripcion = divClicado.querySelector("#desc_com_pro").textContent;
    let disponibilidad = divClicado.querySelector(".dis_most_pro").value;
    let destinoDiv = document.getElementById('producto_epecifico');
    let img = divClicado.querySelector("#card-img-top").src;
    destinoDiv.style.display = "flex";
    destinoDiv.querySelector("#npv_pro_esp").textContent = nombre;
    destinoDiv.querySelector("#pre_pro_esp").textContent = "$" + precio;
    destinoDiv.querySelector("#cal_pro_esp").innerHTML = '<i class="bi bi-heart-fill"></i> ' + calificacion;
    destinoDiv.querySelector("#des_pro_esp").textContent = descripcion;
    destinoDiv.querySelector("#dis_pro_esp").textContent = disponibilidad;
    destinoDiv.querySelector("#img_pro_mosr_espe").src = img;
}

let divEspecifico = document.getElementById('producto_epecifico');
divEspecifico.addEventListener("click", (e) => {
    if (e.target === divEspecifico) {
        divEspecifico.style.display = "none";
    }
});


select_dis.addEventListener('change', function () {
    let divs_pro = document.querySelectorAll('.card_pro_most');
    if (ordenOriginal.length === 0) {
        ordenOriginal = Array.from(contenedor.children);
    }
    let valorSeleccionado = select_dis.value;

    divs_pro.forEach(function (div) {
        div.classList.remove('card_pro_most_active');
        if (valorSeleccionado == "General") {
            div.classList.add('card_pro_most_active');
        }
    });

    divs_pro.forEach(function (div) {
        var input = div.querySelector('input');
        if (input && input.value == valorSeleccionado) {
            div.classList.add('card_pro_most_active');
        }
    });
});

//CAMBIAR COLOR BOTONES IMG
let btn_neg_img = document.getElementById("btns_imgn");
let btn_pro_img = document.getElementById("btns_imgp");
let neg_img_most = document.querySelectorAll(".imgneg");
let pro_img_most = document.querySelectorAll(".imgpro");
btn_neg_img.classList.add("bnts_img_sec_active");
btn_pro_img.classList.add("bnts_img_sec_des");
btn_neg_img.addEventListener("click", ()=>{
    btn_neg_img.classList.remove("bnts_img_sec_des");
    btn_neg_img.classList.add("bnts_img_sec_active");
    btn_pro_img.classList.remove("bnts_img_sec_active");
    btn_pro_img.classList.add("bnts_img_sec_des");
    neg_img_most.forEach(function(neg){
        neg.style.display = "flex";
    });
    pro_img_most.forEach(function(pro){
        pro.style.display = "none";
    });
});
btn_pro_img.addEventListener("click", ()=>{
    btn_neg_img.classList.add("bnts_img_sec_des");
    btn_neg_img.classList.remove("bnts_img_sec_active");
    btn_pro_img.classList.add("bnts_img_sec_active");
    btn_pro_img.classList.remove("bnts_img_sec_des");
    neg_img_most.forEach(function(neg){
        neg.style.display = "none";
    });
    pro_img_most.forEach(function(pro){
        pro.style.display = "flex";
    });
});

//REPORTES
let radioInputs = document.querySelectorAll(".Option_R");
let Cancelar_R = document.getElementById("Cancelar_R");
let Continuar_R = document.getElementById("Continuar_R");
let Radio = document.querySelectorAll(".Option_R");
let Ventana_R = document.getElementById("Emergente_Reporte");
let BR = document.getElementById("Reporte");
let List = document.getElementById("Opciones_Reporte");
let Regresar_R = document.getElementById("Regresar");
let Text_R = document.getElementById("Input_Form");
let Tipo_R = document.getElementById("Tipo_Reporte_Txt");
let Enviar_R = document.getElementById("Enviar_R");
let Info_R = document.getElementById("Info");
let Info_Txt = document.getElementById("Info_txt");

function deselectOtherOptions(selectedOption) {
  for (var i = 0; i < radioInputs.length; i++) {
    if (radioInputs[i] !== selectedOption) {
      radioInputs[i].checked = false;
    }
  }
}

for (var i = 0; i < radioInputs.length; i++) {
  radioInputs[i].addEventListener("click", function () {
    deselectOtherOptions(this);
  });
}

BR.addEventListener("click", function () {
  Ventana_R.style.display = "flex";
});

Ventana_R.addEventListener("click", (e) => {
  if (e.target === Ventana_R) {
    Ventana_R.style.display = "none";

    Radio.forEach((R) => {
      R.checked = false;
      List.style.display = "flex";
      Text_R.style.display = "none";
      Tipo_R.innerText = "";
      Cancelar_R.style.display = "flex";
      Continuar_R.style.display = "flex";
      Regresar_R.style.display = "none";
      Enviar_R.style.display = "none";
    });
  }
});

Cancelar_R.addEventListener("click", function () {
  Radio.forEach((R) => {
    R.checked = false;
  });
  Ventana_R.style.display = "none";
  List.style.display = "flex";
  Text_R.style.display = "none";
  Tipo_R.innerText = "";
});
Continuar_R.addEventListener("click", function () {
  mandarInput();
  List.style.display = "none";
  Text_R.style.display = "flex";
  Cancelar_R.style.display = "none";
  Continuar_R.style.display = "none";
  Regresar_R.style.display = "flex";
  Enviar_R.style.display = "flex";
});

function mandarInput() {
  for (var i = 0; i < radioInputs.length; i++) {
    if (radioInputs[i].checked) {
      Tipo_R.innerText = radioInputs[i].value;
    }
  }
}
Regresar_R.addEventListener("click", function(){
  List.style.display = "flex";
  Text_R.style.display = "none";
  Cancelar_R.style.display = "flex";
  Continuar_R.style.display = "flex";
  Regresar_R.style.display = "none";
  Enviar_R.style.display = "none";
  Tipo_R.innerText = "";
});

var dir_loc = document.getElementsByClassName("dir_loc");
let cop_dir = document.getElementById("cop_dir");

cop_dir.addEventListener("click", ()=>{
    for (var i = 0; i < dir_loc.length; i++) {
        dir_loc[i].click();
    }
});

for (var i = 0; i < dir_loc.length; i++) {
    dir_loc[i].addEventListener("click", function() {
        var textoParaCopiar = this.getAttribute("data-bs-title");

        navigator.clipboard.writeText(textoParaCopiar).then(function() {
            Swal.fire({
                title: "DIRECCIÓN COPIADA EN PORTAPAPELES",
                text: "Dirección copiado: "+textoParaCopiar,
                icon: "success",
                showConfirmButton: false,
                timer: 2000,
                timerProgressBar: true
            });            
        }).catch(function() {
            Swal.fire({
                title: "ERROR AL COPIAR LA DIRECCIÓN",
                text: "Si el problema continua contactese con ETHEV.",
                icon: "warning",
                showConfirmButton: false,
                timer: 2000,
                timerProgressBar: true
            }); 
        });
    });
}
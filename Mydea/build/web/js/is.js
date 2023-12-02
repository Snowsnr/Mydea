/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
let Nom_usu_is = document.getElementById("Nom_usu_is");
let Email_is = document.getElementById("Email_is");
let Con_is = document.getElementById("Con_is");
let Boton_is = document.getElementById("Boton_is");

document.addEventListener('keyup', ()=>{
    if(Nom_usu_is.value !=="" && Email_is.value !=="" && Con_is.value !==""){
        Boton_is.classList.remove("btns_is");
        Boton_is.classList.add("btns_is_active");
    }else{
        Boton_is.classList.add("btns_is");
        Boton_is.classList.remove("btns_is_active");
    }
});


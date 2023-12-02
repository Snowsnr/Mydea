/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
let Nombre_com_reg = document.getElementById("Nom_com_reg");
let Nom_usu_reg = document.getElementById("Nom_usu_reg");
let Email_reg = document.getElementById("Email_reg");
let Num_reg = document.getElementById("Num_reg");
let Con_reg = document.getElementById("Con_reg");
let ConCon_reg = document.getElementById("ConCon_reg");
let Boton_reg = document.getElementById("btns_reg");
let Check1 = document.getElementById("TyC_reg");
let Check2 = document.getElementById("AP_reg");

document.addEventListener('keyup', ()=>{
    if(Nombre_com_reg.value != "" && Nom_usu_reg.value !="" && Email_reg.value !="" && Num_reg.value !="" && Con_reg.value !="" && ConCon_reg.value !=""){
        Boton_reg.classList.remove("btns_reg");
        Boton_reg.classList.add("btns_reg_active");
    }else{
        Boton_reg.classList.add("btns_reg");
        Boton_reg.classList.remove("btns_reg_active");
    }
});

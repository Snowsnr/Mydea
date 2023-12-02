/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

let n1 = document.getElementById("n1").value;
let n2 = document.getElementById("n2").value;
let n3 = document.getElementById("n3").value;
let n4 = document.getElementById("n4").value;
let n5 = document.getElementById("n5").value;
let n6 = document.getElementById("n6").value;
let code = document.getElementById("code");
window.addEventListener("keyup", ()=>{
    code.value = n1 + n2 + n3 + n4 + n5 + n6;
    console.log(code.value);
});
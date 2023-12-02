let cancel_cn = document.getElementById("cancel_cn");
let neg_cn = document.getElementById('constr_cn');

cancel_cn.addEventListener("click", ()=>{
    window.history.back();
});

neg_cn.addEventListener('click', ()=>{
    window.location.href = 'CrearNegocio_Formulario.jsp';
});
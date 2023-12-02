/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


let FORM_CNF = document.getElementById("prof1_cnf");
let Btn_S = document.getElementById("btn_AProd");
const img3 = document.getElementById('inpt_file_img_perf');
let IMG3 = document.getElementById('ft');

const CLOUDINARY_URL = `https://api.cloudinary.com/v1_1/digt8oaow/image/upload`;
const CLOUDINARY_UPLOAD_PRESET = 'oxfoqolm';


Btn_S.addEventListener('click', async (e) => {
    if(img3.files.length!==0){
    event.preventDefault();
    const file = img3.files[0];
    const formData = new FormData();
    formData.append('file', file);
    formData.append('upload_preset', CLOUDINARY_UPLOAD_PRESET);

    // Send to cloudianry
    const res = await axios.post(
        CLOUDINARY_URL,
        formData,
        {
            headers: {
                'Content-Type': 'multipart/form-data'
            }
           
        }
    );

    IMG3.value = res.data.secure_url;
    }else{
    console.log("Hola "+img3.files);
} 
});


Btn_S.addEventListener("click", (event) => {
  event.preventDefault();
  Swal.fire({
    title: "¿Está seguro de subir esta novedad?",
    text: "Una vez confirme su novedad sera publicada (Puede editar los datos de la novedad despues).",
    icon: "warning",
    showCancelButton: true,
    confirmButtonColor: "rgba(244, 55, 112, 0.8)",
    cancelButtonColor: "#971A40",
    confirmButtonText: "Aceptar",
    cancelButtonText: "Cancelar"
  }).then((result) => {
    if (result.isConfirmed) {
        
        
         FORM_CNF.submit();
      
    }
  });
});

let nue_img = document.getElementById("nimg_most");
let inpt_file_img_perf = document.getElementById("inpt_file_img_perf");
let icon_img_most = document.getElementById("icon_img_most");


nue_img.addEventListener("click", () => {
    inpt_file_img_perf.click();
});

icon_img_most.addEventListener("click", () => {
    inpt_file_img_perf.click();
});

function showPreviewImage(event) {
    /*Most_Img.style.display = "flex";
    Plus_Logo.style.position = "absolute";*/
    const file = event.target.files[0];
    const reader = new FileReader();

    reader.onload = function (event) {
        nue_img.src = event.target.result;
    };

    if (file) {
        reader.readAsDataURL(file);
    }
}
inpt_file_img_perf.addEventListener("change", showPreviewImage);
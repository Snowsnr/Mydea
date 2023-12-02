let Plus_Prod = document.getElementById("Plus_Prod");
let Input_ProdL = document.getElementById("Prod_cnf");
let Most_Img_Prod = document.getElementById("Prev_img_Prod");

/PRODUCTO/
Plus_Prod.addEventListener("click", function () {
    Input_ProdL.click();
  });
  
  function showPreviewImage_Prod(event) {
    Most_Img_Prod.style.display = "flex";
    Plus_Prod.style.position = "absolute";
    const file = event.target.files[0];
    const reader = new FileReader();
  
    reader.onload = function (event) {
      Most_Img_Prod.src = event.target.result;
    };
  
    if (file) {
      reader.readAsDataURL(file);
    }
  }
  
  Input_ProdL.addEventListener("change", showPreviewImage_Prod);
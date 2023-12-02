<%-- 
    Document   : Buscador
    Created on : 20 nov 2023, 19:10:31
    Author     : altro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Clases.Conexion"%>
<%@page import="Clases.Persona"%>
<%@page import="Clases.Usuario"%>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
     <%
    HttpSession session1 = request.getSession(false);
    if (session1.getAttribute("usuario") != null) {

    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="templates/Referencias/Todas_Ref.jsp"/>
        <title><%=request.getParameter("txt")%></title>
    </head>
    <body>
        <jsp:include page="templates/Navegadores/Navegador_CV.jsp"/>
        <div class="busq_cont_prin">
            <div class="w-100 h-100 cont_busq_res_txt d-flex flex-column Inria">
                <section>
                    <span class="busqueda">"General"</span>
                    <section class="botones_busq">
                        <button class="btn_busq" id="General_btn_busq">General</button>
                        <button class="btn_busq" id="Productos_btn_busq">Productos</button>
                        <button class="btn_busq" id="Negocios_btn_busq">Negocios</button>
                        <button class="btn_busq" id="Usuarios_btn_busq">Usuarios</button>
                    </section>
                </section>
                <div class="cont_busq_res">
                    
                            <%
          String bs = request.getParameter("txt");
          Conexion con;
          Connection c;
          Statement stmt;
          ResultSet rs, rs2, rs3;
          
          int id;
          int i=0;
            
        %>
        <%
          con = new Conexion();
          con.setCon();
          c = con.getCon();
          stmt = c.createStatement();
          rs= stmt.executeQuery("SELECT n.*,d.*,p.per_foto,u.usu_nombre FROM Negocio n INNER JOIN Direccion d inner join Persona p inner join Usuario u where "
                  + "n.dir_id=d.dir_id and n.per_id = p.per_id and p.usu_id = u.usu_id and n.neg_activo = 1 AND neg_nombre LIKE '"+bs+"%' ;");
           if(rs!=null){
           while(rs.next()){
           String nombre = rs.getString("neg_nombre");
            String nombreu = rs.getString("usu_nombre");
            String img = rs.getString("neg_logo");
            String foto = rs.getString("per_foto");
            String colonia = rs.getString("dir_colonia");
            String calle = rs.getString("dir_calle");
            String desc = rs.getString("neg_descripcion");
            int numero = rs.getInt("dir_numero");
            int idn = rs.getInt("neg_id");
            String direccion = colonia + ", "+calle+", "+numero;
           
            
        %>
                    
                    <section class="busq_result busq_neg" id="negbusq">
                        <img src="<%=img%>" alt="" class="w-25" id="img_loc_busq">
                        <section class="w-100">
                            <span class="nb_busq nb" id="nb_busq"><%=nombre%></span>
                            <section class="d-flex desc_bus">
                                <section class="d-flex dir_bus w-100">
                                    <i class="bi bi-geo-alt-fill"></i>
                                    <span id="dir_neg_busq"><%=direccion%></span>
                                </section>
                                <section class="d-flex flex-column num_busq justify-content-between align-items-center w-75">
                                    <section>
                                        <i class="bi bi-heart-fill"></i> <span id="calf_neg_busq">000001</span>
                                    </section>
                                    <section>
                                        <i class="bi bi-chat-square-dots-fill"></i> <span id="com_neg_busq">000001</span>
                                    </section>
                                </section>
                            </section>
                        </section>
                        <section class="d-none" id="otros_dts">
                            <input type="text" value="<%=desc%>" id="desc_busq">
                            <img src="<%=foto%>" alt="Foto Perfil Dueño" id="FP_Neg_busq">
                            <img src="<%=img%>" alt="Foto Del Negocio" id="FN_Neg_busq">
                            <input type="text" value="<%=nombreu%>" id="Nom_per_neg_busq">
                            <input type="text" class="d-none" value="<%=idn%>" id="id_neg_bus">
                        </section>
                    </section>
                    <%}
                        }
                        %>
                    
                        <%
            rs2= stmt.executeQuery("SELECT p.per_foto, p.per_descripcion, per_id, u.usu_nombre, u.tip_id from Persona p inner join Usuario u where u.usu_id=p.usu_id AND usu_nombre LIKE '"+bs+"%' ;");
           if(rs2!=null){
           while(rs2.next()){
           
           String unom = rs2.getString("usu_nombre");
           String pfoto = rs2.getString("per_foto");
           String descripcion = rs2.getString("per_descripcion");
           int pid = rs2.getInt("per_id");
           int tipo = rs2.getInt("tip_id");
            

           if(tipo==1){
        %>
        
        <form class="busq_result busq_usu" id="usubusq" method="post" action="Visitar_Cuenta_UsuarioCV.jsp" >
                        <input class="d-none" type="text" disabled>
                        <button class="d-none" type="submit" id="btn_smt_usu"></button>
                        <img src="<%=pfoto%>" alt="" id="usu_img_busq">
                        <section class="d-flex flex-column">
                            <span class="nb_busq nb"><%=unom%></span>
                            <span class="dir_bus w-100 desc_busq"><%=descripcion%></span>
                        </section>
                        <input type="hidden" name="idu" value="<%=pid%>"/>
                    </form>
                            <%
                                }else if(tipo==2){
                                %>
        <form class="busq_result busq_usu" id="usubusq" method="post" action="Visitar_Vendedor_PerfilCV.jsp" >
                        <input class="d-none" type="text" disabled>
                        <button class="d-none" type="submit" id="btn_smt_usu"></button>
                        <img src="<%=pfoto%>" alt="" id="usu_img_busq">
                        <section class="d-flex flex-column">
                            <span class="nb_busq nb">Vendedor <%=unom%></span>
                            <span class="dir_bus w-100 desc_busq"><%=descripcion%></span>
                        </section>
                        <input type="hidden" name="idu" value="<%=pid%>"/>
                    </form>
                    
        <%
            }
            }
            }
            %>
                    
            <%
                rs3= stmt.executeQuery("SELECT * from Producto where pro_nombre LIKE '"+bs+"%' ;");
           if(rs3!=null){
           while(rs3.next()){
           
          String pnom = rs3.getString("pro_nombre");
          String pimg = rs3.getString("pro_imagen");
          int precio = rs3.getInt("pro_precio");
          int nid = rs3.getInt("neg_id");
                %>
            
            
                <form class="busq_result busq_pr" id="probusq" method="post" action="NegocioCV.jsp" >
                        <input class="d-none" type="text" disabled>
                        <button class="d-none" type="submit" id="btn_smt_pro"></button>
                        <img src="<%=pimg%>" alt="">
                        <span class="nb_busq w-50 h-100 d-flex align-items-center nb"><%=pnom%></span>
                        <section
                            class="d-flex flex-column w-50 h-100 align-items-center justify-content-around num_pro_busq">
                            <span>$<%=precio%></span>
                            <section class="d-flex">
                                <span><i class="bi bi-heart-fill"></i> 000000</span>
                                <span><i class="bi bi-chat-square-dots-fill"></i> 000000</span>
                            </section>
                        </section>
                        <input type="hidden" name="idn" value="<%=nid%>"/>
                    </form>
                    
                <%
                    }
}
c.close();
                    %>
                    
                </div>
            </div>
            <form class="w-50 h-100 cont_busq_most Inria" method="post" action="NegocioCV.jsp" >
                <input type="text" class="d-none" id="id_neg_vp" name="idn" >
                <img src="assets/neg2.jpg" alt="" class="neg_img_vp" id="neg_img_vp">
                <section class=" flex-column secc_neg_vp" id="secc_neg_vp">
                    <img src="assets/Logo_Icon.png" alt="Imgagen Negocio" class="Logo_Negocio_vp" id="Logo_Negocio_vp">
                    <span class="Nomb_pro_vp" id="Nomb_pro_vp">Nombre</span>
                    <section class="d-flex flex-column w-100 justify-content-center">
                        <section class="d-flex align-items-center nd_vp justify-content-center">
                            <img src="assets/Logo_Icon.png" alt="" class="fp_neg_vp" id="fp_neg_vp">
                            <span class="de" id="nd_vp">Nombre del dueño</span>
                        </section>
                    </section>
                    <span class="Desc_neg_vp" id="Desc_neg_vp">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolorem expedita
                        odio minus ipsa consequuntur, vel architecto rem sed commodi enim error numquam doloremque quae
                        eaque aliquid totam corrupti voluptate itaque. Lorem ipsum dolor sit, amet consectetur adipisicing
                        elit. Ratione quam numquam excepturi quo sit non quaerat totam nam minus amet obcaecati voluptate
                        facere quia architecto dolores aperiam, beatae quidem vero.</span>
                    <section class="d-flex w-100 cont_dts_neg_vp">
                        <section class="w-75 d-flex align-items-center"><i class="bi bi-geo-alt-fill"></i> <span
                            class="dir_vp" id="dir_vp">Lorem ipsum dolor sit amet consectetur adipisicing elit. Rerum
                            quos quasi a
                            quod suscipit maiores architecto praesentium culpa nulla obcaecati dicta cumque deserunt
                            similique odio, blanditiis consequuntur. Eum, ipsam obcaecati!</span></section></section>
                        <section class="d-flex flex-column w-50 num_vp justify-content-around">
                            <section class="d-flex"><i class="bi bi-heart-fill"></i><span id="calf_neg_vp"> 000000</span></section>
                            <section class="d-flex"><i class="bi bi-chat-square-dots-fill"></i><span id="com_neg_vp">000000</span></section>
                        </section>
                     <button type="submit" class="btn_busq">Explorar Negocio</button>
                    </section>
                   
            </form>
        </div>
        <script>
            // Activar todos los tooltips
            var tooltips = new bootstrap.Tooltip(document.body, {
                selector: '[data-bs-toggle="tooltip"]',
            });
        </script>
<%
            }else{
    System.out.println("Error: Sesión no existe");
    response.sendRedirect("index.jsp");
}
            %>
        <script src="js/Nav.js"></script>
        <script src="js/busq.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </body>
</html>

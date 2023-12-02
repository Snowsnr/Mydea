<%-- 
    Document   : Comentarios_Hechos
    Created on : 20 nov 2023, 21:37:40
    Author     : altro
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Clases.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession session1 = request.getSession(false);
    if (session1.getAttribute("usuario") != null) {

    %>

<%@page session="true"%>

<%@page import="Clases.Usuario" %>
<%@page import="Clases.Persona" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="templates/Referencias/Todas_Ref.jsp"/>
        <title>Tus Comentarios</title>
    </head>
    <jsp:include page="templates/Navegadores/Navegador_CV.jsp"/>
    <%
        HttpSession misession = (HttpSession) request.getSession();
        Usuario usuario = (Usuario) misession.getAttribute("usuario");
        String nombre = usuario.getUsu_nom();
        String pass = usuario.getUsu_pass();
        Persona per = (Persona) misession.getAttribute("persona");
        String correo = per.getPer_correo();
        String foto = per.getPer_foto();
        String telefono = per.getPer_telefono();
        String nombrereal = per.getPer_nombrereal();
        String fb = per.getPer_fb();
        String ig = per.getPer_ig();
        String tw = per.getPer_twitter();
        String web = per.getPer_web();
    %>

    <div class="rv_contprin w-100">
        <div class="rv_cont_usu h-100 d-flex justify-content-center align-items-center">
            <section class="prop_neg_cont">
                <span class="prop_neg d-flex justify-content-center align-items-center">
                    <section class="card_neg h-100 d-flex flex-column align-items-center justify-content-evenly">
                        <section class="bord_color">
                            <div></div>
                        </section>
                        <img src="<%=foto%>" alt="">
                        <span class="nu_span_n"><%=nombre%></span>

                    </section>

                </span>
            </section>
        </div>
        <div class="d-flex flex-column res_otr_usu_cont">
            <span class="Inria tt_ch">Reseñas Hechas</span>
            <div class="cont_res_var d- flex-column">
                
                    <%

                        Conexion con;
                        Connection c;
                        Statement stmt;
                        ResultSet rs, rs2 = null;
                        con = new Conexion();
                        con.setCon();
                        c = con.getCon();
                        stmt = c.createStatement();
                        int pid = 0;
                        if (request.getParameter("idu") != null)
                        {

                            rs2 = stmt.executeQuery("select * from Feedback where per_id=" + request.getParameter("idu") + ";");

                        } else
                        {

                            pid = con.Pid(correo);
                            rs2 = stmt.executeQuery("select * from Feedback where per_id=" + pid + ";");
                        }

                        String p = null;

                        while (rs2.next())
                        {
                            p = "1";

                        }
                        if (p != null)
                        {

                           

                                pid = con.Pid(correo);
                                rs = stmt.executeQuery("select n.*, f.* from Feedback f inner join Negocio n where f.neg_id=n.neg_id and f.per_id=" + pid + ";");
                            

                            while (rs.next())
                            {

                                String nombreg = rs.getString("neg_nombre");
                                String descg = rs.getString("neg_descripcion");
                                String fotog = rs.getString("neg_logo");
                                String comentario = rs.getString("fed_comentario");
                                Boolean like = rs.getBoolean("fed_like");
                                int idc = rs.getInt("fed_id");
                                int idn = rs.getInt("neg_id");

                    %>
                    <form class="coment_pro_ch d-flex" method="post">
                    <section class="h-100 w-25 img_sect_ch">
                        <section class="h-100 w-100 img_res_ch">
                            <img src="<%=fotog%>" alt="">
                        </section>
                        <section class="bar_img_ch"></section>
                    </section>
                    <section class="w-75 h-100 d-flex flex-column justify-content-between">
                        <i class="bi bi-quote quote_ch"><%=comentario%></i>
                        <section class="d-flex flex-column">
                            <span class="Nom_neg_ch"><%=nombreg%></span>
                            <span class="cuerp_res_ch"><%=descg%></span>
                        </section>
                        <section class="d-flex justify-content-between">
                            <%
                                if (like == true)
                                {
                            %>
                            <section class="d-flex justify-content-center align-items-center">
                                <span><i class="bi bi-heart-fill"></i> Te gustó</span>
                            </section>
                            <%
                                }
                            %>
                            <section class="btns_ch">

                                
                            </section>
                        </section>
                    </section>
                </form>
                            <%
                                /*
                            <form method="post" action="EliminarComentarioCC" >
                                    <button type="submit" class="btn btn_elim_busq">Eliminar Comentario</button>
                                    <input type="hidden" name="idn" value="<%=idn"/>
                                </form>
                                */
                                            %>

                                <form method="post" action="NegocioCV.jsp" >
                                    <button type="submit" class="btn btn_visitar_busq">Visitar</button>
                                    <input type="hidden" name="idn" value="<%=idn%>"/>
                                </form>
                <%
                    }

                } else
                {


                %>
                <span class="Nom_neg_ch">No has hecho ninguna reseña</span>
                <%    }
                    c.close();
                %>
<%
            }else{
    System.out.println("Error: Sesión no existe");
    response.sendRedirect("index.jsp");
}
            %>
            </div>
        </div>
    </div>
</body>
</html>

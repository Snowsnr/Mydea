<%-- 
    Document   : Feedback
    Created on : 21 nov 2023, 0:36:40
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
        <title>Feedback</title>
    </head>
    <body>
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
    
        <jsp:include page="templates/Navegadores/Navegador_CV.jsp"/>
        <div class="cont_feed">
            
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
                        

                            pid = con.Pid(correo);
                            rs2 = stmt.executeQuery("select * from Negocio where per_id=" + pid + ";");
                        

                        int p = 0;

                        while (rs2.next())
                        {
                            p = rs2.getInt("neg_id");

                        }
                        if (p != 0)
                        {

                           

                                pid = con.Pid(correo);
rs = stmt.executeQuery("select u.usu_nombre, p.per_foto, p.per_descripcion, f.fed_like, f.fed_comentario from Persona p"
+ " inner join Usuario u inner join Feedback f where p.usu_id = u.usu_id "
+ "and p.per_id = f.per_id and f.neg_id=" + p + ";");
                            

                            while (rs.next())
                            {

                                String nombreg = rs.getString("usu_nombre");
                                String descg = rs.getString("per_descripcion");
                                String fotog = rs.getString("per_foto");
                                String comentario = rs.getString("fed_comentario");
                                Boolean like = rs.getBoolean("fed_like");


                    %>
            <section class="d-flex flex-column coment_fb justify-content-center align-items-center">
                <section class="h-25 img_perf_fb d-flex justify-content-center align-items-center">
                    
                       
             <img src="<%=fotog%>" alt="">
                </section>
                 
                <span class="nu_fb"><%=nombreg%></span>
                <i class="bi bi-circle"></i>
                <span class="cont_txt_desc_feed"><%=comentario%></span>
               <%
                                if (like == true)
                                {
                            %>
                            
                                <span><i class="bi bi-heart-fill"></i> Le gustó</span>
                            
                            <%
                                }
                            %>
            </section>
            <%
                    }

                } else
                {


                %>
                <span class="Nom_neg_ch">No te han hecho reseñas</span>
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
    </body>
</html>

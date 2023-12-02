/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Clases;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author Diego
 */
public class Conexion {
    private Connection con;
    
    
    public Conexion(){
        
    }

    public Connection getCon() {
        return con;
    }

    public void setCon() {
        try{
     String dbDriver = "com.mysql.jdbc.Driver";
     String dbURL = "jdbc:mysql://ulp291vvrm6ocwuq:W7AVzFFMwzylxVUTHtkO@bqdr3imyaqd9vli6uegc-mysql.services.clever-cloud.com:3306/bqdr3imyaqd9vli6uegc";
                          
                // Database name to access
     String dbName = "bqdr3imyaqd9vli6uegc";
     String dbUsername = "ulp291vvrm6ocwuq";
     String dbPassword = "W7AVzFFMwzylxVUTHtkO*";
     Class.forName(dbDriver).newInstance();
     con = DriverManager.getConnection(dbURL);
     
      } catch (Exception e ) {
            System.out.println("erore");
                System.err.println("Error"+e);
      }
    }
    
    public String Registro(String usu_nombre, String usu_pass, String per_nombrereal, String per_telefono, String per_correo, String tipo){
        
        
        Statement stmt=null;
        String mensaje = null;
        int h=0;
        try{
        stmt=con.createStatement();
        String sql="SELECT * FROM Usuario WHERE usu_nombre='"+usu_nombre+"';";
        String sql2="SELECT * FROM Usuario;";
        String sql3="SELECT * FROM Persona;";
        ResultSet nom = stmt.executeQuery(sql2);
                       
        //comprobar si el nombre ya existe
        while(nom.next()){
            String nombre = nom.getString("usu_nombre");
            if(nombre.equals(usu_nombre)){
                h=1;
                mensaje="Este nombre de usuario ya existe por favor elige otro";
                break;
            }
        }
                
        //comprobar si el correo o telefono ya existe
        ResultSet persona = stmt.executeQuery(sql3);
            while(persona.next()){
                String correo = persona.getString("per_correo");
                String telefono = persona.getString("per_telefono");
                    if(correo.equals(per_correo)){
                        h=1;
                        mensaje="Este correo ya está en uso, por favor ingresa otro";
                        break;
                    }else if(telefono.equals(per_telefono)){
                        h=1;
                        mensaje="Este telefono ya está en uso, por favor ingresa otro";
                        break;
                    }
                    
            }
        if(h==0){
            stmt.execute("INSERT INTO Usuario(usu_nombre, usu_password, tip_id) VALUES('"
            +usu_nombre+"','"+usu_pass+"',"+tipo+");");
            ResultSet rs=stmt.executeQuery(sql);
            while(rs.next()){
                int usu_id =rs.getInt("usu_id");
                stmt.execute("INSERT INTO Persona(usu_id, per_telefono, per_nombrecompleto, per_correo) VALUES("
                +usu_id+",'"+per_telefono+"','"+per_nombrereal+"','"+ per_correo+"');");  
            }

        }
      } catch (Exception e ) {
                System.err.println("Error"+e);
      }
      return mensaje;              
    }
    
    public String ISU(String usu_nom, String usu_pass, String per_correo){
    String mensaje=null;
    Statement stmt = null;
    try{
        
        stmt=con.createStatement();
                String sql="SELECT * FROM Usuario WHERE usu_nombre='"+usu_nom+"';";
                String sql2="SELECT * FROM Usuario;";
                int usu_id=0;
                
                
                int h=0;
                
                
                ResultSet nom = stmt.executeQuery(sql2);
                //comprobar si el nombre ingresado existe
                while(nom.next()){
                    String nombre = nom.getString("usu_nombre");
                    if(nombre.equals(usu_nom)){
                        h=h+1;
                        
                        usu_id=nom.getInt("usu_id");
                        break;
                    }
                } 
                //comprobar si la contraseña coincide
                ResultSet pass = stmt.executeQuery(sql);
                while(pass.next()){
                    
                    String clave = pass.getString("usu_password");
                    
                    if(clave.equals(usu_pass)){
                        h=h+1;
                        break;
                    }
                }
                //comprobar si el correo coincide
                String sql3="SELECT * FROM Persona WHERE usu_id='"+usu_id+"';";
                ResultSet persona = stmt.executeQuery(sql3);
                while(persona.next()){
                    String correo = persona.getString("per_correo");
                   
                    if(correo.equals(per_correo)){
                        
                        h=h+1;
                       
                        break;
                    }                 
                } 
                if(h==3){
                }else{
                   mensaje="Por favor revisa que los datos proporcionados sean correctos";       
                }
        
        
    } catch (Exception e ) {
                System.err.println("Error"+e);
      }
    
    return mensaje;
}
    
    public String Tipo(String nombre){
        String mensaje = null;
        try{
        Statement stmt=con.createStatement();
        String sql="Select * FROM Usuario where usu_nombre='"+nombre+"';";
        
        
        ResultSet idq = stmt.executeQuery(sql);
        
        while(idq.next()){
            int tipo = idq.getInt("tip_id");
            mensaje=Integer.toString(tipo);
        }
        
        } catch (Exception e ) {
                System.err.println("Error"+e);
        }
        return mensaje;
    }
    
    public String[] InfoPersona(String usu_nombre){
        
        String[] Persona = new String[9];
        int usu_id =0;
        String nombrereal, telefono, foto, fb, ig, tw, web, correo, desc;
     
        try{
        Statement stmt=con.createStatement();
        String sql="Select * FROM Usuario where usu_nombre='"+usu_nombre+"';";
        
        
        ResultSet idq = stmt.executeQuery(sql);
        
        while(idq.next()){
            usu_id = idq.getInt("usu_id");
        }
        String sql2="Select * from Persona where usu_id="+usu_id+";";
        
        ResultSet per = stmt.executeQuery(sql2);
        while(per.next()){
            desc=per.getString("per_descripcion");
            nombrereal=per.getString("per_nombrecompleto");
            telefono=per.getString("per_telefono");
            foto = per.getString("per_foto");
            fb = per.getString("per_facebook");
            ig = per.getString("per_instagram");
            tw = per.getString("per_twitter");
            web = per.getString("per_web");
            correo=per.getString("per_correo");
          
            
            Persona[0]=desc;
            Persona[8]=correo;
            Persona[1]=nombrereal;
            Persona[2]=telefono;
            Persona[3]=foto;
            Persona[4]=fb;
            Persona[5]=ig;
            Persona[6]=tw;
            Persona[7]=web;
            
        }
        
        } catch (Exception e ) {
                System.err.println("Error"+e);
        }
        return Persona;
    }
    
    public String AgNeg(String uid, String nombre, String desc, String colonia, String calle, String numero, String indicaciones, String cp, String web, 
        String logo, String tema, String fb, String tw, String ig, String ft1, String ft2, String correo, String ft3, String tel){
        
        String mensaje=null;
    
     
        try{
            
            
         Statement stmt=con.createStatement();
            String sql="select * from Negocio;";
        
            int h=0;
           
           ResultSet neg = stmt.executeQuery(sql);
            while(neg.next()){
                String nom = neg.getString("neg_nombre");
                String telefono = neg.getString("neg_telefono");
                String cor = neg.getString("neg_correo");
                    if(nom.equals(nombre)){
                        h=1;
                        mensaje="Este nombre de negocio ya está en uso, por favor ingresa otro";
                        break;
                    }else if(telefono.equals(tel)){
                        h=1;
                        mensaje="Este telefono ya está en uso, por favor ingresa otro";
                        break;
                    }else if(cor.equals(correo)){
                        h=1;
                        mensaje="Este correo ya está en uso, por favor ingresa otro";
                        break;
                    }
                    
                 
                    
            }         
            if(h==0){
               ResultSet rs = null;
                String sqld = "INSERT INTO Direccion(dir_colonia, dir_calle, dir_numero, dir_indicaciones, dir_cp)"
                        + " VALUES ('"+colonia+"','"+calle+"',"+numero+",'"+indicaciones+"',"+cp+");";
                String sqlb = "SELECT MAX(dir_id) as dir_id FROM Direccion;";
                
                stmt.execute(sqld);
                
                rs=stmt.executeQuery(sqlb);
            while(rs.next()){
                int dir_id =rs.getInt("dir_id");
             stmt.execute("INSERT INTO Negocio(neg_correo, neg_telefono, neg_logo, neg_descripcion, neg_facebook, neg_instagram, neg_twitter, neg_web, per_id,"
                     + " neg_nombre, dir_id, tem_id, neg_imagen1, neg_imagen2, neg_imagen3)"
            + "VALUES('"+correo+"','"+tel+"','"+logo+"','"+desc+"','"+fb+"','"+ig+"','"+tw+"','"+web+"',"+uid+",'"+nombre+"',"+dir_id+","+tema+",'"+ft1+"','"+ft2+"','"+ft3+"');");
             
            }

           
            
            
            
        }
        
        
            
        } catch (Exception e ) {
                System.err.println("Error"+e);
        }
        
        return mensaje;
    }
    
    public int Pid(String correo){
         int id=0;
      
        try{
         Statement stmt=con.createStatement();
            String sql="select * from Persona where per_correo='"+correo+"';";
            
            ResultSet rr= stmt.executeQuery(sql);
            
            while(rr.next()){
                id = rr.getInt("per_id");
            }
        
        
            
        } catch (Exception e ) {
                System.err.println("Error"+e);
        }
        
        return id;
    }
    
    public int Nid(String nombre){
        int id = 0;
        try{
            Statement stmt=con.createStatement();
            String sqlq="Select neg_id from Negocio where neg_nombre='"+nombre+"';";
            ResultSet rr= stmt.executeQuery(sqlq);
            while(rr.next()){
                id = rr.getInt("neg_id");
                }
            
            } catch (Exception e ) {
                System.err.println("Error"+e);
                }
        return id;  
    }
    
        
    public String Agprod(String neid, String nombre, String descripcion, String imagen, String precio, String dis){
        String mensaje=null;
      
        try{
         Statement stmt=con.createStatement();
            String sql="insert into Producto(pro_nombre, pro_descripcion, pro_precio, neg_id, dis_id, pro_imagen)"
                    + "values('"+nombre+"','"+descripcion+"',"+precio+","+neid+","+dis+",'"+imagen+"');";
            
            stmt.execute(sql);
            
            mensaje="¡Listo! Producto agregado, puede seguir agregando productos";
        
        
            
        } catch (Exception e ) {
                System.err.println("Error"+e);
        }
        
        return mensaje;
    }
    
    public void Horario(String abierto, String cerrado, String especial, String dia, String nid){
        
        try{
            Statement stmt=con.createStatement();
            String sql="Insert into Horario(hor_abierto, hor_cerrado, hor_especial, hor_dia) VALUES('"+abierto+"','"+cerrado+"','"+especial+"','"+dia+"');";
            String sql2 = "SELECT MAX(hor_id) as hor_id FROM Horario;";
            int hid=0;
            
            stmt.execute(sql);
            
            ResultSet rr= stmt.executeQuery(sql2);
            
            while(rr.next()){
                hid = rr.getInt("hor_id");
            }
            
            String sql3 = "Insert into Negocio_Horario(hor_id, neg_id) Values("+hid+","+nid+");";
            stmt.execute(sql3);
            
            
        } catch (Exception e ) {
                System.err.println("Error"+e);
        }
        
    }
    
    public void EHorario(String abierto, String cerrado, String especial, String dia, int hid){
        
        try{
            Statement stmt=con.createStatement();
  
            String sql="Update Horario set hor_abierto='"+abierto+"', hor_cerrado='"+cerrado+"', hor_especial='"+especial+"', hor_dia='"+dia+"' where hor_id="+hid+";";
            stmt.execute(sql);
            
            
            
        } catch (Exception e ) {
                System.err.println("Error"+e);
        }
        
    }
    
    public int[] Hid(String nid){
        int[] hid = new int[7];
        try{
            Statement stmt=con.createStatement();
            
            String s="Select hor_id from Negocio_Horario where neg_id="+nid+";";
            
            
            
            ResultSet rs = stmt.executeQuery(s);
            int k =0;
            while(rs.next()){
                hid[k] = rs.getInt("hor_id");
                k=k+1;
            }

            
        } catch (Exception e ) {
                System.err.println("Error"+e);
        }
        return hid;
    }
    
    public String EUsuario(String nombreu, String nombreua, String nombrec, String correo, String descripcion, String telefono,
    String facebook, String instagram, String twitter, String web, String foto, String correoa, String telefonoa){
        
        String mensaje=null;
      int h =0;
        try{
         
        Statement stmt=con.createStatement();
        String sql="SELECT * FROM Usuario WHERE usu_nombre='"+nombreu+"';";
        String sql2="SELECT * FROM Usuario;";
        String sql3="SELECT * FROM Persona;";
        ResultSet nom = stmt.executeQuery(sql2);
                       
        //comprobar si el nombre ya existe
        while(nom.next()){
            String nombre = nom.getString("usu_nombre");
            if(nombre.equals(nombreu)&&!nombre.equals(nombreua)){
                h=1;
                mensaje="Este nombre de usuario ya existe por favor elige otro";
                break;
            }
        }
                
        //comprobar si el correo o telefono ya existe
        ResultSet persona = stmt.executeQuery(sql3);
            while(persona.next()){
                String correor = persona.getString("per_correo");
                String telefonor = persona.getString("per_telefono");
                    if(correor.equals(correo)&&!correor.equals(correoa)){
                        h=1;
                        mensaje="Este correo ya está en uso, por favor ingresa otro";
                        break;
                    }else if(telefonor.equals(telefono)&&!telefonor.equals(telefonoa)){
                        h=1;
                        mensaje="Este telefono ya está en uso, por favor ingresa otro";
                        break;
                    }
                    
            }
            
            
        if(h==0){
            System.out.println(foto);
            stmt.execute("update Usuario set usu_nombre='"+nombreu+"' where usu_nombre='"+nombreua+"';");
            stmt.execute("update Persona set per_nombrecompleto ='"+nombrec+"', per_correo='"+correo+"', "
            + "per_descripcion='"+descripcion+"', per_telefono='"+telefono+"', per_facebook='"+facebook+"',"
            + " per_instagram='"+instagram+"', per_twitter='"+twitter+"', per_web='"+web+"', "
            + "per_foto='"+foto+"' where per_correo='"+correoa+"';");
        }
        
            
        } catch (Exception e ) {
                System.err.println("Error"+e);
        }
        
        return mensaje;
        
    }
    
    public String Novedad(String nombre, String descripcion, String foto, String id){
        String mensaje=null;
        try{
            Statement stmt=con.createStatement();
            
            
            String sql3 = "Insert into Novedad(neg_id, nov_nombre, nov_descripcion, nov_foto) Values("+id+",'"+nombre+"','"+descripcion+"','"+foto+"');";
            stmt.execute(sql3);
            
            
        } catch (Exception e ) {
                System.err.println("Error"+e);
        }
        return mensaje;
    }
    
    public String ENegocio(String nombre, String desc, String colonia, String calle, String numero, String indicaciones, String cp, String web, 
        String logo, String tema, String fb, String tw, String ig, String ft1, String ft2, String correo, String ft3, String tel,
        String tela, String correoa, String nombrea, String did){
        String mensaje=null;
        
        try{
            Statement stmt=con.createStatement();
            
            
         
            String sql="select * from Negocio;";
        
            int h=0;
           
           ResultSet neg = stmt.executeQuery(sql);
            while(neg.next()){
                String nom = neg.getString("neg_nombre");
                String telefono = neg.getString("neg_telefono");
                String cor = neg.getString("neg_correo");
                    if(nom.equals(nombre)&&!nom.equals(nombrea)){
                        h=1;
                        mensaje="Este nombre de negocio ya está en uso, por favor ingresa otro";
                        break;
                    }else if(telefono.equals(tel)&&!telefono.equals(tela)){
                        h=1;
                        mensaje="Este telefono ya está en uso, por favor ingresa otro";
                        break;
                    }else if(cor.equals(correo)&&!cor.equals(correoa)){
                        h=1;
                        mensaje="Este correo ya está en uso, por favor ingresa otro";
                        break;
                    }         
            }         
            if(h==0){
            
               String sq ="Update Negocio set neg_nombre='"+nombre+"', neg_descripcion='"+desc+"', neg_correo='"+correo+"', neg_telefono='"+tel+"', neg_logo='"+logo+"', "
                       + "neg_imagen1='"+ft1+"', neg_imagen2='"+ft2+"', neg_imagen3='"+ft3+"', neg_facebook='"+fb+"', neg_instagram='"+ig+"', neg_twitter='"+tw+"', "
                       + "neg_web='"+web+"', tem_id="+tema+" where neg_correo='"+correoa+"';";
               
               String sq2="Update Direccion set dir_calle='"+calle+"', dir_colonia='"+colonia+"',dir_indicaciones='"+indicaciones+"', dir_cp="+cp+", dir_numero="+numero+" "
                       + "where dir_id="+did+";";
           
            stmt.execute(sq);
            stmt.execute(sq2);
            
            
        }
            
        } catch (Exception e ) {
                System.err.println("Error"+e);
        }
        return mensaje;
        
    }
    
    public String Comentario(String idn, int idu, String comentario, String like){
        String mensaje = "Comentario realizado";
        try{
            Statement stmt=con.createStatement();
            
            
            String sql3 = "Insert into Feedback(neg_id, per_id, fed_comentario, fed_like) Values("+idn+","+idu+",'"+comentario+"',"+like+");";
            stmt.execute(sql3);
            
            
        } catch (Exception e ) {
                System.err.println("Error"+e);
        }
        return mensaje;
    }
    
    public String Guardar(String idn, int idu){
        String mensaje = null;
        try{
            Statement stmt=con.createStatement();
            String pid=null;
            
            ResultSet rs=stmt.executeQuery("Select * from Guardado where per_id="+idu+" and neg_id="+idn+";");
            while(rs.next()){
                     pid = "1";
                    
                    System.out.println("pid "+pid);
                }
            if(pid!=null){
                mensaje="Ya has guardado este negocio";
            }else{
            String sql3 = "Insert into Guardado(neg_id, per_id) Values("+idn+","+idu+");";
            stmt.execute(sql3);
            mensaje="Negocio guardado";
            }
            System.out.println("pid "+pid);
            
        } catch (Exception e ) {
                System.err.println("Error"+e);
        }
        return mensaje;
    }
    
}

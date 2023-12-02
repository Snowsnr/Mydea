/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Clases;

/**
 *
 * @author alumno
 */
public class Usuario {
    private String usu_id;
    private String usu_nom;
    private String usu_pass;

    public Usuario() {
    }

    public Usuario(String usu_nom, String usu_pass) {
        this.usu_nom = usu_nom;
        this.usu_pass = usu_pass;
    }

    public String getUsu_id() {
        return usu_id;
    }

    public void setUsu_id(String usu_id) {
        this.usu_id = usu_id;
    }

    public String getUsu_nom() {
        return usu_nom;
    }

    public void setUsu_nom(String usu_nom) {
        this.usu_nom = usu_nom;
    }

    public String getUsu_pass() {
        return usu_pass;
    }

    public void setUsu_pass(String usu_pass) {
        this.usu_pass = usu_pass;
    }
    
    
    
}

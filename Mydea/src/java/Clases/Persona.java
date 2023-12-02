/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Clases;

/**
 *
 * @author alumno
 */
public class Persona {
    private String per_descripcion;
    private String per_correo;
    private String per_telefono;
    private String per_nombrereal;
    private String per_foto;
    private String per_fb;
    private String per_ig;
    private String per_twitter;
    private String per_web;

    public Persona() {
    }

    public Persona(String per_correo, String per_telefono, String per_nombrereal, String per_foto, String per_fb, String per_ig, String per_twitter, String per_web, String per_descripcion) {
        this.per_correo = per_correo;
        this.per_telefono = per_telefono;
        this.per_nombrereal = per_nombrereal;
        this.per_foto = per_foto;
        this.per_fb = per_fb;
        this.per_ig = per_ig;
        this.per_twitter = per_twitter;
        this.per_web = per_web;
        this.per_descripcion = per_descripcion;
    }



 

    public String getPer_descripcion() {
        return per_descripcion;
    }

    public void setPer_descripcion(String per_descripcion) {
        this.per_descripcion = per_descripcion;
    }

    public String getPer_correo() {
        return per_correo;
    }

    public void setPer_correo(String per_correo) {
        this.per_correo = per_correo;
    }

    public String getPer_telefono() {
        return per_telefono;
    }

    public void setPer_telefono(String per_telefono) {
        this.per_telefono = per_telefono;
    }

    public String getPer_nombrereal() {
        return per_nombrereal;
    }

    public void setPer_nombrereal(String per_nombrereal) {
        this.per_nombrereal = per_nombrereal;
    }

    public String getPer_foto() {
        return per_foto;
    }

    public void setPer_foto(String per_foto) {
        this.per_foto = per_foto;
    }

    public String getPer_fb() {
        return per_fb;
    }

    public void setPer_fb(String per_fb) {
        this.per_fb = per_fb;
    }

    public String getPer_ig() {
        return per_ig;
    }

    public void setPer_ig(String per_ig) {
        this.per_ig = per_ig;
    }

    public String getPer_twitter() {
        return per_twitter;
    }

    public void setPer_twitter(String per_twitter) {
        this.per_twitter = per_twitter;
    }

    public String getPer_web() {
        return per_web;
    }

    public void setPer_web(String per_web) {
        this.per_web = per_web;
    }
    
    
    
}

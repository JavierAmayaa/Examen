/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Modelo;

/**
 *
 * @author Javier Amaya
 */
public class Especialidad {
    private int codigoEspecialidad;
    private String especialidad;

    public Especialidad() {
    }

    public Especialidad(int codigoEspecialidad, String especialidad) {
        this.codigoEspecialidad = codigoEspecialidad;
        this.especialidad = especialidad;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    public int getCodigoEspecialidad() {
        return codigoEspecialidad;
    }

    public void setCodigoEspecialidad(int codigoEspecialidad) {
        this.codigoEspecialidad = codigoEspecialidad;
    }
    
    
}

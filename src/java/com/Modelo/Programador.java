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
public class Programador {
    private int codigoProgramador;
    private String nombre;
    private int edad;
    private double salario;
    private int codigoEspecialidad;

    public Programador() {
    }

    public Programador(int codigoProgramador, String nombre, int edad, double salario, int codigoEspecialidad) {
        this.codigoProgramador = codigoProgramador;
        this.nombre = nombre;
        this.edad = edad;
        this.salario = salario;
        this.codigoEspecialidad = codigoEspecialidad;
    }

    public int getCodigoEspecialidad() {
        return codigoEspecialidad;
    }

    public void setCodigoEspecialidad(int codigoEspecialidad) {
        this.codigoEspecialidad = codigoEspecialidad;
    }

    public int getCodigoProgramador() {
        return codigoProgramador;
    }

    public void setCodigoProgramador(int codigoProgramador) {
        this.codigoProgramador = codigoProgramador;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public double getSalario() {
        return salario;
    }

    public void setSalario(double salario) {
        this.salario = salario;
    }
    
    
}

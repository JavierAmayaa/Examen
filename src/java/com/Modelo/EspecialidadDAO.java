/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Modelo;

import com.conexion.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.swing.JOptionPane;

/**
 *
 * @author Javier Amaya
 */
public class EspecialidadDAO extends Conexion{
    public void insertarEspecialidad(Especialidad s){
        try {
            this.conectar();
            String sql = "INSERT INTO especialidad VALUES(?,?)";
            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            pre.setInt(1, s.getCodigoEspecialidad());
            pre.setString(2, s.getEspecialidad());        
            
            pre.executeUpdate();            
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error: "+e.getMessage());
        } finally {
            this.desconectar();
        }
    }
    public ArrayList<Especialidad> mostrarEspecialidad(){
        ArrayList<Especialidad> lista = new ArrayList<>();
        try {
            this.conectar();
            String sql = "SELECT * FROM especialidad";
            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            ResultSet rs;
            rs = pre.executeQuery();
            while(rs.next()){
                Especialidad s = new Especialidad();
                s.setCodigoEspecialidad(rs.getInt(1));
                s.setEspecialidad(rs.getString(2));
                
                lista.add(s);
            }            
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error: "+e.getMessage());
        } finally {
            this.desconectar();
        }
        return lista;
    }
    
    public void modificarCategoria(Especialidad s){
        try {
            this.conectar();
            String sql = "UPDATE especialidad SET especialidad=?,  WHERE codigoEspecialidad=?";
            PreparedStatement pre = this.getConexion().prepareStatement(sql);            
            pre.setString(1, s.getEspecialidad());
            pre.setInt(2, s.getCodigoEspecialidad());
            
            pre.executeUpdate();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error: "+e.getMessage());
        } finally {
            this.desconectar();
        }
    }
    
    public void eliminarEspecialidad(Especialidad s){
        try {
            this.conectar();
            String sql = "DELETE FROM especialidad WHERE codigoEspecialidad=?";
            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            pre.setInt(1, s.getCodigoEspecialidad());
            
            pre.executeUpdate();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error: "+e.getMessage());
        } finally {
            this.desconectar();
        }
    }
    
    public Especialidad getEspecialidad(int codigo){
        Especialidad s = new Especialidad();
        try {
            this.conectar();
            String sql = "SELECT * FROM especialidad WHERE codigoEspecialidad=?";
            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            pre.setInt(1, codigo);
            ResultSet rs;
            rs = pre.executeQuery();
            while(rs.next()){
                s.setCodigoEspecialidad(rs.getInt(1));
                s.setEspecialidad(rs.getString(2));
            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error: "+e.getMessage());
        } finally {
            this.desconectar();
        }
        return s;
    }
}

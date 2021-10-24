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
public class ProgramadorDAO extends Conexion{
    public void insertarProgramador(Programador p){
        try {
            this.conectar();
            String sql = "INSERT INTO programador VALUES(?,?,?,?,?)";
            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            pre.setInt(1, p.getCodigoProgramador());
            pre.setString(2, p.getNombre());
            pre.setInt(3, p.getEdad());
            pre.setDouble(4, p.getSalario());
            pre.setInt(5, p.getCodigoEspecialidad()); 
            
            pre.executeUpdate();          
            
                        
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error: "+e.getMessage());
        } finally {
            this.desconectar();
        }
    }
    public ArrayList<Programador> mostrarProgramador(){
        ArrayList<Programador> lista = new ArrayList<>();
        try {
            this.conectar();
            String sql = "SELECT * FROM programador";
            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            ResultSet rs;
            rs = pre.executeQuery();
            while(rs.next()){
                Programador p = new Programador();
                p.setCodigoProgramador(rs.getInt(1));
                p.setNombre(rs.getString(2));
                p.setEdad(rs.getInt(3));
                p.setSalario(rs.getDouble(4));
                p.setCodigoEspecialidad(rs.getInt(5));
                
                lista.add(p);
            }            
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error: "+e.getMessage());
        } finally {
            this.desconectar();
        }
        return lista;
    }
    
    public void modificarProgramador(Programador p){
        try {
            this.conectar();
            String sql = "UPDATE programador SET nombre=?, edad=?, salario=?, codigoEspecialidad=? WHERE codigoProgramador=?";
            PreparedStatement pre = this.getConexion().prepareStatement(sql);            
            pre.setString(1, p.getNombre());
            pre.setInt(2, p.getEdad());
            pre.setDouble(3, p.getSalario());
            pre.setInt(4, p.getCodigoEspecialidad());
            pre.setInt(5, p.getCodigoProgramador());
            pre.executeUpdate();
            
            
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error: "+e.getMessage());
        } finally {
            this.desconectar();
        }
    }
    
    public void eliminarProgramador(Programador p){
        try {
            this.conectar();
            String sql = "DELETE FROM programador WHERE codigoProgramador=?";
            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            pre.setInt(1, p.getCodigoProgramador());
            
            pre.executeUpdate();
            
            pre.executeUpdate();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error: "+e.getMessage());
        } finally {
            this.desconectar();
        }
    }
}

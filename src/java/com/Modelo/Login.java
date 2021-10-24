/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Modelo;

import com.conexion.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Javier Amaya
 */
public class Login extends Conexion{
    public int validarLogin(String usuario, String clave){
        int rol = 0;
        try {
            this.conectar();
            String sql = "SELECT rol FROM usuario WHERE usuario=? AND clave=?";
            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            pre.setString(1, usuario);
            pre.setString(2, clave);
            ResultSet rs;
            rs = pre.executeQuery();
            while(rs.next()){
                rol = rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("Error: "+e.getMessage());
        } finally {
            this.desconectar();
        }
        return rol;
    }
}
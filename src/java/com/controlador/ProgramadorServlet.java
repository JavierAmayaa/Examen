/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controlador;

import com.Modelo.Programador;
import com.Modelo.ProgramadorDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Javier Amaya
 */
public class ProgramadorServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Programador p = new Programador();
            ProgramadorDAO daoProgramador = new ProgramadorDAO();
            String mensaje = "";
            
            p.setCodigoProgramador(Integer.parseInt(request.getParameter("txtCodigo")));
            p.setNombre(request.getParameter("txtNombre"));
            p.setEdad(Integer.parseInt(request.getParameter("txtEdad")));
            p.setSalario(Double.parseDouble(request.getParameter("txtSalario")));
            p.setCodigoEspecialidad(Integer.parseInt(request.getParameter("sEspecialidad")));
            
            if(request.getParameter("btnEliminar")!=null){
                daoProgramador.eliminarProgramador(p);
                mensaje = "Programador eliminado";
            } else if(request.getParameter("btnModificar")!=null){
                daoProgramador.modificarProgramador(p);
                mensaje = "Programador modificado";
            } else if(request.getParameter("btnAgregar")!=null){
                daoProgramador.insertarProgramador(p);
                mensaje = "Programador insertado";
            }   
            request.getRequestDispatcher("programador.jsp").forward(request, response);
        }
    }


    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

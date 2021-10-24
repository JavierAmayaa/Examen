<%-- 
    Document   : reporteProgramador
    Created on : 10-17-2021, 08:37:32 PM
    Author     : Javier Amaya
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.Modelo.Programador"%>
<%@page import="com.Modelo.EspecialidadDAO"%>
<%@page import="com.Modelo.ProgramadorDAO"%>
<%@page import="com.Modelo.Especialidad"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.io.File"%>
<%@page import="com.conexion.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp" %>
<%@include file="../layout/menu.jsp" %>
<div class="align-items-center justify-content-center container">
    <%!
        ProgramadorDAO daoProgramador = new ProgramadorDAO();
        EspecialidadDAO daoEspecialidad = new EspecialidadDAO();
        ArrayList<Programador> listaProgramador = new ArrayList<>();
        ArrayList<Especialidad> listaEspecialidad = new ArrayList<>();
    %>
    <div class="container">
        <h3>Bienvenido <%=sesion.getAttribute("usuario")%></h3>
    </div>
    <h1>Reporte de Programadores</h1>
    <form><select class="form-control" name="sEspecialidad">
                  <%
                      listaEspecialidad = daoEspecialidad.mostrarEspecialidad();
                      for (Especialidad elem : listaEspecialidad) {
                  %>  
                  <option value="<%=elem.getEspecialidad()%>"><%=elem.getEspecialidad()%></option>
                  <%
                          }
                  %>

              </select>
        <button type="submit" class="btn btn-success mt-4" name="btnReporte">Generar reporte</button>
    </form>
</div>
<%    if (request.getParameter("btnReporte") != null) {
        String especialidad = request.getParameter("sEspecialidad");
        try {
            Map parametros = new HashMap();
            parametros.put("especialidad", especialidad);
            
            Conexion con = new Conexion();
            con.conectar();
            File file = new File(application.getRealPath("reportes/reportProgramador.jasper"));
            byte[] bytes = JasperRunManager.runReportToPdf(file.getPath(), parametros, con.getConexion());
            ServletOutputStream output = response.getOutputStream();
            response.setContentType("application/pdf");
            response.setContentLength(bytes.length);
            output.write(bytes, 0, bytes.length);
            output.flush();
            output.close();
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
    }
%>
<br><br><br><br><br><br><br><br><br><br><br><br><br>

<%@include file="../layout/footer.jsp" %>
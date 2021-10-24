<%-- 
    Document   : reporteEspecialidades
    Created on : 10-17-2021, 07:31:47 PM
    Author     : Javier Amaya
--%>

<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.io.File"%>
<%@page import="com.conexion.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try {
                Conexion con = new Conexion();
                con.conectar();
                File file = new File(application.getRealPath("reportes/ReportEspecialidades.jasper"));
                byte[] bytes = JasperRunManager.runReportToPdf(file.getPath(), null, con.getConexion());
                ServletOutputStream output = response.getOutputStream();
                response.setContentType("application/pdf");
                response.setContentLength(bytes.length);                
                output.write(bytes, 0, bytes.length);
                output.flush();
                output.close();
            } catch (Exception e) {
                System.out.println("Error: "+e.getMessage());
            }           
        %>     
    </body>
</html>

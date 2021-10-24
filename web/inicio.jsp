<%-- 
    Document   : inicio
    Created on : 10-17-2021, 05:14:50 PM
    Author     : Javier Amaya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="layout/header.jsp" %>
<%@include file="layout/menu.jsp" %>
<div class="container col-md-8">
    <h1>Bienvenido <%=sesion.getAttribute("usuario") %></h1>
</div>
    <div class="container col-md-9"><img src="imagenes/fondo.jpg"></img></div>
<%@include file="layout/footer.jsp" %>

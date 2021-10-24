<%-- 
    Document   : menu
    Created on : 10-17-2021, 05:15:17 PM
    Author     : Javier Amaya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%
    HttpSession sesion = request.getSession();
%>
<nav class="navbar navbar-expand-lg navbar-dark bg-success">
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item active">
          <a class="nav-link" href="${pageContext.request.contextPath}/inicio.jsp">Inicio</a>
      </li>
      <%
          if(sesion.getAttribute("rol")==null){
              response.sendRedirect(request.getContextPath()+"/login.jsp");
          } else if((Integer)sesion.getAttribute("rol")!=2){
      %>
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/programador.jsp">Crud Programador</a>
      </li>
      <%
          }
      %> 
      <%
          if(sesion.getAttribute("rol")==null){
              response.sendRedirect(request.getContextPath()+"/login.jsp");
          } else if((Integer)sesion.getAttribute("rol")!=1){
      %>
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/reportes/reporteEspecialidades.jsp">Reporte 1</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/reportes/reporteProgramador.jsp">Reporte 2</a>
      </li>
      <%
          }
      %> 
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/login.jsp?cerrar=true">Salir</a>
      </li>
    </ul>
  </div>
</nav>
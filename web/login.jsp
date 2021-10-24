<%-- 
    Document   : login
    Created on : 10-17-2021, 05:14:31 PM
    Author     : Javier Amaya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="layout/header.jsp" %>
<br><br><br>
<section class="vh-100">
  <div class="container-fluid h-custom col-">
    <div class="row d-flex justify-content-center align-items-center h-10">
      <div class="col-md-9 col-lg-6 col-xl-5">
        <img src="https://mdbootstrap.com/img/Photos/new-templates/bootstrap-login-form/draw2.png" class="img-fluid"
          alt="Sample image">
      </div>
      <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
          <form action="LoginServlet" method="POST">
            <!-- Email input -->
          <div class="form-outline mb-4">
            <label class="form-label" for="form3Example3">Nombre de Usuario</label>
            <input type="text" id="form3Example3" class="form-control form-control-lg" name="txtUsuario"
              placeholder="Ingrese su Nombre" />
          </div>

          <!-- Password input -->
          <div class="form-outline mb-3">
              <label class="form-label" for="form3Example4"><b>Contraseña</b></label>
              <input type="password" id="form3Example4" class="form-control form-control-lg" name="txtClave"
              placeholder="Ingrese su contraseña" />
          </div>
          <button type="submit" class="btn btn-primary mt-4" name="btnLogin">Ingresar</button>         
        </form>
      </div>
    </div>
  </div><br><br><br><br><br>
  <div class="d-flex flex-column flex-md-row text-center text-md-start justify-content-between py-4 px-4 px-xl-5 bg-primary">
    <!-- Copyright -->
    <div class="text-white align-items-center justify-content-center container ">
        <span aling="Center">Copyright © 2020. Todos los Derechos reservados. Examen Final Realizado por <b>Javier Antonio amaya (196820)</b></span>
    </div>
    <!-- Copyright -->
  </div>
</section>
<%@include file="layout/footer.jsp" %>
<%
    HttpSession sesion = request.getSession();
    if(request.getAttribute("rol")!=null){
        if((Integer)request.getAttribute("rol")!=0){
            sesion.setAttribute("usuario", request.getAttribute("usuario"));
            sesion.setAttribute("rol", request.getAttribute("rol"));
            
            response.sendRedirect("inicio.jsp");
        }
        
            }
    
        if (request.getParameter("cerrar")!=null) {
                sesion.invalidate();
    }
%>

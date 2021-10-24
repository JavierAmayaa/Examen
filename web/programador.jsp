<%-- 
    Document   : programador
    Created on : 10-17-2021, 02:07:25 PM
    Author     : Javier Amaya
--%>

<%@page import="com.Modelo.Especialidad"%>
<%@page import="com.Modelo.Programador"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.Modelo.EspecialidadDAO"%>
<%@page import="com.Modelo.ProgramadorDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="layout/header.jsp" %>
<%@include file="layout/menu.jsp" %>
<div class="container">
    <h1>Bienvenido <%=sesion.getAttribute("usuario") %></h1>
</div>
<%
    if(request.getAttribute("respuesta")!=null){
        out.println(request.getAttribute("respuesta"));
%>
<script>alert('<%=request.getAttribute("respuesta")%>');</script>
<%
    }
%>
<br><br>
<div class="container" style="border: solid">
    <%!
        ProgramadorDAO daoProgramador = new ProgramadorDAO();
        EspecialidadDAO daoEspecialidad = new EspecialidadDAO();
        ArrayList<Programador> listaProgramador = new ArrayList<>();
        ArrayList<Especialidad> listaEspecialidad = new ArrayList<>();
    %>
   
    <h1>CRUD de Programador</h1>
        <button type="button" class="btn btn-success btn-sm mt-4" data-toggle="modal" data-target="#mdlProgramador" id="btnAgregar">
            Agregar
        </button> <br><br>   
         <div>
    <table class="table align-items-center table-flush" >
                    <thead class="thead-dark">
                      <tr>
                        <th>Código</th>
                        <th>Nombre</th>
                        <th>Edad</th>
                        <th>Salario</th>
                        <th>Especialidad</th>
                        <th>Acciones</th>
                      </tr>
                    </thead>
                    <tbody>
                        <%
                             listaProgramador = daoProgramador.mostrarProgramador();
                              for (Programador elem : listaProgramador) {
                              
                        %>     
                      <tr>
                        <td class="codigo"><%=elem.getCodigoProgramador()%></td>
                        <td class="nombre"><%=elem.getNombre()%></td>
                        <td class="edad"><%=elem.getEdad()%></td>
                        <td class="salario">$ <%=elem.getSalario()%></td>
                        <td class="especialidad"><%=daoEspecialidad.getEspecialidad(elem.getCodigoEspecialidad()).getEspecialidad()%></td>
                        <td>
                            <button type="button" class="btn btn-success btn-sm" data-toggle="modal" data-target="#mdlProgra" id="btnModificar" >
                                Editar
                            </button>
                            <button type="submit" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#mdlPrograma" id="btnEliminar">
                                Eliminar
                            </button>
                        </td>
                      </tr>
                      <%
                          }
                      %>
                    </tbody>
                  </table>
</div>            
<%@include file="layout/footer.jsp" %>

<!-- Modal -->
<div class="modal fade" id="mdlProgramador" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Programador</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <form action="ProgramadorServlet" method="POST">
              Codigo
              <input type="text" class="form-control" name="txtCodigo">
              Nombre
              <input type="text" class="form-control" name="txtNombre">
              Edad
              <input type="number" class="form-control" name="txtEdad">
              Salario
              <input type="text" class="form-control" name="txtSalario">
              Especialidad
              <select class="form-control" name="sEspecialidad">
                  <%
                      listaEspecialidad = daoEspecialidad.mostrarEspecialidad();
                      for (Especialidad elem : listaEspecialidad) {
                  %>  
                  <option value="<%=elem.getCodigoEspecialidad()%>"><%=elem.getEspecialidad()%></option>
                  <%
                          }
                  %>

              </select>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                <button type="submit" class="btn btn-primary" name="btnAgregar">Agregar</button>
                <button type="submit" class="btn btn-success" name="btnModificar">Editar</button>
                <button type="submit" class="btn btn-danger" name="btnEliminar">Eliminar</button>
            </div>
        </form>
    </div>
  </div>
</div>
                  
<!-- Modal 2 -->
<div class="modal fade" id="mdlProgra" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Programador</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <form action="ProgramadorServlet" method="POST">
              Codigo
              <input type="text" class="form-control" name="txtCodigo">
              Nombre
              <input type="text" class="form-control" name="txtNombre">
              Edad
              <input type="number" class="form-control" name="txtEdad">
              Salario
              <input type="text" class="form-control" name="txtSalario">
              Especialidad
              <select class="form-control" name="sEspecialidad">
                  <%
                      listaEspecialidad = daoEspecialidad.mostrarEspecialidad();
                      for (Especialidad elem : listaEspecialidad) {
                  %>  
                  <option value="<%=elem.getCodigoEspecialidad()%>"><%=elem.getEspecialidad()%></option>
                  <%
                          }
                  %>

              </select>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                <button type="submit" class="btn btn-success" name="btnModificar">Editar</button>
            </div>
        </form>
    </div>
  </div>
</div>
                  
                  
<!-- Modal 3 -->
<div class="modal fade" id="mdlPrograma" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Programador</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <form action="ProgramadorServlet" method="POST">
              Codigo
              <input type="text" class="form-control" name="txtCodigo">
              Nombre
              <input type="text" class="form-control" name="txtNombre">
              Edad
              <input type="number" class="form-control" name="txtEdad">
              Salario
              <input type="text" class="form-control" name="txtSalario">
              Especialidad
              <select class="form-control" name="sEspecialidad">
                  <%
                      listaEspecialidad = daoEspecialidad.mostrarEspecialidad();
                      for (Especialidad elem : listaEspecialidad) {
                  %>  
                  <option value="<%=elem.getCodigoEspecialidad()%>"><%=elem.getEspecialidad()%></option>
                  <%
                          }
                  %>

              </select>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                <button type="submit" class="btn btn-danger" name="btnEliminar">Eliminar</button>
            </div>
        </form>
    </div>
  </div>
</div>
                  <script src="js/Programador.js"></script>
              
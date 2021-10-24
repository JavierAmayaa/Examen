/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function(){
    $('body').on('click', '#btnEliminar', function(){
       let fila = $(this).closest('tr');
       llenarFormulario(fila);
       $('button[name=btnAgregar]').hide();
       $('button[name=btnModificar]').hide();
       $('button[name=btnEliminar]').show();
    }); 
    
    $('body').on('click', '#btnModificar', function(){
        let fila = $(this).closest('tr');
        llenarFormulario(fila);        
       $('form')[0].reset(); 
       $('button[name="btnAgregar"]').hide();
       $('button[name=btnModificar]').hide();
       $('button[name=btnEliminar]').show();
    });
    
    $('#btnAgregar').click(function(){
       $('form')[0].reset(); 
       $('button[name="btnAgregar"]').show();
       $('button[name=btnModificar]').hide();
       $('button[name=btnEliminar]').hide();
    });
    
    function llenarFormulario(fila){
        var codigo = fila.find('.codigo').text();
        var nombre = fila.find('.nombre').text();
        var edad = fila.find('.edad').text();
        var salario = fila.find('.salario').text();
        var especialidad = fila.find('.especialidad').text();
        
        $('input[name=txtCodigo]').val(codigo);
        $('input[name=txtNombre]').val(nombre);
        $('input[name=txtEdad]').val(edad);    
        $('input[name=txtSalario]').val(salario);
        $('select[name=sEspecialidad]').find('option:contains('+especialidade+')').prop('selected', true);
    }
});



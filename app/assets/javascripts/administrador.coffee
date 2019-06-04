# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
    $("#registroExamen").on("ajax:success", (event)->
        [data, status, xhr] = event.detail
        console.log(event.detail)
        row =   "<tr>
                    <th> #{data.materium_id} </th>
                    <th> #{data.parcial_id} </th>
                    <th> #{data.turno_id} </th>
                    <th> #{data.semestre_id} </th>
                    <th> #{data.fecha} </th>
                    <th id='exaActive' class='tooltipped' data-position='right' data-delay='50' data-tooltip='Desactivar examen' onclick='desactivarExamen(this)'> Desactivar </th>
                </tr>"
        $("#hayExamen").append(row)
    ).on("ajax:error", (event)->
        [data, status, xhr] = event.detail
        console.log(data)
    ).on("ajax:beforeSend", (event)->
        [data, status, xhr] = event.detail
        console.log(data)
        )
###
$(document).ready ->
  alert "page has loaded!"


@seleccionDeSemestre = (semestre_id)->
    $.ajax({
        dataType: "json",
        cache: false,
        url: "/administrador/materiasSearch/"+semestre_id,
        timeout: 5000,
        error: function(XMLHttpRequest, errorTextStatus, error) {
            alert("Error al buscar semestre: " + errorTextStatus + "\n" + error);
        },
        success: function(data) {
            $("#materia_id option.help").remove();
            for(i = 0; i < data.length; i++){
                row = "<option value=\"" + data[i].id + "\" class=\"help\">" + data[i].materia + "</option>";
                $("#materia_id").append(row);
            }
            $('select').material_select();
            $(".dropdown-content>li>span").css("color", Azul);
        }
    });
}
function desactivarExamen(esto) {
    id = $(esto).parent().attr("id")
    $.ajax({
        dataType: "json",
        cache: false,
        url: "/administrador/desactivarExam/"+id,
        timeout: 5000,
        error: function(XMLHttpRequest, errorTextStatus, error) {
            alert("Error al desactivar examen: " + errorTextStatus + "\n" + error);
        },
        success: function(data) {
            Materialize.toast('Desactivado correctamente', 3000)
            $(esto).attr("onclick", "activarExamen(this)")
            $(esto).text("Activar")
            $(esto).attr("data-tooltip", "Activar examen")
        }
    });
}
function activarExamen(esto) {
    id = $(esto).parent().attr("id")
    $.ajax({
        dataType: "json",
        cache: false,
        url: "/administrador/activarExam/"+id,
        timeout: 5000,
        error: function(XMLHttpRequest, errorTextStatus, error) {
            alert("Error al activar examen: " + errorTextStatus + "\n" + error);
        },
        success: function(data) {
            Materialize.toast('Activado correctamente', 3000)
            $(esto).attr("onclick", "desactivarExamen(this)")
            $(esto).text("Desactivar")
            $(esto).attr("data-tooltip", "Desactivar examen")
        }
    });
}

function mostrarExamenesDisponibles(id){
    $.ajax({
        dataType: "json",
        cache: false,
        url: "/administrador/buscarExamen/"+id,
        timeout: 5000,
        error: function(XMLHttpRequest, errorTextStatus, error) {
            alert("Error al buscar examen: " + errorTextStatus + "\n" + error);
        },
        success: function(data) {
            for(i = 0; i < 1; i++){
                nuevo = '<li id="'+ data[i].id +'" class="collection-item" onclick="activarCollection(this)">'
                nuevo +=    '<div class="row">'
                nuevo +=        '<div class="col s6">'
                nuevo +=           '<span>' + data[i].materia + '</span>'
                nuevo +=        '</div>'
                nuevo +=        '<div class="col s3">'
                nuevo +=            '<span>' + data[i].turno + '</span>'
                nuevo +=        '</div>'
                nuevo +=        '<div class="col s3">'
                nuevo +=            '<span>' + data[i].fecha + '</span>'
                nuevo +=        '</div>'
                nuevo +=    '</div>'
                nuevo +='</li>'
                $("#P_mostrarExamen").append(nuevo);
            }
        }
    })
}
function activarCollection(esto){
    $("li.collection-item.active").removeClass("active");
    $(esto).addClass("active");
    $("#idExamen").attr("value", $(esto).attr("id"));
    $(esto).attr("onclick", "desactivarCollection(this)");
}
function desactivarCollection(esto){
    $(esto).removeClass("active");
    $("#idExamen").attr("value", "");
    $(esto).attr("onclick", "activarCollection(this)");
}

function guardarPreguntas(){
    id = $("idExamen").attr("value");
    $.ajax({
        dataType: json,
        cache: false,
        url: "administrador/guardarPreguntas/" + id
    });
}
###

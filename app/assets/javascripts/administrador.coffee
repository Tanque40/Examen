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

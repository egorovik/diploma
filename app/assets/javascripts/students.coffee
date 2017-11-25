# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@del_document_body_f = (link)->
  if confirm("Вы уверены?")
    link.parent().find("input[type=hidden].remove_fields").first().val("1")
    link.parent().parent().parent().parent().hide()
  false
  
@del_document_f = ->
  $('a.remove_document').on 'click', ->
    window.del_document_body_f($(this))
    false
  false
  
@add_document_f = ->
  $('#add_document_link').on 'click', ->
    new_id = new Date().getTime()
    regexp = new RegExp("new_document", "g")
    content = $(this).attr('data-content')
    content = content.replace(regexp, new_id)
    $(this).parent().parent().after(content)
    panel = $(this).parent().parent().parent().find('.panel-info').first()
    $('#documents_form_datepicker').datepicker 'option', 'dateFormat', "dd.mm.yy"
    $('#documents_form_datepicker').datepicker $.datepicker.regional["ru"]
    $('#documents_form_datepicker').datepicker()
    panel.find('a.remove_document').on 'click', ->
      window.del_document_body_f($(this))
      false
    false
  


students_click = ->
  a = $(this).data()
  window.location.href = a.info[0] + '/' + a.info[1]

students_ready = ->
  $('.student_name').on 'click', students_click
  $('#students_bday_form_datepicker').datepicker 'option', 'dateFormat', "dd.mm.yy"
  $('#students_bday_form_datepicker').datepicker $.datepicker.regional["ru"]
  $('#students_bday_form_datepicker').datepicker()
  $('#students_start_date_form_datepicker').datepicker 'option', 'dateFormat', "dd.mm.yy"
  $('#students_start_date_form_datepicker').datepicker $.datepicker.regional["ru"]
  $('#students_start_date_form_datepicker').datepicker()
  $('#students_finish_date_form_datepicker').datepicker 'option', 'dateFormat', "dd.mm.yy"
  $('#students_finish_date_form_datepicker').datepicker $.datepicker.regional["ru"]
  $('#students_finish_date_form_datepicker').datepicker()
  window.add_document_f()
  window.del_document_f()
  
$(document).ready students_ready
$(document).on 'page:load', students_ready
$(document).on 'turbolinks:load', students_ready

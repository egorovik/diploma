# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
documents_click = ->
  a = $(this).data()
  window.location.href = a.info[0] + '/' + a.info[1]

documents_ready = ->
  $('.document_name').on 'click', documents_click
  $('#documents_form_datepicker').datepicker 'option', 'dateFormat', "dd.mm.yy"
  $('#documents_form_datepicker').datepicker $.datepicker.regional["ru"]
  $('#documents_form_datepicker').datepicker()
  
$(document).ready documents_ready
$(document).on 'page:load', documents_ready
$(document).on 'turbolinks:load', documents_ready

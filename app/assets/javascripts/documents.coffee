# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
documents_click = ->
  a = $(this).data()
  window.location.href = a.info[0] + '/' + a.info[1]

documents_ready = ->
  $('.document_name').on 'click', documents_click
  
$(document).ready documents_ready
$(document).on 'page:load', documents_ready
$(document).on 'turbolinks:load', documents_ready

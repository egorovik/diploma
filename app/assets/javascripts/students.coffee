# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
students_click = ->
  a = $(this).data()
  window.location.href = a.info[0] + '/' + a.info[1]

students_ready = ->
  $('.student_name').on 'click', students_click
  
$(document).ready students_ready
$(document).on 'page:load', students_ready
$(document).on 'turbolinks:load', students_ready

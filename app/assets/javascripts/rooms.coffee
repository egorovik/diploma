# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
rooms_click = ->
  a = $(this).data()
  window.location.href = a.info[0] + '/' + a.info[1]

rooms_ready = ->
  $('.room_name').on 'click', rooms_click
  
$(document).ready rooms_ready
$(document).on 'page:load', rooms_ready
$(document).on 'turbolinks:load', rooms_ready

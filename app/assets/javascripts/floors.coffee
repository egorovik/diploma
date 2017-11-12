# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
floors_click = ->
  a = $(this).data()
  window.location.href = a.info[0] + '/' + a.info[1]

floors_ready = ->
  $('.floor_name').on 'click', floors_click
  
$(document).ready floors_ready
$(document).on 'page:load', floors_ready
$(document).on 'turbolinks:load', floors_ready

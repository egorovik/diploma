# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
specialities_click = ->
  a = $(this).data()
  window.location.href = a.info[0] + '/' + a.info[1]

specialities_ready = ->
  $('.speciality_name').on 'click', specialities_click
  
$(document).ready specialities_ready
$(document).on 'page:load', specialities_ready
$(document).on 'turbolinks:load', specialities_ready

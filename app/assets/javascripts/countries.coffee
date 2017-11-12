# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
countries_click = ->
  a = $(this).data()
  window.location.href = a.info[0] + '/' + a.info[1]

countries_ready = ->
  $('.country_name').on 'click', countries_click
  
$(document).ready countries_ready
$(document).on 'page:load', countries_ready
$(document).on 'turbolinks:load', countries_ready

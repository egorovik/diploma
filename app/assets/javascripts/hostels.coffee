# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
hostels_click = ->
  a = $(this).data()
  window.location.href = a.info[0] + '/' + a.info[1]

hostels_ready = ->
  $('.hostel_name').on 'click', hostels_click
  
$(document).ready hostels_ready
$(document).on 'page:load', hostels_ready
$(document).on 'turbolinks:load', hostels_ready

# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
passports_click = ->
  a = $(this).data()
  window.location.href = a.info[0] + '/' + a.info[1]

passports_ready = ->
  $('.passport_name').on 'click', passports_click
  
$(document).ready passports_ready
$(document).on 'page:load', passports_ready
$(document).on 'turbolinks:load', passports_ready

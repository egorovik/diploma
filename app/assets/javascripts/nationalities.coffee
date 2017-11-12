# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
nationalities_click = ->
  a = $(this).data()
  window.location.href = a.info[0] + '/' + a.info[1]

nationalities_ready = ->
  $('.nationality_name').on 'click', nationalities_click
  
$(document).ready nationalities_ready
$(document).on 'page:load', nationalities_ready
$(document).on 'turbolinks:load', nationalities_ready

# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
religions_click = ->
  a = $(this).data()
  window.location.href = a.info[0] + '/' + a.info[1]

religions_ready = ->
  $('.religion_name').on 'click', religions_click
  
$(document).ready religions_ready
$(document).on 'page:load', religions_ready
$(document).on 'turbolinks:load', religions_ready

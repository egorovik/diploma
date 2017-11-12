# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
groups_click = ->
  a = $(this).data()
  window.location.href = a.info[0] + '/' + a.info[1]

groups_ready = ->
  $('.group_name').on 'click', groups_click
  
$(document).ready groups_ready
$(document).on 'page:load', groups_ready
$(document).on 'turbolinks:load', groups_ready

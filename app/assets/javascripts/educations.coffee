# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
educations_click = ->
  a = $(this).data()
  window.location.href = a.info[0] + '/' + a.info[1]

educations_ready = ->
  $('.education_name').on 'click', educations_click
  
$(document).ready educations_ready
$(document).on 'page:load', educations_ready
$(document).on 'turbolinks:load', educations_ready

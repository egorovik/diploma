# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
specialities_click = ->
  a = $(this).data()
  window.location.href = a.info[0] + '/' + a.info[1]

filter_button_click = ->
  $('.filter-button').toggleClass("btn-success btn-danger")
  $('.filter-row').toggleClass("hide")

specialities_ready = ->
  $('.speciality_name').on 'click', specialities_click
  $('.filter-button').on 'click', filter_button_click
  
#$(document).ready specialities_ready
$(document).on 'page:load', specialities_ready
$(document).on 'turbolinks:load', specialities_ready

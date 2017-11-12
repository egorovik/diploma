# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
religion_holidays_click = ->
  a = $(this).data()
  window.location.href = a.info[0] + '/' + a.info[1]

religion_holidays_ready = ->
  $('.religion_holiday_name').on 'click', religion_holidays_click
  
$(document).ready religion_holidays_ready
$(document).on 'page:load', religion_holidays_ready
$(document).on 'turbolinks:load', religion_holidays_ready

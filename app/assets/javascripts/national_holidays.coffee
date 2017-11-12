# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
national_holidays_click = ->
  a = $(this).data()
  window.location.href = a.info[0] + '/' + a.info[1]

national_holidays_ready = ->
  $('.national_holiday_name').on 'click', national_holidays_click
  
$(document).ready national_holidays_ready
$(document).on 'page:load', national_holidays_ready
$(document).on 'turbolinks:load', national_holidays_ready

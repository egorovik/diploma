# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
referrals_click = ->
  a = $(this).data()
  window.location.href = a.info[0] + '/' + a.info[1]

referrals_ready = ->
  $('.referral_name').on 'click', referrals_click
  
$(document).ready referrals_ready
$(document).on 'page:load', referrals_ready
$(document).on 'turbolinks:load', referrals_ready

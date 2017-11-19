# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
to_do_head_click = ->
  $('.to_do_body').fadeToggle(1000)
  
questions_head_click = ->
  $('.questions_body').fadeToggle(1000)
  
new_head_click = ->
  $('.new_body').fadeToggle(1000)


welcome_ready =->
  $(".my-notice-default").fadeOut(5000)
  $('.to_do_head').on 'click', to_do_head_click
  $('.questions_head').on 'click', questions_head_click
  $('.new_head').on 'click', new_head_click

$(document).on 'page:load', welcome_ready
$(document).on 'turbolinks:load', welcome_ready
#$(document).ready welcome_ready

# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

welcome_ready =->
  $(".my-notice-default").fadeOut(5000)

$(document).on 'page:load', welcome_ready
$(document).on 'turbolinks:load', welcome_ready
$(document).ready welcome_ready

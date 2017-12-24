# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
calendar = (time) ->
  nholidays = $("#nholidays").attr('data-info')
  rholidays = $("#rholidays").attr('data-info')
  console.log("nholidays", nholidays)
  console.log("rholidays", rholidays)
  month = ["Январь", "Февраль", "Март", "Апрель", "Май", "Июнь", "Июль",
           "Август", "Сентябрь", "Октябрь", "Ноябрь", "Декабрь"]
  $("#cl-year-curr-input").val(time.getFullYear())
  $("#cl-month-curr-select").val(time.getMonth())
  today = new Date()
  str = ""
  timecurr = new Date(time.getFullYear(), time.getMonth())
  timeprev = new Date(time.getFullYear(), time.getMonth(), 0)
  i = timeprev.getDay()
  while i > 0
    str1 = "<td class=\"cl-wd-" + parseInt(i) + " passive-week-day\">"
    str1 = str1 + "<div>"
    str1 = str1 + "<div>"
    str1 = str1 + "<div>"
    str1 = str1 + parseInt(timeprev.getDate())
    str1 = str1 + "</div>"
    str1 = str1 + "</div>"
    str1 = str1 + "</div>"
    str1 = str1 + "</td>"
    str = str1 + str
    timeprev.setDate(timeprev.getDate() - 1)
    i--
  curr_month = time.getMonth()
  str = "<tr>" + str
  while timecurr.getMonth() == curr_month
    str1 = "<td class=\"cl-wd-" + parseInt(timecurr.getDay()) + "\">"
    if timecurr.getFullYear() == today.getFullYear() && timecurr.getMonth() == today.getMonth() && timecurr.getDate() == today.getDate()
      str1 = str1 + "<div>"
      str1 = str1 + "<div>"
      str1 = str1 + "<div class=\"today\">"
    else
      str1 = str1 + "<div>"
      str1 = str1 + "<div>"
      str1 = str1 + "<div>"
    str1 = str1 + parseInt(timecurr.getDate())
    str1 = str1 + "</div>"
    str1 = str1 + "</div>"
    str1 = str1 + "</div>"
    str1 = str1 + "</td>"
    str = str + str1
    if timecurr.getDay() == 0
      str = str + "</tr><tr>"
    timecurr.setDate(timecurr.getDate() + 1)
  if timecurr.getDay() != 1
    while 1
      if timecurr.getDay() != 0
        str1 = "<td class=\"cl-wd-" + parseInt(timecurr.getDay()) + " passive-week-day\">"
      else
        str1 = "<td class=\"cl-wd-" + parseInt(timecurr.getDay()) + " passive-week-end\">"
      str1 = str1 + "<div>"
      str1 = str1 + "<div>"
      str1 = str1 + "<div>"
      str1 = str1 + parseInt(timecurr.getDate())
      str1 = str1 + "</div>"
      str1 = str1 + "</div>"
      str1 = str1 + "</div>"
      str1 = str1 + "</td>"
      str = str + str1
      timecurr.setDate(timecurr.getDate() + 1)
      if timecurr.getDay() == 1
        break
  str = str + "</tr>"
  $('.cl-body').html(str)
  

welcome_ready= ->
  $(".my-notice-default").fadeOut(5000)
  path = $(".cl").data('info')
  timenow = new Date()
  $.get( path, { year: timenow.getFullYear(), month: timenow.getMonth() } )
  calendar(timenow)
  $(".cl-year-prev").on 'click', ->
    timenow.setFullYear(timenow.getFullYear() - 1)
    $.get( path, { year: timenow.getFullYear(), month: timenow.getMonth() } )
    calendar(timenow)
  $(".cl-year-next").on 'click', ->
    timenow.setFullYear(timenow.getFullYear() + 1)
    $.get( path, { year: timenow.getFullYear(), month: timenow.getMonth() } )
    calendar(timenow)
  $(".cl-month-prev").on 'click', ->
    if timenow.getMonth() == 0
      timenow.setFullYear(timenow.getFullYear() - 1)
      timenow.setMonth(11)
    else
      timenow.setMonth(timenow.getMonth() - 1)
    $.get( path, { year: timenow.getFullYear(), month: timenow.getMonth() } )
    calendar(timenow)
  $(".cl-month-next").on 'click', ->
    if timenow.getMonth() == 11
      timenow.setFullYear(timenow.getFullYear() + 1)
      timenow.setMonth(0)
    else
      timenow.setMonth(timenow.getMonth() + 1)
    $.get( path, { year: timenow.getFullYear(), month: timenow.getMonth() } )
    calendar(timenow)
  $("#cl-year-curr-input").on 'change', ->
    timenow.setFullYear($(this).val())
    $.get( path, { year: timenow.getFullYear(), month: timenow.getMonth() } )
    calendar(timenow)
  $("#cl-month-curr-select").on 'change', ->
    timenow.setMonth($(this).val())
    $.get( path, { year: timenow.getFullYear(), month: timenow.getMonth() } )
    calendar(timenow)


$(document).on 'page:load', welcome_ready
$(document).on 'turbolinks:load', welcome_ready
#$(document).ready welcome_ready

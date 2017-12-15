# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
calendar = (time) ->
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
    str1 = str1 + "<span>" + parseInt(timeprev.getDate()) + "</span>" + "</td>"
    str = str1 + str
    timeprev.setDate(timeprev.getDate() - 1)
    i--
  curr_month = time.getMonth()
  str = "<tr>" + str
  while timecurr.getMonth() == curr_month
    if timecurr.getFullYear() == today.getFullYear() && timecurr.getMonth() == today.getMonth() && timecurr.getDate() == today.getDate()
      str1 = "<td class=\"cl-wd-" + parseInt(timecurr.getDay()) + " today\">"
    else
      str1 = "<td class=\"cl-wd-" + parseInt(timecurr.getDay()) + "\">"
    str1 = str1 + "<span>" + parseInt(timecurr.getDate()) + "</span>" + "</td>"
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
      str1 = str1 + "<span>" + parseInt(timecurr.getDate()) + "</span>" + "</td>"
      str = str + str1
      timecurr.setDate(timecurr.getDate() + 1)
      if timecurr.getDay() == 1
        break
  str = str + "</tr>"
  $('.cl-body').html(str)

welcome_ready= ->
  $(".my-notice-default").fadeOut(5000)
  timenow = new Date()
  calendar(timenow)
  $(".cl-year-prev").on 'click', ->
    timenow.setFullYear(timenow.getFullYear() - 1)
    calendar(timenow)
  $(".cl-year-next").on 'click', ->
    timenow.setFullYear(timenow.getFullYear() + 1)
    calendar(timenow)
  $(".cl-month-prev").on 'click', ->
    if timenow.getMonth() == 0
      timenow.setFullYear(timenow.getFullYear() - 1)
      timenow.setMonth(11)
    else
      timenow.setMonth(timenow.getMonth() - 1)
    calendar(timenow)
  $(".cl-month-next").on 'click', ->
    if timenow.getMonth() == 11
      timenow.setFullYear(timenow.getFullYear() + 1)
      timenow.setMonth(0)
    else
      timenow.setMonth(timenow.getMonth() + 1)
    calendar(timenow)
  $("#cl-year-curr-input").on 'change', ->
    timenow.setFullYear($(this).val())
    calendar(timenow)
  $("#cl-month-curr-select").on 'change', ->
    timenow.setMonth($(this).val())
    calendar(timenow)


$(document).on 'page:load', welcome_ready
$(document).on 'turbolinks:load', welcome_ready
#$(document).ready welcome_ready

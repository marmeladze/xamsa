intervalId = null

ready = ->
  $('#question_packs li').on 'click', ->
    $(this).fadeOut 'fast', () ->
      $(this).remove()
      if $('#question_packs li').length == 1
        $('#question_packs form').submit()

  $('.answer-button').on 'click', () ->
    $('.answer-button').addClass 'answer-button-pressed'
    $('input.answer').show().focus()
    pause()
  $('input.answer').on 'keypress', (e) ->
    console.log e.which

  if $('#play').length > 0
    timer()

timer = () ->
  timeout = parseInt($('.timeout span').text()) * 1000

  countdown = () ->
    value = parseInt $('.timeout span').text()
    if value > 0
      value -= 1
      $('.timeout span').text value
    else
      clearInterval intervalId
      console.log 'time is up!'

  intervalId = setInterval countdown, 1000

  $('.green-bar').animate { opacity: 0 }, timeout

  $('.red-bar').animate { width: "100%" }, timeout

pause = () ->
  $('.green-bar').pause()
  $('.red-bar').pause()
  clearInterval intervalId

$(document).ready(ready)
$(document).on('page:load', ready)
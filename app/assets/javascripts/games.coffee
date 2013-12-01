source = null

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

  if $('#play').length > 0
    timer()
    live_play()

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
      Turbolinks.visit '/games/play'

  intervalId = setInterval countdown, 1000

  $('.green-bar').animate { opacity: 0 }, timeout

  $('.red-bar').animate { width: "100%" }, timeout

pause = () ->
  $('.green-bar').pause()
  $('.red-bar').pause()
  source.close()
  # add more seconds for thinking
  value = parseInt $('.timeout span').text()
  $('.timeout span').text(value + 10)

live_play = () ->
  source = new EventSource '/live/play'

  source.addEventListener 'game.char', (e) ->
    data = $.parseJSON e.data

    $char = $('<span>').text(data.char).hide()
    $('#question').append $char
    $char.fadeIn 'slow'

  source.addEventListener 'game.questionEnd', (e) ->
    source.close()

$(document).ready(ready)
$(document).on('page:load', ready)
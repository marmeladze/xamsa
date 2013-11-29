ready = ->
  $('#question_packs li').on 'click', ->
    $(this).remove()
    if $('#question_packs li').length == 1
      $('#question_packs form').submit()

  $('#stop-button').on 'click', ->
    $('.answer-box').removeClass('hidden')

  $("#answer-input").on 'keydown', (e) ->
    if e.which is 13
      $('#result-box').text('Cavab doğrudur!')


$(document).ready(ready)
$(document).on('page:load', ready)
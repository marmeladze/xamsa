ready = ->
  $('#question_packs li').on 'click', ->
    $(this).remove()
    if $('#question_packs li').length == 1
      $('#question_packs form').submit()

  $('#stop-button').on 'click', ->
    $('.answer-box').removeClass('hidden')

$(document).ready(ready)
$(document).on('page:load', ready)
ready = ->
  $('#question_packs li').on 'click', ->
    $(this).remove()

$(document).ready(ready)
$(document).on('page:load', ready)
$('#question').text("<%= @question.text unless @question.nil? %>")
$('#result-box').text('Cavab doğrudur!')
$('.answer-box').addClass('hidden')
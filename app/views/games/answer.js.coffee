$('#question').text("<%= @question.text unless @question.nil? %>")

$('.answer-box').addClass('hidden')
$('.answer-box input').val('')

<% if @result %>
$('#result-box').text('Cavab doğrudur!')
<% else %>
$('#result-box').text('Cavab səhvdir!')
<% end %>
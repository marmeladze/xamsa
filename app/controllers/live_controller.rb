class LiveController < ApplicationController
  include ActionController::Live
  before_filter :authenticate_player!

  def play
    begin
      question = QuestionPack.find_by_id(session[:question_pack_id]).questions.where(order: session[:question_order]).first
      
      response.headers['Content-Type'] = 'text/event-stream; charset=utf-8'
      
      question.text.each_char do |char|
        response.stream.write message('game.char', { char: char })
        sleep 0.04
      end
      response.stream.write message('game.questionEnd')
    rescue IOError
    ensure
      response.stream.close
    end
  end

  private
  def message(event, data={})
    "event: #{event}\ndata: #{data.to_json}\n\n"
  end
end
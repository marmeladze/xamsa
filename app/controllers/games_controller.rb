class GamesController < ApplicationController
  before_filter :authenticate_player!

  def index
  end

  def new
    @question_packs = QuestionPack.limit 5
  end

  def create
    session[:question_pack_id] = params[:question_pack]
    session[:question_order] = 0

    redirect_to game_path(:play)
  end

  def show
    if session[:question_order] > 4 || session[:question_order].nil?
      redirect_to new_game_path
    else
      session[:question_order] += 1
      @question_word_count = QuestionPack.find_by_id(session[:question_pack_id]).questions.where(order: session[:question_order]).first.text.split.count
    end
  end

  def answer
    question_pack = QuestionPack.find_by_id session[:question_pack_id]
    
    if question_pack.questions.where(order: session[:question_order]).first.check_answer params[:answer]
      flash[:result] = 'Cavab doğrudur!'
    else
      flash[:result] = 'Cavab səhvdir!'
    end
  end
end
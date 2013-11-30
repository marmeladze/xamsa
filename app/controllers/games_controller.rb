class GamesController < ApplicationController
  before_filter :authenticate_player!

  def index
  end

  def new
    @question_packs = QuestionPack.limit 5
  end

  def create
    session[:question_pack_id] = params[:question_pack]
    session[:question_order] = 1

    redirect_to game_path(:play)
  end

  def show
    session[:question_order] ||= 1
    @question = QuestionPack.find_by_id(session[:question_pack_id]).questions.where(order: session[:question_order]).first
  end

  def answer
    question_pack = QuestionPack.find_by_id session[:question_pack_id]
    @result = question_pack.questions.where(order: session[:question_order]).first.check_answer params[:answer]

    session[:question_order] += 1
    @question = question_pack.questions.where(order: session[:question_order]).first

    respond_to do |format|
      format.js
    end
  end
end
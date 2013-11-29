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
    @question_pack = QuestionPack.find_by_id session[:question_pack_id]
    session[:question_order] ||= 1
  end

  def answer
    if session[:question_pack_id].nil? || session[:question_order].nil?
      redirect_to games_path
    end

    question_pack = QuestionPack.find_by_id session[:question_pack_id]
    session[:question_order] += 1
    @question = question_pack.questions.where(order: session[:question_order]).first

    respond_to do |format|
      format.js
    end
  end
end
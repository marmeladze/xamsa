class GamesController < ApplicationController
  before_filter :authenticate_player!

  def index
  end

  def new
    @question_packs = QuestionPack.limit 5
  end

  def create
    session[:question_pack_id] = params[:question_pack]

    redirect_to game_path(:play)
  end

  def show
    @question_pack = QuestionPack.find_by_id session[:question_pack_id]
  end
end
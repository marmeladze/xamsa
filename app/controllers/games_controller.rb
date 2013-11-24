class GamesController < ApplicationController
  before_filter :authenticate_player!

  def index
  end

  def new
    @question_packs = QuestionPack.limit 5
  end
end
class GamesController < ApplicationController
  before_filter :authenticate_player!

  def index
  end

  def new
    
  end
end
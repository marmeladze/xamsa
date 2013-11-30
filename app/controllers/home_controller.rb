class HomeController < ApplicationController

  def index
    if current_player
      redirect_to games_path
    end
  end
end
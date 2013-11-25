# -*- encoding : utf-8 -*-
require "spec_helper"

describe GamesController do

  describe "routing" do

    it "routes to #index" do
      expect(get("/games")).to route_to("games#index")
    end

    it "routes to #new" do
      expect(get("/games/new")).to route_to("games#new")
    end

    it "routes to #create" do
      expect(post("/games")).to route_to("games#create")
    end

    it "routes to #show" do
      expect(get("/games/play")).to route_to("games#show", id: "play")
    end

    xit "routes to #destroy" do
      expect(delete("/games/1")).to route_to("games#destroy", :id => "1")
    end
  end

  describe "route helpers" do

    it "games_path" do
      expect(games_path).to eq("/games")
    end

    it "new_game_path" do
      expect(new_game_path).to eq("/games/new")
    end

    it "game_path" do
      expect(game_path(:play)).to eq("/games/play")
    end
  end      
end
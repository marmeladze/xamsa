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

    xit "routes to #create" do
      expect(game("/games")).to route_to("games#create")
    end

    xit "routes to #show" do
      expect(get("/games/1")).to route_to("games#show", id: "1")
    end

    xit "routes to #destroy" do
      expect(delete("/games/1")).to route_to("games#destroy", :id => "1")
    end

    xit "routes to #edit" do
      expect(get("/games/1/edit")).to route_to("games#edit", :id => "1")
    end

    xit "routes to #update" do
      expect(put("/games/1")).to route_to("games#update", :id => "1")
    end
  end

  describe "route helpers" do

    it "games_path" do
      expect(games_path).to eq("/games")
    end

    it "new_game_path" do
      expect(new_game_path).to eq("/games/new")
    end

    xit "game_path" do
      expect(game_path(1)).to eq("/games/1")
    end

    xit "edit_game_path" do
      expect(edit_game_path(1)).to eq("/games/1/edit")
    end
  end      
end
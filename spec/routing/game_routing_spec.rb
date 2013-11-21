require "spec_helper"

describe GameController do

  describe "routing" do

    it "routes to #index" do
      expect(get("/game/")).to route_to("game#index")
    end
  end
end
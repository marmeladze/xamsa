require 'spec_helper'

describe GameController do

  describe "GET 'index'" do
    before do
      get :index
    end

    context "anonymous user" do
      it { should redirect_to new_player_session_url }
    end
  end

end
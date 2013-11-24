require 'spec_helper'

describe GamesController do

  describe "GET 'index'" do
    context "anonymous user" do
      before do
        get :index
      end

      it { should redirect_to new_player_session_url }
    end

    context "logged in user" do
      before do
        sign_in (@player = FactoryGirl.create(:player))
        get :index
      end

      it { should respond_with(:success) }
      it { should render_template(:index) }
      it { should render_with_layout(:application) }
    end
  end

end
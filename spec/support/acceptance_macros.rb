# -*- encoding : utf-8 -*-
module AcceptanceMacros
  def login!
    before(:each) do
      @current_player = create :player
      visit new_player_session_path
      fill_in 'Email', with: @current_player.email
      fill_in 'Parol', with: 'changeme'
      within('form') { click_on 'Giriş' }
    end
  end
end

RSpec.configure do |config|
  config.extend AcceptanceMacros, :type => :request
end

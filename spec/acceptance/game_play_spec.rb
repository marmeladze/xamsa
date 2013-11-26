# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "Game", type: :request, js: true do
  before(:each) do
    # populate db with question packs
    5.times do
      question_pack = create :question_pack
      (1..5).each { |order| create :question, question_pack: question_pack, order: order }
    end
  end

  login!

  it {
    visit games_path
    
    # game#index page
    click_on 'Oyuna başla'

    # game#start page
    expect(page.all("#question_packs li").count).to eql(5)

    # click on question packs to remove them
    first('#question_packs li').click
    expect(page.all("#question_packs li").count).to eql(4)

    3.times { first('#question_packs li').click }
    # when there's last question pack left it should be redirected to the game play page
    expect(current_path).to eql(game_path(:play))

    expect(page).to have_content 'Bakı şəhəri məhz bu dənizin sahilində yerləşir'
  }
end

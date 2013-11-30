# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "Game", type: :request, js: true do
  before(:each) do
    # populate db with question packs
    5.times do
      question_pack = create :question_pack
      
      create :question, question_pack: question_pack, order: 1
      create :question, :second, question_pack: question_pack
      create :question, :with_answer, question_pack: question_pack
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

    # try first question
    expect(page).to have_content 'Bakı şəhəri məhz bu dənizin sahilində yerləşir'

    expect(page.evaluate_script("$('.answer-box').is(':hidden')")).to  be_true
    click_on 'STOP'
    expect(page.evaluate_script("$('.answer-box').is(':visible')")).to be_true

    fill_in 'answer', with: 'MyString'

    expect(page).to_not have_content 'Cavab doğrudur!'
    # trigger ENTER on the #answer-input
    page.execute_script("$('.answer-box form').submit()")
    expect(page).to have_content 'Cavab doğrudur!'

    # try second question
    expect(page).to have_content 'Məhz bu komanda 90-cı illərdə Azərbaycanı Şən və Hazırcavablar Klubunun Yüksək Liqasında təmsil etmişdir.'

    expect(page.evaluate_script("$('.answer-box').is(':hidden')")).to  be_true
    click_on 'STOP'
    expect(page.evaluate_script("$('.answer-box').is(':visible')")).to be_true

    fill_in 'answer', with: 'MyString'

    # trigger ENTER on the #answer-input
    page.execute_script("$('.answer-box form').submit()")
    expect(page).to have_content 'Cavab doğrudur!'

    # try third question with wrong answer
    expect(page).to have_content '“Əlvida, Bakı! Səni bir daha görməyəcəyəm” misraları ilə başlayan şeir bu rus şairin qələminə məxsusdur.'

    expect(page.evaluate_script("$('.answer-box').is(':hidden')")).to  be_true
    click_on 'STOP'
    expect(page.evaluate_script("$('.answer-box').is(':visible')")).to be_true

    fill_in 'answer', with: 'MyString'

    # trigger ENTER on the #answer-input
    page.execute_script("$('.answer-box form').submit()")
    expect(page).to have_content 'Cavab səhvdir!'
  }
end

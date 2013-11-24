# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "Game", type: :request do
  it {
    # go to homepage
    visit root_path
    expect(page).to have_link('Qeydiyyat')

    # go to registration page
    within('.main') { click_link 'Qeydiyyat' }
    expect(page).to have_content 'Qeydiyyat forması'

    fill_in 'Tam ad', with: 'Ali Ismayilov'
    fill_in 'Email', with: 'ali@alii.pro'
    fill_in 'Təvəllüd', with: '30.12.1989'
    select  'Kişi', from: 'Cins'
    fill_in 'Parol', with: 'parol123'
    fill_in 'Təkrar parol', with: 'parol123'
    check 'Mən istifadəçi qaydalarını qəbul edirəm'

    # go to welcome page
    click_on 'Qeydiyyatdan keç'
    
    # game#index page
    click_on 'Oyuna başla'

    # game#start page
    # expect(page.all("#questions li").count).to eql(5)
  }
end

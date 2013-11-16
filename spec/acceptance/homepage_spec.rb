# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "Homepage", :type => :request do
  it {
    # go to homepage
    visit root_path
    expect(page).to have_link('Qeydiyyat')

    # go to registration page
    click_link 'Qeydiyyat'
    expect(page).to have_content 'Qeydiyyat forması'

    fill_in 'Tam ad', with: 'Ali Ismayilov'
    fill_in 'Email', with: 'ali@alii.pro'
    fill_in 'Təvəllüd', with: '30.12.1989'
    select  'Kişi', from: 'Cins'
    fill_in 'Parol', with: 'parol'
    fill_in 'Təkrar parol', with: 'parol'
    check 'Mən istifadəçi qaydalarını qəbul edirəm'
    click_on 'Qeydiyyatdan keç'
  }
end

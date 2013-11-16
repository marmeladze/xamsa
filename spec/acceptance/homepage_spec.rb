# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "Homepage", :type => :request do
  it {
    # homepage
    visit root_path
    expect(page).to have_link('Qeydiyyat')

    # registration page
    click_link 'Qeydiyyat'
    expect(page).to have_content 'Qeydiyyat forması'
  }
end

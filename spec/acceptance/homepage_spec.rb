# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "Homepage", :type => :request do
  it {
    visit root_path
    expect(page).to have_link('Qeydiyyat')
  }
end

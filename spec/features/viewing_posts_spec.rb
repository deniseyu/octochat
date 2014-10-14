require 'spec_helper'
require_relative 'helpers/user_helpers'

feature 'All visitors to the homepage' do 

  before(:each) do
    sign_up
    new_post
    click_button "Sign out"
    end

  scenario 'can view posts' do
    visit '/'
    expect(page).to have_content 'Fish are friends, not food!'
  end

end
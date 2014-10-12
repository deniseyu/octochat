require 'spec_helper'
require_relative 'helpers/user_helpers'
require_relative 'helpers/post_helpers'

include UserHelpers
include PostHelpers

feature 'Users who are logged in' do 

  before(:each) do 
  User.create(:username => "Nemo123",
              :realname => "Nemo",
              :email => "lost@sea.com",
              :password => "help",
              :password_confirmation => "help")
  end

  scenario 'can make new posts' do 
    sign_in 
    new_post 
    expect(page).to have_content "Fish are friends, not food!"
    expect(page).to have_content "by Nemo"
  end

  scenario 'should not be able to execute HTML via posts' do 
    sign_in 
    new_post("<img src='http://i.imgur.com/yOxuiQ2.jpg'>")
    expect(page).to have_content "<img src='http://i.imgur.com/yOxuiQ2.jpg'>"
  end


  
end
require 'spec_helper'
require_relative 'helpers/user_helpers'

include UserHelpers

feature 'New user' do 

  scenario 'can sign up with correct credentials' do 
    visit '/'
    sign_up
    expect(User.count).to eq 1
    expect(page).to have_content "Welcome, Nemo!"
  end

  scenario 'signs up with non-matching passwords' do
    visit '/'
    sign_up("Nemo123", "Nemo", "lost@sea.com", "help", "kelp")
    expect(User.count).to eq 0
    expect(current_path).to eq '/users'
    expect(page).to have_content("Password does not match the confirmation")
  end

  scenario 'signs up with non-unique email' do 
    visit '/'
    sign_up
    sign_up("Nemo234", "Nemo", "lost@sea.com", "help", "help")
    expect(current_path).to eq '/users'
    expect(page).to have_content("Email is already taken")
  end

  scenario 'signs up with a non-unique username' do 
    visit '/'
    sign_up
    sign_up("Nemo123", "Nemo", "found@sea.com", "help", "help")
    expect(current_path).to eq '/users'
    expect(page).to have_content("Username is already taken")
  end

end

feature 'Existing user' do 

  before(:each) do 
    User.create(:username => "Nemo123",
                :realname => "Nemo",
                :email => "lost@sea.com",
                :password => "help",
                :password_confirmation => "help")
    end

  scenario 'can sign in with the correct password' do 
    visit '/'
    expect(page).not_to have_content "Welcome, Nemo!"
    sign_in("lost@sea.com", "help")
    expect(page).to have_content "Welcome, Nemo!"
  end

  scenario 'cannot sign in with a wrong password' do 
    visit '/'
    sign_in("lost@sea.com", "kelp")
    expect(page).to have_content "password is incorrect"
  end

  scenario 'can sign out' do 
    sign_in("lost@sea.com", "help")
    click_button "Sign out"
    expect(page).to have_content("Good bye!")
    expect(page).not_to have_content("Welcome, Nemo!")
  end

end

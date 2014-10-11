require 'spec_helper'

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

def sign_up(username = "Nemo123",
            realname = "Nemo",
            email = "lost@sea.com",
            password = "help",
            password_confirmation = "help")
  visit '/users/new'
  expect(page.status_code).to eq 200 
  fill_in :username, :with => username
  fill_in :realname, :with => realname
  fill_in :email, :with => email
  fill_in :password, :with => password 
  fill_in :password_confirmation, :with => password_confirmation
  click_button 'Sign up'
end
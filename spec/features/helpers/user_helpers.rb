module UserHelpers

  def sign_up(username = "Nemo123",
            realname = "Nemo",
            email = "lost@sea.com",
            password = "help",
            password_confirmation = "help")
    visit '/users/new'
    fill_in :username, :with => username
    fill_in :realname, :with => realname
    fill_in :email, :with => email
    fill_in :password, :with => password 
    fill_in :password_confirmation, :with => password_confirmation
    click_button 'Sign up'
  end

  def sign_in(email = "lost@sea.com", password = "help")
    visit '/sessions/new'
    fill_in 'email', :with => email
    fill_in 'password', :with => password
    click_button 'Sign in'
  end

end
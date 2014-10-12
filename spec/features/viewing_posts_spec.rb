require 'spec_helper'

feature 'All visitors to the homepage' do 

  before(:each) do 
    Post.create(:content => "Just keep swimming")
    end

  scenario 'can view posts' do
    visit '/'
    expect(page).to have_content 'Just keep swimming'
  end

end
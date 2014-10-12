module PostHelpers

  def new_post(content = "Fish are friends, not food!")
    fill_in 'content', :with => content
    click_button 'Post'
  end



end
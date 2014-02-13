require 'spec_helper'

feature 'user views all the posts' do
  before :each do
    @Joe = User.create(email: "joe@gmail.com", password: 'password')
    @post = Post.create(title: "Top 10 today", body: 'This is an empty post')
  end

  scenario "a loged in user should be able to upvote a post" do
    visit new_user_session_path
    fill_in "Email", with: "joe@gmail.com"
    fill_in 'Password', with: 'password'
    click_button 'Sign in'
    click_on 'Up vote'
    expect(page).to have_content '1'
    click_on 'Up vote'
    expect(page).to have_content 'User has already been taken'
  end

  scenario "a loged in user should be able to downvote a post" do
    visit new_user_session_path
    fill_in "Email", with: "joe@gmail.com"
    fill_in 'Password', with: 'password'
    click_button 'Sign in'
    click_on 'Down vote'
    expect(page).to have_content '-1'
    click_on 'Up vote'
    expect(page).to have_content 'User has already been taken'
  end

end
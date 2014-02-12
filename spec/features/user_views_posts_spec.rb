require 'spec_helper'

feature 'User views their posts' do
  scenario 'show all the post of a certain user' do

    user = create(:user)
    create(:post, title: 'Top 10 today', user: user)
    create(:post, title: 'Great story', user: user)
    create(:post, title: 'Obama', user: user)
    create(:post, title: 'Jerkface')

    sign_in_as(user)
    expect(page).to have_content 'Top 10 today'
    expect(page).to have_content 'Great story'
    expect(page).to have_content 'Obama'

    expect(page).to_not have_content 'Jerkface'
  end
end

require 'rails_helper'

feature 'Visitor log out' do
  let(:user) { create(:user) }

  scenario 'successfully' do
    visit root_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Sign in'
    click_on 'Log out'

    expect(page).not_to have_content(user.email)
    expect(page).to have_selector("input[type='email']")
    expect(page).to have_selector("input[type='password']")
  end
end

require 'rails_helper'

feature 'Visitor sign in' do
  let(:user) { create(:user) }

  scenario 'successfully' do
    visit root_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Sign in'

    expect(page).to have_content(user.email)
    expect(page).not_to have_content('Invalid Credentials')
  end

  scenario 'with bad credentials' do
    visit root_path

    click_on 'Sign in'

    expect(page).to have_content('Invalid Credentials')
  end
end

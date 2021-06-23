require 'rails_helper'

feature 'Visitor sign in' do
  scenario 'successfully' do
    visit new_user_path

    within find('#new_user') do
      fill_in 'Email', with: 'abc@abc.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      click_on 'Sign Up'
    end

    expect(page).to have_content('Created Successfully')
  end

  scenario 'without password confirmation' do
    visit new_user_path

    within find('#new_user') do
      fill_in 'Email', with: 'abc@abc.com'
      fill_in 'Password', with: 'password'
      click_on 'Sign Up'
    end

    expect(page).to have_content("Password confirmation doesn't match Password")
  end

  scenario 'without invalid email' do
    visit new_user_path

    within find('#new_user') do
      fill_in 'Email', with: 'invalid_email'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      click_on 'Sign Up'
    end

    expect(page).to have_content('Email is invalid')
  end

  scenario 'with already existent email' do
    create(:user, email: 'abc@abc.com')

    visit new_user_path

    within find('#new_user') do
      fill_in 'Email', with: 'abc@abc.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      click_on 'Sign Up'
    end

    expect(page).to have_content('Email has already been taken')
  end
end

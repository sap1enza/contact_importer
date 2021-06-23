require 'rails_helper'

feature 'Visitor visit homepage' do
  scenario 'successfully' do
    visit root_path

    expect(page).to have_content('Contact Importer')
    expect(page).to have_selector("input[type='email']")
    expect(page).to have_selector("input[type='password']")
  end
end

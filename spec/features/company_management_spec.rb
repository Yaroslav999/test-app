require 'rails_helper'

RSpec.feature 'Company management', type: :feature do
  let!(:user) { create(:user, role: 0) }

  scenario 'User signs in and creates a new company' do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    expect(page).to have_content('Listing your companies')

    click_link 'Create company'
    fill_in 'Name', with: 'New Company'
    fill_in 'Initial cash', with: 55
    select 'Afghanistan', from: 'company_country'
    click_button 'Save'

    expect(page).to have_content('New Company')
  end
end

require 'rails_helper'

feature 'the signup process' do
  feature 'signing up' do
    scenario 'signs up a user with valid input' do
      visit signup_url
      fill_in 'Name', with: 'Michael'
      click_on 'Create user'
      expect(page).to have_selector 'h1', text: 'Michael'
    end

    scenario 'signs up a user with invalid input' do
      visit signup_url
      fill_in 'Name', with: '  '
      click_on 'Create user'
      expect(page).to have_selector 'div.field_with_errors'
    end
  end
end
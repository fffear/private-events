require 'rails_helper'

feature 'the login process' do
  background(:each) do
    FactoryBot.create(:user)
    visit login_url
  end

  feature 'logging in' do
    scenario 'log in a user with valid input' do
      fill_in 'Name', with: 'Michael'
      click_on 'Log in user'
      expect(page).to have_selector 'h1', text: 'Michael'
    end

    scenario 'log in a user with blank input' do
      fill_in 'Name', with: '  '
      click_on 'Log in user'
      expect(page).to have_selector 'li', text: "Invalid name"
    end

    scenario 'log in a user with wrong input' do
      fill_in 'Name', with: 'Timothy'
      click_on 'Log in user'
      expect(page).to have_selector 'li', text: "Invalid name"
    end

    scenario 'log in with remembering' do
      fill_in 'Name', with: 'Michael'
      check('session_remember_me')
      click_on 'Log in user'
      expect(get_me_the_cookies[1][:value]).to_not be_nil
    end

    scenario 'log in without remembering' do
      fill_in 'Name', with: 'Michael'
      click_on 'Log in user'
      expect(get_me_the_cookies.count).to eq(1)
    end
  end
end
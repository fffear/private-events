require 'rails_helper'

feature 'Create an event' do
  background(:each) do
    FactoryBot.create(:user)
    visit login_url
    fill_in 'Name', with: 'Michael'
    click_on 'Log in user'
    visit new_event_url
  end

  scenario 'valid for input' do
    fill_in 'Title', with: '30th Birthday Party'
    fill_in 'Date', with: '30/09/2019'
    fill_in 'Description', with: 'It will be the best night ever.'
    click_on 'Create event'
    expect(page).to have_content('30th Birthday Party')
  end

  scenario 'invalid for input' do
    fill_in 'Title', with: ''
    fill_in 'Date', with: '30/09/2019'
    fill_in 'Description', with: ''
    click_on 'Create event'
    expect(page).to have_selector 'div.field_with_errors', count: 4
  end
end
require 'rails_helper'

feature 'event index page' do
    let(:user) { FactoryBot.build(:user) }
    let(:event) { FactoryBot.build(:event, date: 2.days.from_now,
                                            title: "Test Title",
                                            description: "Test description",
                                            creator_id: user.id) }

  it 'index page contains 1 event with link to events#show page' do
    user.save
    event.save
    visit events_url
    expect(page).to have_link "Test Title", href: event_path(event)
    expect(page).to have_content "Test Title"
    click_on "Test Title"
    expect(current_path).to eq(event_path(event))
  end
end
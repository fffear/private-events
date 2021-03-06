require 'rails_helper'

feature 'user show page' do
  let(:user) { FactoryBot.build(:user) }
  let(:user_2) { FactoryBot.build(:user, name: "Timothy") }
  let(:event) { FactoryBot.build(:event, creator_id: user.id) }

  feature 'upcoming events' do
    scenario 'should have title and links for upcoming events' do
      user.save
      user_2.save
      event.save
      event.event_attendances.create(attendee_id: user_2.id)
      visit user_url(user)
      expect(page).to have_content("upcoming Events")
      expect(page).to have_link(event.title, href: event_path(event))
    end
  end
end
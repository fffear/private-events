require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe 'Event actions' do
    let(:user) { FactoryBot.create(:user) }

    describe 'events#new' do
      it 'renders event creation form page' do
        get :new, {}
        expect(response).to redirect_to root_url
      end
    end

    describe 'events#show' do
      it 'renders event show page' do
        event = user.created_events.create(date: 2.days.from_now,
                                           title: "Test Title",
                                           description: "Test description")
        get :show, params: { id: event.id }
        expect(response).to render_template('show')
      end
    end

    describe 'events#index' do
      it 'renders event index page' do
        event = user.created_events.create(date: 2.days.from_now,
                                           title: "Test Title",
                                           description: "Test description")
        get :index, {}
        expect(response).to render_template('index')
      end
    end
  end
end

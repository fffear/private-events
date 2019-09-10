require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'login (sessions#new)' do
    it "renders login page" do
      get :new, {}
      expect(response).to render_template('new')
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'sessions#create' do
    context "valid name" do
      it "redirects to user show page" do
        user = User.create(name: "Timothy")
        post :create, params: { session: { name: user.name } }
        expect(response).to redirect_to(user_url(user))
      end
    end

    context "invalid name" do
      it "redirects to sessions new page" do
        user = User.create(name: "Timothy")
        post :create, params: { session: { name: "" } }
        expect(response).to render_template('new')
      end
    end
  end
end

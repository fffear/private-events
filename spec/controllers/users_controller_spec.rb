require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user_not_in_db) { FactoryBot.build(:user) }
  let(:user_in_db) { FactoryBot.create(:user) }

  describe "signup (#users#new)" do
    it 'renders signup page' do
      get :new, {}
      expect(response).to render_template('new')
      expect(response).to have_http_status(:ok)
    end
  end

  describe "users#create" do
    context "with valid params" do
      it "redirects to user show page" do
        post :create, params: { user: { name: "Michael" } }
        expect(response).to redirect_to(User.last)
      end
    end

    context "with invalid params" do
      it "redirects to user show page" do
        post :create, params: { user: { name: "" } }
        expect(response).to render_template('new')
      end
    end
  end

  describe "users#show" do
    it 'renders user show page' do
      get :show, params: { id: user_in_db.id }
      expect(response).to render_template('show')
      expect(response).to have_http_status(:ok)
    end
  end
end

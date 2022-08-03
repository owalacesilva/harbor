require 'rails_helper'

RSpec.describe "Admin::Users", type: :request do
  describe "GET /backoffice/users" do
    it "returns http success" do
      get admin_users_url
      expect(response).to have_http_status(:success)
    end

    it "renders index template" do
      get admin_users_url
      expect(response).to render_template(:index)
    end
  end

  describe "GET /backoffice/users/new" do
    it "returns http success" do
      get new_admin_user_url
      expect(response).to have_http_status(:success)
    end

    it "renders index template" do
      get admin_users_url
      expect(response).to render_template(:index)
    end
  end

  describe "POST /backoffice/users" do
    let(:profile) { attributes_for(:profile) }
    let(:user) { attributes_for(:user, profile_attributes: profile) }

    before { post admin_users_url, params: { user: user } }

    it "redirects to user page" do
      expect(response).to redirect_to admin_user_url(User.first)
    end
  end

  describe "GET /backoffice/users/:id (show)" do
    let(:user) { create(:user) }

    it "returns http success" do
      get admin_user_url(user)
      expect(response).to have_http_status(:success)
    end

    it "renders index template" do
      get admin_users_url
      expect(response).to render_template(:index)
    end
  end

  describe "GET /backoffice/users/:id" do
    let(:user) { create(:user) }

    it "returns http success" do
      get edit_admin_user_url(user)
      expect(response).to have_http_status(:success)
    end

    it "renders index template" do
      get admin_users_url
      expect(response).to render_template(:index)
    end
  end

  describe "PUT /backoffice/users/:id" do
    let(:user) { create(:user) }
    let(:user) { attributes_for(:user) }

    it "returns http success" do
      post admin_users_url(user), params: { user: user }
      expect(response).to have_http_status(:success)
    end

    it "renders index template" do
      get admin_users_url
      expect(response).to render_template(:index)
    end
  end

  describe "DELETE /backoffice/users/:id/delete" do
    let(:user) { create(:user) }

    it "returns http success" do
      post delete_admin_user_url(user)
      expect(response).to have_http_status(:success)
    end

    it "renders index template" do
      get admin_users_url
      expect(response).to render_template(:index)
    end
  end
end

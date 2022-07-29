require 'rails_helper'

RSpec.describe "Backoffice::Purchases", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/backoffice/purchases/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/backoffice/purchases/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/backoffice/purchases/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/backoffice/purchases/create"
      expect(response).to have_http_status(:success)
    end
  end

end

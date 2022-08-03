require 'rails_helper'

RSpec.describe "Backoffice::Withdraws", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/backoffice/withdraws/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/backoffice/withdraws/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/backoffice/withdraws/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /cancel" do
    it "returns http success" do
      get "/backoffice/withdraws/cancel"
      expect(response).to have_http_status(:success)
    end
  end

end

require 'rails_helper'

RSpec.describe "Backoffice::Passwords", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/backoffice/password/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/backoffice/password/update"
      expect(response).to have_http_status(:success)
    end
  end

end

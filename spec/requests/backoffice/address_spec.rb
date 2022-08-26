require 'rails_helper'

RSpec.describe "Backoffice::Addresses", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/backoffice/address/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/backoffice/address/update"
      expect(response).to have_http_status(:success)
    end
  end

end

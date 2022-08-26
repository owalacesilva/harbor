require 'rails_helper'

RSpec.describe "Backoffice::Documents", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/backoffice/documents/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/backoffice/documents/update"
      expect(response).to have_http_status(:success)
    end
  end

end

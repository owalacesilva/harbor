require 'rails_helper'

RSpec.describe "Backoffice::BankingAccounts", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/backoffice/banking_account/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/backoffice/banking_account/update"
      expect(response).to have_http_status(:success)
    end
  end

end

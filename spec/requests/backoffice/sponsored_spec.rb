require 'rails_helper'

RSpec.describe "Backoffice::Sponsoreds", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/backoffice/sponsored/index"
      expect(response).to have_http_status(:success)
    end
  end

end

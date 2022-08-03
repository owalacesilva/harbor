require 'rails_helper'

RSpec.describe "Admin::Overviews", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/backoffice"
      expect(response).to have_http_status(:success)
    end

    it "renders index template" do
      get admin_overview_path
      expect(response).to assert_template(:index)
    end
  end
end

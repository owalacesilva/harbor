require 'rails_helper'

RSpec.describe "Indices", type: :request do
  describe "GET /" do
    it "returns http success" do
      get root_url
      expect(response).to have_http_status(:success)
    end

    it "renders index template" do
      get root_url
      expect(response).to assert_template(:index)
    end
  end
end

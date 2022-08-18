require "rails_helper"

RSpec.describe WithdrawsQuery, type: :query do
  let(:query) { described_class.call(relation: user, filters: filters) }
  let(:user) { create(:user) }

  context "without pagination" do
    before do
      create_list(:withdraw, 5)
      create_list(:withdraw, 5, user: user)
    end

    context "when filtering by balance" do
      let(:filters) { { balance: 120 } }
      let!(:expected_result) { [create(:withdraw, user: user, balance: 120)] }

      it "returns the expected records" do
        expect(query).to match_array(expected_result)
      end
    end

    context "when filtering by approved" do
      let(:filters) { { approved: true } }
      let!(:expected_result) { [create(:withdraw, user: user, approved: true)] }

      it "returns the expected records" do
        expect(query).to match_array(expected_result)
      end
    end
  end

  context "with pagination" do
    let(:counter) { 10 }

    before { create_list(:withdraw, counter, user: user) }

    context "when filtering by limit" do
      let(:filters) { { limit: 3 } }

      it "returns the expected records" do
        expect(query.count).to be == 3
      end
    end

    context "when filtering per page" do
      let(:filters) { { page: 2 } }

      it "returns the expected records" do
        expect(query.count).to be == counter
      end
    end
  end
end

require "rails_helper"

RSpec.describe TransactionsQuery, type: :query do
  let(:query) { described_class.call(relation: user, filters: filters) }
  let(:user) { create(:user) }

  context "without pagination" do
    before do
      create_list(:transaction, 5)
      create_list(:transaction, 5, user: user)
    end

    context "when filtering by code" do
      let(:filters) { { code: "test" } }
      let!(:expected_result) { [create(:transaction, user: user, code: "test")] }

      it "returns the expected records" do
        expect(query).to match_array(expected_result)
      end
    end

    context "when filtering by amount" do
      let(:filters) { { amount: 109 } }
      let!(:expected_result) { [create(:transaction, user: user, amount: 109)] }

      it "returns the expected records" do
        expect(query).to match_array(expected_result)
      end
    end

    context "when filtering by point_amount" do
      let(:filters) { { point_amount: 510 } }
      let!(:expected_result) { [create(:transaction, user: user, point_amount: 510)] }

      it "returns the expected records" do
        expect(query).to match_array(expected_result)
      end
    end

    context "when filtering by description" do
      let(:filters) { { description: "lorem ipsum" } }
      let!(:expected_result) { [create(:transaction, user: user, description: "lorem ipsum")] }

      it "returns the expected records" do
        expect(query).to match_array(expected_result)
      end
    end

    context "when filtering by reference" do
      let(:filters) { { reference: other_reference.id } }
      let(:other_reference) { create(:reference) }
      let!(:expected_result) { [create(:transaction, user: user, reference: other_reference)] }

      it "returns the expected records" do
        expect(query).to match_array(expected_result)
      end
    end

    context "when filtering by nothing" do
      let(:filters) { nil }
      let!(:expected_result) { user.transactions }

      it "returns the expected records" do
        expect(query).to match_array(expected_result)
      end
    end
  end

  context "with pagination" do
    let(:counter) { 10 }

    before { create_list(:transaction, counter, user: user) }

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

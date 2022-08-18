require "rails_helper"

RSpec.describe PurchasesQuery, type: :query do
  let(:query) { described_class.call(relation: user, filters: filters) }
  let(:user) { create(:user) }

  context "without pagination" do
    before do
      create_list(:purchase, 5)
      create_list(:purchase, 5, :pending, user: user)
    end

    context "when filtering by code" do
      let(:filters) { { code: "test" } }
      let!(:expected_result) { [create(:purchase, user: user, code: "test")] }

      it "returns the expected records" do
        expect(query).to match_array(expected_result)
      end
    end

    context "when filtering by status" do
      let(:filters) { { status: Purchase.statuses[:paid] } }
      let!(:expected_result) { [create(:purchase, user: user, status: Purchase.statuses[:paid])] }

      it "returns the expected records" do
        expect(query).to match_array(expected_result)
      end
    end

    context "when filtering by amount" do
      let(:filters) { { amount: 109 } }
      let!(:expected_result) { [create(:purchase, user: user, amount: 109)] }

      it "returns the expected records" do
        expect(query).to match_array(expected_result)
      end
    end

    context "when filtering by total" do
      let(:filters) { { total: 510 } }
      let!(:expected_result) { [create(:purchase, user: user, total: 510)] }

      it "returns the expected records" do
        expect(query).to match_array(expected_result)
      end
    end

    context "when filtering by description" do
      let(:filters) { { description: "lorem ipsum" } }
      let!(:expected_result) { [create(:purchase, user: user, description: "lorem ipsum")] }

      it "returns the expected records" do
        expect(query).to match_array(expected_result)
      end
    end

    context "when filtering by reference" do
      let(:filters) { { reference: other_reference.id } }
      let(:other_reference) { create(:reference) }
      let!(:expected_result) { [create(:purchase, user: user, reference: other_reference)] }

      it "returns the expected records" do
        expect(query).to match_array(expected_result)
      end
    end

    context "when filtering by nothing" do
      let(:filters) { nil }
      let!(:expected_result) { user.purchases }

      it "returns the expected records" do
        expect(query).to match_array(expected_result)
      end
    end
  end

  context "with pagination" do
    let(:counter) { 10 }

    before { create_list(:purchase, counter, user: user) }

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

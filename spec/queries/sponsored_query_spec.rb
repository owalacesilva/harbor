require "rails_helper"

RSpec.describe SponsoredQuery, type: :query do
  let(:query) { described_class.call(relation: sponsor, filters: filters) }
  let(:sponsor) { create(:user, :with_sponsored, sponsored_count: 5) }

  before { create_list(:user, 5) }

  context "when filtering by name" do
    let(:filters) { { name: 'Diogo' } }
    let!(:expected_result) do
      user = create(:user, sponsor: sponsor)
      create(:profile, user: user, first_name: 'Diogo')

      [user]
    end

    it "returns the expected records" do
      expect(query).to match_array(expected_result)
    end
  end
end

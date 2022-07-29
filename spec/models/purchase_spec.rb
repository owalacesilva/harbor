require 'rails_helper'

RSpec.describe Purchase, type: :model do
  context "when create an purchase" do
    subject(:purchase) { create(:purchase) }

    it "creates new purchase" do
      expect { purchase }.to change(described_class, :count).by(1)
    end
  end

  describe "associations" do
    subject { build(:purchase) }

    it { is_expected.to belong_to(:user) }
  end

  describe "validations" do
    subject { build(:purchase) }

    it { is_expected.to belong_to(:user).optional(false) }
    # it { is_expected.to validate_presence_of(:code) }
    # it { is_expected.to validate_uniqueness_of(:code) }
  end
end

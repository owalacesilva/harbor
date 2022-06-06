require 'rails_helper'

RSpec.describe Address, type: :model do
  context "when create an address" do
    subject(:address) { create(:address) }

    it "creates new address" do
      expect { address }.to change(described_class, :count).by(1)
    end
  end

  describe ".associations" do
    subject { build(:address) }

    it { is_expected.to belong_to(:user).class_name("User") }
  end

  pending ".validations"
end

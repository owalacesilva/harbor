require 'rails_helper'

RSpec.describe Withdraw, type: :model do
  context "when create an withdraw" do
    subject(:withdraw) { create(:withdraw) }

    it "creates new withdraw" do
      expect { withdraw }.to change(described_class, :count).by(1)
    end
  end

  describe ".associations" do
    subject { build(:withdraw) }

    it { is_expected.to belong_to(:user).class_name("User") }
    it { is_expected.to belong_to(:wallet).class_name("Wallet") }
  end

  describe ".validations" do
    subject { build(:withdraw) }

    it { is_expected.to belong_to(:user).optional(false) }
    it { is_expected.to belong_to(:wallet).optional(false) }
  end
end

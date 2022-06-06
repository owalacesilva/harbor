require 'rails_helper'

RSpec.describe Wallet, type: :model do
  context "when create an wallet" do
    subject(:wallet) { create(:wallet) }

    it "creates new wallet" do
      expect { wallet }.to change(described_class, :count).by(1)
    end
  end

  describe ".associations" do
    subject { build(:wallet) }

    it { is_expected.to belong_to(:user).class_name("User") }
  end

  describe ".validations" do
    subject { build(:wallet) }

    it { is_expected.to belong_to(:user).optional(false) }
  end
end

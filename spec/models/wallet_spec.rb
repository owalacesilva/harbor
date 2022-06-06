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

    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:reference) }
    it { is_expected.to have_many(:origin_transactions).inverse_of(:origin_wallet).class_name("Transaction") }
    it { is_expected.to have_many(:target_transactions).inverse_of(:target_wallet).class_name("Transaction") }
  end

  describe ".validations" do
    subject { build(:wallet) }

    it { is_expected.to belong_to(:user).optional(false) }
  end
end

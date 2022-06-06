require 'rails_helper'

RSpec.describe Transaction, type: :model do
  context "when create an transaction" do
    subject(:transaction) { create(:transaction, code: "123456") }

    it "creates new transaction" do
      expect { transaction }.to change(described_class, :count).by(1)
    end
  end

  describe "associations" do
    subject { build(:transaction) }

    it { is_expected.to belong_to(:user).class_name("User") }
    it { is_expected.to belong_to(:origin_wallet).class_name("Wallet") }
    it { is_expected.to belong_to(:target_wallet).class_name("Wallet") }
    it { is_expected.to belong_to(:reference).class_name("Reference") }
    it { is_expected.to belong_to(:withdraw).class_name("Withdraw").required(false) }
  end

  describe "validations" do
    subject { build(:transaction) }

    it { is_expected.to belong_to(:user).optional(false) }
    it { is_expected.to belong_to(:origin_wallet).optional(false) }
    it { is_expected.to belong_to(:target_wallet).optional(false) }
    it { is_expected.to belong_to(:reference).optional(false) }
    it { is_expected.to belong_to(:withdraw).optional }
    it { is_expected.to validate_presence_of(:code) }
    # it { is_expected.to validate_uniqueness_of(:code) }
  end
end

require 'rails_helper'

RSpec.describe BankingAccount, type: :model do
  context "when create an banking_:banking_account" do
    subject(:banking_account) { create(:banking_account) }

    it "creates new banking_:banking_account" do
      expect { banking_account }.to change(described_class, :count).by(1)
    end
  end

  describe ".associations" do
    subject { build(:banking_account) }

    it { is_expected.to belong_to(:user).class_name("User") }
  end

  describe ".validations" do
    subject { build(:banking_account) }

    it { is_expected.to belong_to(:user).optional(false) }
  end
end

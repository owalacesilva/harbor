require "rails_helper"

RSpec.describe User, type: :model do
  context "when create an user" do
    subject(:user) { create(:user) }

    it "creates new user" do
      expect { user }.to change(described_class, :count).by(1)
    end
  end

  describe "associations" do
    subject { build(:user) }

    it { is_expected.to belong_to(:profile) }
    it { is_expected.to have_many(:addresses).dependent(:destroy) }
    it { is_expected.to have_many(:banking_accounts).dependent(:destroy) }
    it { is_expected.to have_many(:wallets).dependent(:destroy) }
    it { is_expected.to have_many(:withdraws).dependent(:destroy) }
  end

  describe "validations" do
    subject { build(:user) }

    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
  end
end

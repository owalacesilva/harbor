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

    it { is_expected.to belong_to(:sponsor).optional(true) }
    it { is_expected.to have_one(:profile).dependent(:destroy) }
    it { is_expected.to have_one(:address).dependent(:destroy) }
    it { is_expected.to have_one(:wallet).dependent(:destroy) }
    it { is_expected.to have_one(:banking_account).dependent(:destroy) }
    it { is_expected.to have_many(:sponsored).dependent(:nullify) }
    it { is_expected.to have_many(:documents).dependent(:destroy) }
    it { is_expected.to have_many(:withdraws).dependent(:destroy) }
    it { is_expected.to have_many(:purchases).dependent(:destroy) }
    it { is_expected.to have_many(:transactions).dependent(:destroy) }
  end

  describe "validations" do
    subject { build(:user) }

    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
  end
end

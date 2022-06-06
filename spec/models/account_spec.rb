require "rails_helper"

RSpec.describe Account, type: :model do
  context "when create an account" do
    subject(:account) { create(:account) }

    it "creates new account" do
      expect { account }.to change(described_class, :count).by(1)
    end
  end

  describe ".associations" do
    subject { build(:account) }

    it { is_expected.to belong_to(:role).class_name("Role") }
    it { is_expected.to belong_to(:profile).class_name("Profile") }
  end

  describe ".validations" do
    subject { build(:account) }

    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
  end

  describe ".profilable" do
    subject(:account) { create(:account, profile: profile) }

    let(:profile) { create(:profile) }

    context "when call .full_name method" do
      it "returns correct value" do
        expect(account.full_name).to eq("#{profile.first_name}\s#{profile.last_name}")
      end
    end
  end
end

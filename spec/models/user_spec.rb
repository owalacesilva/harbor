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

    it { is_expected.to belong_to(:profile).class_name("Profile") }
  end

  describe "validations" do
    subject { build(:user) }

    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
  end
end

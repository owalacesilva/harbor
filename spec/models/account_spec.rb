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
  end

  describe ".validations" do
    subject { build(:account) }

    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
  end
end

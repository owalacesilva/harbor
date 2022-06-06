require "rails_helper"

RSpec.describe Role, type: :model do
  context "when create an role" do
    subject(:role) { create(:role) }

    it "creates new role" do
      expect { role }.to change(described_class, :count).by(1)
    end
  end

  describe "associations" do
    subject { build(:role) }

    it { is_expected.to have_many(:accounts).class_name("Account") }
  end

  describe "validations" do
    subject { build(:role) }

    it { is_expected.to validate_presence_of(:unique_name) }
    it { is_expected.to validate_presence_of(:display_name) }
    it { is_expected.to validate_uniqueness_of(:unique_name) }
  end
end

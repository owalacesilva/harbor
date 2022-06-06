require "rails_helper"

RSpec.describe Profile, type: :model do
  context "when create an profile" do
    subject(:profile) { create(:profile) }

    it "creates new profile" do
      expect { profile }.to change(described_class, :count).by(1)
    end
  end

  describe "associations" do
    subject { build(:profile) }

    it { is_expected.to have_one(:account).dependent(:destroy) }
    it { is_expected.to have_one(:user).dependent(:destroy) }
  end

  describe "validations" do
    subject { build(:profile) }

    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:gender) }
    # it { is_expected.to validate_inclusion_of(:gender).in_array(["undefined", "male", "female"]) }
  end
end

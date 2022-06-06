require 'rails_helper'

RSpec.describe Reference, type: :model do
  context "when create an reference" do
    subject(:reference) { create(:reference) }

    it "creates new reference" do
      expect { reference }.to change(described_class, :count).by(1)
    end
  end

  describe ".associations" do
    subject { build(:reference) }

    it { is_expected.to have_many(:wallets).dependent(:destroy) }
    it { is_expected.to have_many(:transactions).dependent(:destroy) }
  end

  describe ".validations" do
    subject { build(:reference) }

    it { is_expected.to validate_presence_of(:unique_name) }
    it { is_expected.to validate_presence_of(:display_name) }
    it { is_expected.to validate_uniqueness_of(:unique_name) }
  end
end

require 'rails_helper'

RSpec.describe Graduation, type: :model do
  context "when create an graduation" do
    subject(:graduation) { create(:graduation) }

    it "creates new graduation" do
      expect { graduation }.to change(described_class, :count).by(1)
    end
  end

  describe ".validations" do
    subject { build(:graduation) }

    it { is_expected.to validate_uniqueness_of(:unique_name) }
    it { is_expected.to validate_presence_of(:unique_name) }
    it { is_expected.to validate_presence_of(:display_name) }
  end
end

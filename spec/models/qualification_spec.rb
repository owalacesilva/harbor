require 'rails_helper'

RSpec.describe Qualification, type: :model do
  context "when create an qualification" do
    subject(:qualification) { create(:qualification) }

    it "creates new qualification" do
      expect { qualification }.to change(described_class, :count).by(1)
    end
  end

  describe ".validations" do
    subject { build(:qualification) }

    it { is_expected.to validate_uniqueness_of(:unique_name) }
    it { is_expected.to validate_presence_of(:unique_name) }
    it { is_expected.to validate_presence_of(:display_name) }
  end
end

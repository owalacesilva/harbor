require 'rails_helper'

RSpec.describe UserQualification, type: :model do
  context 'when create an user qualification' do
    subject(:user_qualification) { create(:user_qualification) }

    it "creates new user qualification" do
      expect { user_qualification }.to change(described_class, :count).by(1)
    end
  end

  describe '.associations' do
    subject { build(:user_qualification) }

    it { is_expected.to belong_to(:user).required(true) }
    it { is_expected.to belong_to(:qualification).required(true) }
  end
end

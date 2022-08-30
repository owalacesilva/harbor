require 'rails_helper'

RSpec.describe UserPoint, type: :model do
  context 'when create an user point' do
    subject(:user_point) { create(:user_point) }

    it "creates new user_point" do
      expect { user_point }.to change(described_class, :count).by(1)
    end
  end

  describe '.associations' do
    subject { build(:user_point) }

    it { is_expected.to belong_to(:user).required(true) }
    it { is_expected.to belong_to(:reference).required(true) }
  end

  describe '.validations' do
    subject { build(:user_point) }

    it { is_expected.to validate_presence_of(:amount) }
  end
end

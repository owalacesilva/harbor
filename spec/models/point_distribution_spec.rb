require 'rails_helper'

RSpec.describe PointDistribution, type: :model do
  context 'when create an user point_distribution' do
    subject(:point_distribution) { create(:point_distribution) }

    it "creates new point_distribution" do
      expect { point_distribution }.to change(described_class, :count).by(1)
    end
  end

  describe '.associations' do
    subject { build(:point_distribution) }

    it { is_expected.to belong_to(:user).required(true) }
    it { is_expected.to belong_to(:reference).required(true) }
    it { is_expected.to belong_to(:purchase).required(true) }
    it { is_expected.to belong_to(:user_point_record).required(true) }
  end

  describe '.validations' do
    subject { build(:point_distribution) }

    it { is_expected.to validate_presence_of(:base_value) }
  end
end

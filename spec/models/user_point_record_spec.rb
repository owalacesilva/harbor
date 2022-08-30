require 'rails_helper'

RSpec.describe UserPointRecord, type: :model do
  context 'when create an user point record' do
    subject(:user_point_record) { create(:user_point_record) }

    it "creates new user_point_record" do
      expect { user_point_record }.to change(described_class, :count).by(1)
    end
  end

  describe '.associations' do
    subject { build(:user_point_record) }

    it { is_expected.to belong_to(:user).required(true) }
    it { is_expected.to belong_to(:origin_user).class_name('User').required(true) }
    it { is_expected.to belong_to(:reference).required(true) }
  end

  describe '.validations' do
    subject { build(:user_point_record) }

    it { is_expected.to validate_presence_of(:record_date) }
    it { is_expected.to validate_presence_of(:base_value) }
    it { is_expected.to validate_presence_of(:amount) }
  end
end

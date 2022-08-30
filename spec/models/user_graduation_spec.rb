require 'rails_helper'

RSpec.describe UserGraduation, type: :model do
  context 'when create an user graduation' do
    subject(:user_graduation) { create(:user_graduation) }

    it "creates new user_graduation" do
      expect { user_graduation }.to change(described_class, :count).by(1)
    end
  end

  describe '.associations' do
    subject { build(:user_graduation) }

    it { is_expected.to belong_to(:user).required(true) }
    it { is_expected.to belong_to(:graduation).required(true) }
  end
end

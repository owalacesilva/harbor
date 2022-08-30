require 'rails_helper'

RSpec.describe UserQueue, type: :model do
  context "when create an user_queue" do
    subject(:user_queue) { create(:user_queue) }

    it "creates new user_queue" do
      expect { user_queue }.to change(described_class, :count).by(1)
    end
  end

  describe "associations" do
    subject { build(:user_queue) }

    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:user_sponsor).class_name('User') }
  end

  describe "validations" do
    subject { build(:user_queue) }

    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:user_sponsor) }
    it { is_expected.to validate_presence_of(:side) }
  end
end

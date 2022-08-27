require 'rails_helper'

RSpec.describe Notification, type: :model do
  context "when create a notification" do
    subject(:notification) { create(:notification) }

    it "creates new notification" do
      expect { notification }.to change(described_class, :count).by(1)
    end
  end

  describe ".associations" do
    subject { build(:notification) }

    it { is_expected.to belong_to(:user).required(false) }
  end

  describe ".validations" do
    subject { build(:notification) }

    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:message) }
  end
end

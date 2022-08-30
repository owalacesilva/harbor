require 'rails_helper'

RSpec.describe Node, type: :model do
  context "when create an node" do
    subject(:node) { create(:node) }

    it "creates new node" do
      expect { node }.to change(described_class, :count).by(1)
    end
  end

  describe "associations" do
    subject { build(:node) }

    it { is_expected.to belong_to(:user).required(true) }
    it { is_expected.to belong_to(:sponsor_node).class_name('Node').required(false) }
    it { is_expected.to belong_to(:parent_node).class_name('Node').required(false) }
  end

  describe "validations" do
    subject { build(:node) }

    it { is_expected.to validate_presence_of(:lft) }
    it { is_expected.to validate_presence_of(:rgt) }
    it { is_expected.to validate_presence_of(:depth) }
    it { is_expected.to validate_presence_of(:points) }
  end
end

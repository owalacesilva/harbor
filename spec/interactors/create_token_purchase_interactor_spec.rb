# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CreateTokenPurchaseInteractor, type: :interactor do

  describe ".call" do
    context "when pass invalid user id" do

      subject(:interactor) { described_class.call(user_id: nil, amount: amount) }

      let(:amount) { 10.0 }

      it "returns failure" do
        expect(interactor).to be_failure
      end
    end

    context "when pass invalid amount" do

      subject(:interactor) { described_class.call(user_id: user.id, amount: amount) }

      let(:user) { create(:user) }
      let(:amount) { nil }

      it "returns failure" do
        expect(interactor).to be_failure
      end
    end

    context "when pass valid user id" do

      subject(:interactor) { described_class.call(user_id: user.id, amount: amount) }

      let(:user) { create(:user) }
      let(:amount) { 20.0 }

      it "returns success" do
        expect(interactor).to be_success
      end
    end
  end
end

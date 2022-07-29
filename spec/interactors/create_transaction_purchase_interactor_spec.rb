# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CreateTransactionPurchaseInteractor, type: :interactor do

  describe ".call" do
    context "when pass valid purchase" do

      subject(:interactor) { described_class.call(user: user, purchase: purchase) }

      let(:user) { create(:user) }
      let(:purchase) { build(:purchase, user: user) }

      it "returns success" do
        expect(interactor).to be_success
      end
    end
  end
end


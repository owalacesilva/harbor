# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CreateTransactionPaymentInteractor, type: :interactor do

  describe ".call" do
    context "when pass valid transaction" do

      subject(:interactor) { described_class.call(user: user, transaction: transaction) }

      let(:user) { create(:user) }
      let(:transaction) { create(:transaction, user: user) }

      it "returns success" do
        expect(interactor).to be_success
      end
    end
  end
end

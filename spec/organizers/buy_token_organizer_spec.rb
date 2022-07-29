# frozen_string_literal: true

require 'rails_helper'

describe BuyTokenOrganizer, type: :organizer do
  describe 'organize' do
    context 'when call organizer' do
      let(:interactors) do
        [
          CreateTokenPurchaseInteractor,
          CreateTransactionPurchaseInteractor,
        ]
      end

      it "returns interactors" do
        expect(described_class.organized).to eq interactors
      end
    end
  end
end

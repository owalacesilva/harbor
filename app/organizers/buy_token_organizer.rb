# frozen_string_literal: true

class BuyTokenOrganizer
  include Interactor::Organizer

  organize CreateTokenPurchaseInteractor,
           CreateTransactionPurchaseInteractor,
           CreateTransactionPaymentInteractor
end

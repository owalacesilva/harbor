# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

Role.create!(unique_name: :employee, display_name: "Funcionário")
ref_token = Reference.create!(unique_name: :token, display_name: "TOKEN", unit_price: 1.0)

unless Rails.env.production? || Rails.env.test?
  user_attrs = FactoryBot.attributes_for(:user, email: 'user@email.com', password: '123456')
  user = User.new(user_attrs)
  user.save!

  profile_attrs = FactoryBot.attributes_for(:profile)
  profile = user.build_profile(profile_attrs)
  profile.save!

  10.times do
    amount = rand(10..150)
    balance = rand(10..100)

    purchase = Purchase.new(user_id: user.id, amount: amount, total: amount * ref_token.unit_price,
                            reference: ref_token, status: 'pending')
    purchase.save!

    Transaction.create!({ purchase: purchase, user: user,
                          origin_wallet: user.wallet, target_wallet: user.wallet,
                          reference: ref_token, operation: Transaction.operations[:income],
                          amount: amount, point_amount: amount })

    user.wallet.update!(
      balance: user.wallet.balance + amount,
      incomes: user.wallet.incomes + amount,
    )

    Withdraw.create!({ user: user, wallet: user.wallet, balance: balance })
  end

  3.times do
    amount = rand(10..150)

    withdraw = Withdraw.create!({ user: user, wallet: user.wallet, balance: amount, approved: true })

    Transaction.create!({ withdraw: withdraw, user: user,
                          origin_wallet: user.wallet, target_wallet: user.wallet,
                          reference: ref_token, operation: Transaction.operations[:expense],
                          amount: amount, point_amount: amount })

    user.wallet.update!(
      balance: user.wallet.balance - amount,
      incomes: user.wallet.expenses + amount,
    )
  end
end

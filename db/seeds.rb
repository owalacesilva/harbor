# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

Role.create!(unique_name: :employee, display_name: "Funcionário")
ref_token = Reference.create!(unique_name: :token, display_name: "TOKEN", unit_price: 1.0)

unless Rails.env.production? || Rails.env.test?
  root_attrs = FactoryBot.attributes_for(:user, email: 'user@email.com', password: '123456')
  root = User.new(root_attrs)
  root.save!

  profile_attrs = FactoryBot.attributes_for(:profile)
  profile = root.build_profile(profile_attrs)
  profile.save!

  10.times do
    amount = rand(10..150)
    balance = rand(10..100)

    purchase = Purchase.new(user: root, amount: amount, total: amount * ref_token.unit_price,
                            reference: ref_token, status: 'pending')
    purchase.save!

    Transaction.create!({ purchase: purchase, user: root,
                          origin_wallet: root.wallet, target_wallet: root.wallet,
                          reference: ref_token, operation: Transaction.operations[:income],
                          amount: amount, point_amount: amount })

    root.wallet.update!(
      balance: root.wallet.balance + amount,
      incomes: root.wallet.incomes + amount,
    )

    Withdraw.create!({ user: root, wallet: root.wallet, balance: balance })
  end

  3.times do
    amount = rand(10..150)

    withdraw = Withdraw.create!({ user: root, wallet: root.wallet, balance: amount, approved: true })

    Transaction.create!({ withdraw: withdraw, user: root,
                          origin_wallet: root.wallet, target_wallet: root.wallet,
                          reference: ref_token, operation: Transaction.operations[:expense],
                          amount: amount, point_amount: amount })

    root.wallet.update!(
      balance: root.wallet.balance - amount,
      incomes: root.wallet.expenses + amount,
    )
  end

  10.times do
    user_attrs = FactoryBot.attributes_for(:user, sponsor: root)
    user = User.new(user_attrs)
    user.save!

    p_attrs = FactoryBot.attributes_for(:profile)
    p = user.build_profile(p_attrs)
    p.save!
  end

  5.times do
    Notification.create!(FactoryBot.attributes_for(:notification, user: root))
  end
end

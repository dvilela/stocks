# frozen_string_literal: true

require 'account'

describe Account, type: :model do
  it 'imports extract' do
    account = Account.new
    extract = double(:extract, transactions: Array(Purchase.new(:jake3, quantity: 1, price: 1.0)))

    account.import(extract)

    expect(account.positions.count).to eq(1)
    expect(account.positions[0]).to have_attributes(ticker: :jake3, medium_price: 1.0, quantity: 1)
  end
end

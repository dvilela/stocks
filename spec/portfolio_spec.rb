# frozen_string_literal: true

require 'portfolio'

describe Portfolio, type: :model do
  it 'calculates positions' do
    portfolio = Portfolio.new

    portfolio.trade Purchase.new(:luna4, quantity: 2, price: 1.0)
    portfolio.trade Purchase.new(:jake3, quantity: 1, price: 1.0)
    portfolio.trade Purchase.new(:jake3, quantity: 1, price: 3.0)

    positions = portfolio.positions
    expect(positions.count).to eq(2)
    expect(positions[0]).to have_attributes(ticker: :luna4, quantity: 2, medium_price: 1.0)
    expect(positions[1]).to have_attributes(ticker: :jake3, quantity: 2, medium_price: 2.0)
  end
end

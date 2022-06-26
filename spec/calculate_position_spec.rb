# frozen_string_literal: true

require 'calculate_position'

RSpec.describe CalculatePosition, '#call' do
  it 'creates a position' do
    trades = []
    trades << Purchase.new(ticker: :jake3, quantity: 1, price: 2.0)
    trades << Purchase.new(ticker: :jake3, quantity: 3, price: 3.0)

    trades << Purchase.new(ticker: :luna4, quantity: 1, price: 2.0)
    trades << Purchase.new(ticker: :luna4, quantity: 1, price: 2.0)

    positions = subject.call(trades)
    expect(positions.count).to eq(2)
    expect(positions[0]).to have_attributes(ticker: :jake3, quantity: 4, medium_price: 2.75)
    expect(positions[1]).to have_attributes(ticker: :luna4, quantity: 2, medium_price: 2.0)
  end
end

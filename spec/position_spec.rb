# frozen_string_literal: true

require 'purchase'
require 'position'

describe Position, type: :model do
  it 'has medium price' do
    luna4 = Position.new(:luna4)
    luna4.trade Purchase.new(:luna4, quantity: 2, price: 1.0)
    luna4.trade Purchase.new(:luna4, quantity: 1, price: 3.0)
    luna4.trade Purchase.new(:luna3, quantity: 100, price: 1.0)

    expect(luna4).to have_attributes(medium_price: (5.0 / 3).round(2), quantity: 3)
  end
end

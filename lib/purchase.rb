# frozen_string_literal: true

# Represents a Position
class Purchase
  attr_reader :ticker, :quantity, :price

  def initialize(ticker = nil, quantity: nil, price: nil)
    @ticker = ticker
    @quantity = quantity
    @price = price
  end
end

# frozen_string_literal: true

# Represents a current position
class Position
  attr_reader :ticker, :quantity, :medium_price

  def initialize(ticker, quantity, medium_price)
    @ticker = ticker
    @quantity = quantity
    @medium_price = medium_price
  end
end

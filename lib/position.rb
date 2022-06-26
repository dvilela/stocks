# frozen_string_literal: true

# Represents a current position
class Position
  attr_reader :ticker

  def initialize(ticker)
    @ticker = ticker
    @transactions = Array[]
  end

  def trade(transaction)
    return unless transaction.ticker == @ticker

    @transactions << transaction
  end

  def quantity
    @transactions.map(&:quantity).reduce(:+)
  end

  def medium_price
    (@transactions.map(&:value).reduce(&:+) / quantity).round(2)
  end

  def value
    (quantity * medium_price).round(2)
  end
end

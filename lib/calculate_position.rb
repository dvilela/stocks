# frozen_string_literal: true

# Given an array of trades, it calculates the positions
# with it's prices (medium price)
class CalculatePosition
  def call(trades)
    @positions_lookup = Hash[]

    trades.each do |trade|
      @positions_lookup[trade.ticker] ||= []
      @positions_lookup[trade.ticker] << trade
    end

    calculate_positions
  end

  private

  def calculate_positions
    @positions_lookup.map do |ticker, trades|
      quantity = trades.map(&:quantity).reduce(&:+)
      price = medium_price(trades, quantity)
      Position.new(ticker, quantity, price)
    end
  end

  def medium_price(trades, quantity)
    trades.map { |trade| trade.quantity * trade.price }.reduce(&:+) / quantity
  end
end

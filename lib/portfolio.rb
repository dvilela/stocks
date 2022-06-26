# frozen_string_literal: true

# Represents a portfolio
class Portfolio
  def initialize(positions: nil)
    @positions = positions || Positions.new
  end

  def positions
    @positions.all
  end

  def trade(transaction)
    @positions.trade(transaction)
  end

  # Positions Repository Helper
  class Positions
    def initialize
      @positions = Hash[]
    end

    def trade(transaction)
      position = find_position_by_ticker(transaction.ticker)
      position.trade(transaction)
    end

    def all
      @positions.values
    end

    private

    def find_position_by_ticker(ticker)
      @positions[ticker] ||= Position.new(ticker)
    end
  end
end

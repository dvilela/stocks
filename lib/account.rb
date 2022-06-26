# frozen_string_literal: true

# Account
class Account
  attr_reader :portfolio

  def initialize
    @portfolio = Portfolio.new
  end

  def positions
    portfolio.positions
  end

  def import(extract)
    extract.transactions.each do |transaction|
      portfolio.trade(transaction)
    end
  end
end

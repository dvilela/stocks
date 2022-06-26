# frozen_string_literal: true
require 'rubyXL'

require_relative '../lib/account'
require_relative '../lib/portfolio'
require_relative '../lib/position'
require_relative '../lib/purchase'

extract_dir = ARGV.first

files = Dir["#{extract_dir}/*.xlsx"]

class B3
  def initialize(file)
    @file = file
  end

  def transactions
    @transactions = []
    worksheet = RubyXL::Parser.parse(@file)[0]
    worksheet.each_with_index do |row, index|
      next if index == 0

      date, type, market, due_date, broker, ticker, quantity, price, value = row.cells.map(&:value)
      model_class = { "Compra" => Purchase }[type]

      next unless model_class

      _ticker = ticker[-1].to_s == 'F' ? ticker.chop : ticker
      @transactions << model_class.new(_ticker, quantity: quantity, price: price)
    end
    @transactions
  end
end

account = Account.new

files.each do |file|
  account.import(B3.new(file)) if file.split('/').last.start_with? 'b3-'
end

puts "ticker, quantity, price, value"
positions = []
account.positions.each do |position|
  positions << position
end

positions.sort_by! { |position| position.ticker }
positions.each do |position|
  puts [position.ticker, position.quantity, position.medium_price.round(2), position.value.round(2)].join(', ')
end

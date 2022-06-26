# frozen_string_literal: true

require 'position'

describe Position, type: :model do
  subject { described_class.new(:jake3, 1, 2.0) }

  it { is_expected.to have_attributes(ticker: :jake3, quantity: 1, medium_price: 2.0) }
end

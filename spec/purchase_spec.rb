# frozen_string_literal: true

require 'purchase'

describe Purchase, type: :model do
  it { is_expected.to have_attributes(ticker: nil, quantity: nil, price: nil) }

  it 'has price, quantity and ticker' do
    attributes = { price: 3.0, quantity: 2 }
    purchase = Purchase.new('JAKE3', **attributes)
    expect(purchase).to have_attributes(attributes)
  end
end

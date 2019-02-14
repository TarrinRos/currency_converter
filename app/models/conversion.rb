class Conversion < ApplicationRecord
  belongs_to :from_currency, class_name: 'Currency'
  belongs_to :to_currency, class_name: 'Currency'

  # Validates 'amount' to be an integer and > 0
  validates :amount, numericality: {greater_than: 0}

  before_save :set_currency_prices

  def amount_gained
    from_currency_price_in_usd * amount / to_currency_price_in_usd
  end

  private

  def set_currency_prices
    self.from_currency_price_in_usd = from_currency.price_in_usd
    self.to_currency_price_in_usd = to_currency.price_in_usd
  end
end

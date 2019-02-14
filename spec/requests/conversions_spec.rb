require 'rails_helper'

RSpec.describe "Conversions", type: :request do
  describe "POST /conversions" do
    before do
      @btc = Currency.create!(name: 'Bitcoin', symbol: 'BTC', price_in_usd: '3250.20')
      @eth = Currency.create!(name: 'Etherium', symbol: 'ETH', price_in_usd: '350.12')
    end

    it "creates conversion" do
      post conversions_url, params: {
        from_currency_symbol: 'BTC',
          to_currency_symbol: 'ETH',
          amount: '1'
      }

      conversion = Conversion.where(from_currency: @btc, to_currency: @eth).first

      expect(conversion.amount.to_s).to eq '1.0'
      expect(conversion.from_currency_price_in_usd.to_s).to eq '3250.2'
      expect(conversion.to_currency_price_in_usd.to_s).to eq '350.12'

      expect(response).to have_http_status(200)

      json = JSON.parse(response.body)

      expect(json['amount_gained']).to eq '9.28310294'
    end
  end
end

require 'rails_helper'

RSpec.describe "Currencies", type: :request do
  describe "GET /currencies" do
    before do
      currency_1 = Currency.create!(name: 'Bitcoin', symbol: 'BTC', price_in_usd: '3250.20')
      currency_2 = Currency.create!(name: 'Etherium', symbol: 'ETH', price_in_usd: '350.12')
    end


    it "returns an array of symbols of cryptocurrencies" do
      get currencies_path
      expect(response).to have_http_status(200)

      json = JSON.parse(response.body)

      expect(json).to match_array(['BTC', 'ETH'])
    end
  end
end

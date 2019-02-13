require 'rails_helper'

describe CoinMarketCapService do
  it 'saves cryptocurrencies' do
    VCR.use_cassette("coin_market_cap/list_all_twice") do
      expect { CoinMarketCapService.call }.to change { Currency.count }.by(100)

      # After loading currencies
      expect { CoinMarketCapService.call }.to change { Currency.count }.by(0)

      btc = Currency.where(symbol: 'BTC', name: 'Bitcoin').first

      expect(btc.price_in_usd.to_s).to eq '3623.47'
    end
  end
end
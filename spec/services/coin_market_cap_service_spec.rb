require 'rails_helper'

describe CoinMarketCapService do
  it 'saves cryptocurrencies' do
    expect { CoinMarketCapService.call }.to change { Currency.count }.by(100)
  end
end
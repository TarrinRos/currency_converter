# Class for parsing coinmarketcap for currencies

class CoinMarketCapService
  class RequestError < RuntimeError; end

  LATEST_URL = 'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest'.freeze

  def self.call
    response = HTTParty.get(
      LATEST_URL,
      headers: {"X-CMC_PRO_API_KEY" => Rails.application.credentials[:coinmarketcap][:api_key]}
    )

    raise RequestError("Response status was #{response.code}") if response.code != 200

    data = JSON.parse(response.body)['data']

    data.each do |currency_data|
      # Initializes object without save if not exists in DB
      c = Currency.where(symbol: currency_data['symbol']).first_or_initialize

      c.name = currency_data['name']
      c.price_in_usd = currency_data['quote']['USD']['price']

      c.save!
    end
  end
end

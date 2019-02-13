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

    JSON.parse(response.body)
  end
end

class CurrenciesController < ApplicationController
  def index
    render json: Currency.pluck(:symbol)
  end
end

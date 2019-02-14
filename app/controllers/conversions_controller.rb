class ConversionsController < ApplicationController
  def create
    from_currency = Currency.find_by!(symbol: params[:from_currency_symbol])
    to_currency = Currency.find_by!(symbol: params[:to_currency_symbol])

    conversion = Conversion.new(
      from_currency: from_currency,
      to_currency: to_currency,
      amount: params[:amount]
    )

    if conversion.save
      render json: conversion
    else
      render json: {error: conversion.errors}, status: :unprocessable_entity
    end
  end
end

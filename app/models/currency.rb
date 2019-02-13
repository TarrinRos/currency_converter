class Currency < ApplicationRecord
  validates :symbol, uniqueness: true
end

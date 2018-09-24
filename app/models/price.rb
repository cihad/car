class Price < ApplicationRecord
  CURRENCIES = ["TRY", "USD", "EUR"]
  belongs_to :model
end

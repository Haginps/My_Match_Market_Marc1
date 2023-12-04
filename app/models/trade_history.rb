class TradeHistory < ApplicationRecord
  belongs_to :user
  belongs_to :holding
end

class Holding < ApplicationRecord
  belongs_to :user
  belongs_to :investment

  has_many :trade_histories
end

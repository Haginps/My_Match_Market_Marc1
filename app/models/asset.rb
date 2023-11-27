class Asset < ApplicationRecord
  has_many :histories
  has_many :holdings
end

class Player < ApplicationRecord
  belongs_to :investment

  # include PgSearch::Model
  # pg_search_scope :global_search,
  # against: [ :name],
  # using: {
  #   tsearch: { prefix: true }
  # }
end

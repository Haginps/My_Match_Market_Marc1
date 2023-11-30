class Channel < ApplicationRecord
  belongs_to :user
  has_many :posts
  has_one_attached :photo

  validates :title, :description, :photo, presence: true

end

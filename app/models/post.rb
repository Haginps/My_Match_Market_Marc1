class Post < ApplicationRecord
  belongs_to :channel
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :photo

  validates :title, presence: true
  validates :description, presence: true
end

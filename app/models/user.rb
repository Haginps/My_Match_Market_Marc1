class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  before_create :set_default_tokens

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :holdings
  has_many :investments, through: :holdings
  has_many :channels
  has_many :posts
  has_many :comments

  private

  def set_default_tokens
    self.tokens ||= 5000  # Set tokens to 5000 if not already set
  end
end

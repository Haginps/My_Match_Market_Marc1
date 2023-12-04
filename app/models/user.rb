class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  after_create :set_default_tokens

  has_many :comments





  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :holdings
  has_many :investments, through: :holdings
  has_many :channels
  has_many :posts
  has_many :comments
  has_many :token_histories
  has_many :user_histories
  has_many :trade_histories


  def portfolio_24hr_change
    yesterday_total_token = 0
    today_total_token = 0

    self.holdings.each do |holding|
      today_total_token += holding.investment.histories.last.price * holding.shares_amount
      yesterday_total_token += holding.investment.histories[holding.investment.histories.length - 2].price * holding.shares_amount

      total_investment_change = today_total_token - yesterday_total_token
      total_investment_change_percentage = (total_investment_change / yesterday_total_token) * 100

      if self.holdings.count == 0
        return [0, 0]
      else
        return total_investment_change = today_total_token - yesterday_total_token
        total_investment_change_percentage = (total_investment_change / yesterday_total_token) * 100
        [total_investment_change, total_investment_change_percentage]

      end
    end
  end

  private

  def set_default_tokens
    self.tokens ||= 5000  # Set tokens to 5000 if not already set
    self.save
    TokenHistory.create(user: self, date: Date.today, total_token: self.tokens)
  end
end

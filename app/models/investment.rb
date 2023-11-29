class Investment < ApplicationRecord
  has_many :histories
  has_many :holdings
  has_one :player

  def calculate_24hr_change
    today_history = histories.find_by(date: Date.today)
    yesterday_history = histories.find_by(date: Date.yesterday)

    if today_history && yesterday_history && yesterday_history.price != 0
      price_today = today_history.price
      price_yesterday = yesterday_history.price
      self.previousdaypercentchange = ((price_today - price_yesterday) / price_yesterday) * 100
    else
      self.previousdaypercentchange = 0
    end
  end
end

class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @investments = Investment.all.sample(3)
  end

  def dashboard
    @today_token = current_user.token_histories.find_by(date: Date.today)
    @yesterday_token = current_user.token_histories.find_by(date: Date.yesterday)

    if @today_token_history && @yesterday_token_history
      @token_change = @today_token_history.total_token - @yesterday_token_history.total_token
    else
      @token_change = 0
    end

    @today_tokens = current_user.user_histories.find_by(date: Date.today).tokens.round(2)
    @today_performance = current_user.user_histories.find_by(date: Date.today).performance.round(2)

    @account_percentage_change = ((((@today_performance + @today_tokens) / 5000) * 100) - 100).round(2)

    @price_increase = (5000 * (@account_percentage_change / 100)).round(2)
  end
end

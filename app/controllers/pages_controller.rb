class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @today_token = current_user.token_histories.find_by(date: Date.today)
    @yesterday_token = current_user.token_histories.find_by(date: Date.yesterday)

    if @today_token_history && @yesterday_token_history
      @token_change = @today_token_history.total_token - @yesterday_token_history.total_token
    else
      @token_change = 0 # Default value if one of the records is missing
    end

    @today_tokens = current_user.user_histories.find_by(date: Date.today).tokens.round(2)
    @today_performance = current_user.user_histories.find_by(date: Date.today).performance.round(2)
  end

  # if @yesterday_token_history && @yesterday_token_history.total_token > 0
  #   @percentage_change = (@token_change / @yesterday_token_history.total_token) * 100
  # else
  #   @percentage_change = 0
  # end

  # # Example of preparing other data for the dashboard view
  # @recent_transactions = current_user.transactions.last(5)
end

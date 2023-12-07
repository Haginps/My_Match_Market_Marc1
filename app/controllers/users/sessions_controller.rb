# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    super

    current_user.user_histories.destroy_all

    tokens = 5000

    if current_user.holdings.count == 0
      UserHistory.create(user: current_user, date: Date.yesterday, performance: 0, tokens: tokens)
      UserHistory.create(user: current_user, date: Date.today, performance: 0, tokens: tokens)
    else
      user_first_purchased_on = current_user.holdings.all.order(purchased_date: :ASC).first.purchased_date
      dates = (user_first_purchased_on..Date.today)

      dates.each do |date|
        performance = 0

        # EOD balance for all investments
        current_user.holdings.each do |holding|
          if holding.purchased_date <= date
            holding.trade_histories.each do |history|
              investment_price = holding.investment.histories.find_by(date: date).price
              performance += history.shares_amount * investment_price
            end
          end

          # Only update the tokens when there is a purchase
          if holding.purchased_date == date
            holding.trade_histories.each do |history|
              investment_price = holding.investment.histories.find_by(date: date).price
              tokens -= history.shares_amount * investment_price
            end
          end
        end

        UserHistory.create(user: current_user, date: date, performance: performance, tokens: tokens)
      end
    end

  end
end

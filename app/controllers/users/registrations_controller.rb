# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    super

    # current_user.user_histories.destroy_all

    # user_first_purchased_on = current_user.holdings.all.order(purchased_date: :ASC).first.purchased_date
    dates = (Date.yesterday..Date.today)

    tokens = 5000

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

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end

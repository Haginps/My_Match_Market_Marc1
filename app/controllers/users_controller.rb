class UsersController < ApplicationController
#   def dashboard
#   end
# #   before_action :find_user, only: %i[show buy sell]

  def show
    @user = current_user
    @holdings_labels = @user.holdings.map { |holding| holding.purchased_date.strftime('%Y-%m-%d') }
    @holdings_prices = @user.holdings.map(&:purchased_price)
  end
end

class HoldingsController < ApplicationController
  def create
    @investment = Investment.find(params[:investment_id])
    @holding = Holding.new(holding_params)

    @holding.user = current_user
    @holding.investment = @investment
    @holding.save
  end

  private

  def holding_params
    params.require(:holding).permit(:trade, :shares_amount, :purchased_price)
  end
end

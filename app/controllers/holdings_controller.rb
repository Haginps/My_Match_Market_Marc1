class HoldingsController < ApplicationController
  def create
    @investment = Investment.find(params[:investment_id])
    @holding = Holding.new(buy_holding_params)

    @holding.user = current_user
    @holding.investment = @investment
    @holding.purchased_price = @investment.histories.last.price
    @holding.purchased_date = Date.today

    @holding.save

    current_user.balance -= @holding.purchased_price * @holding.shares_amount
  end

  def update
    @investment = Investment.find(params[:investment_id])
    @holding = Holding.find(params[:id])
    @holding.update(sell_holding_params)
    @holding.sold_price = @investment.histories.last.price
    @holding.sold_date = Date.today
    @holding.gain_loss = (@holding.sold_price - @holding.purchased_price) * @holding.shares_amount
    @holding.save
  end

  private

  def buy_holding_params
    params.require(:holding).permit(:trade, :shares_amount)
  end

  def sell_holding_params
    params.require(:holding).permit(:trade, :shares_amount)
  end
end

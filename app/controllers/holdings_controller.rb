class HoldingsController < ApplicationController
  def create
    @investment = Investment.find(params[:investment_id])
    @holding = Holding.new(buy_holding_params)

    @holding.user = current_user
    @holding.investment = @investment
    @holding.purchased_price = @investment.histories.last.price
    @holding.purchased_date = Date.today

    @holding.save

    current_user.tokens -= @holding.purchased_price * @holding.shares_amount
    current_user.save

    redirect_to investment_path(@investment)

    # total_cost = @holding.purchased_price * @holding.shares_amount

    # if current_user.balance >= total_cost
    #   if @holding.save
    #     current_user.update(balance: current_user.balance - total_cost)
    #     flash[:notice] = "Purchase successful! You have bought #{@holding.shares_amount} shares."
    #     # redirect_to some_path # Replace with appropriate path
    #   else
    #     flash[:alert] = "Purchase failed. Please try again."
    #     render :new # Or wherever you want to redirect in case of failure
    #   end
    # else
    #   flash[:alert] = "Insufficient balance to complete the purchase."
    #   # redirect_to another_path # Replace with appropriate path
    # end
  end

  def update
    @investment = Investment.find(params[:investment_id])
    @holding = Holding.find(params[:id])
    @holding.update(sell_holding_params)
    @holding.sold_price = @investment.histories.last.price
    @holding.sold_date = Date.today
    @holding.gain_loss = (@holding.sold_price - @holding.purchased_price) * @holding.shares_amount
    @holding.save

    # if @holding.save
    #   current_user.update(balance: current_user.balance + @holding.gain_loss)
    #   flash[:notice] = "Sale successful! You have sold #{@holding.shares_amount} shares."
    #   # redirect_to some_path # Replace with appropriate path
    # else
    #   flash[:alert] = "Sale failed. Please try again."
    #   render :edit # Or wherever you want to redirect in case of failure
    # end
  end

  private

  def buy_holding_params
    params.require(:holding).permit(:trade, :shares_amount)
  end

  def sell_holding_params
    params.require(:holding).permit(:trade, :shares_amount)
  end
end

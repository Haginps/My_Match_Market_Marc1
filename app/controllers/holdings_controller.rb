class HoldingsController < ApplicationController
  def create
    @investment = Investment.find(params[:investment_id])
    @holding = Holding.new(first_purchased_params)

    @holding.user = current_user
    @holding.investment = @investment
    @holding.purchased_price = @investment.histories.last.price
    @holding.purchased_date = Date.today

    @holding.save

    current_user.tokens -= @holding.purchased_price * @holding.shares_amount
    current_user.save

    user_today_token_history = current_user.token_histories.find_by(date: @holding.purchased_date)
    user_today_token_history.total_token = current_user.tokens
    user_today_token_history.save

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

    # raise
    new_shares_amount = params[:holding][:shares_amount].to_i

    old_purchased_price = @holding.purchased_price
    old_shares_amount = @holding.shares_amount
    old_purchased_total_price = old_shares_amount * old_purchased_price

    if params[:holding][:trade] == 'buy'
      new_shares_amount = params[:holding][:shares_amount].to_i
      new_purchased_price = @investment.histories.last.price
      new_purchased_total_price = new_shares_amount * new_purchased_price

      final_purchased_total_price = old_purchased_total_price + new_purchased_total_price
      final_shares_amount = old_shares_amount + new_shares_amount
      final_purchased_price = final_purchased_total_price / final_shares_amount

      @holding.shares_amount = final_shares_amount
      @holding.purchased_price = final_purchased_price
      @holding.purchased_date = Date.today
      # @holding.gain_loss = (@holding.sold_price - @holding.purchased_price) * @holding.shares_amount
      @holding.save

      current_user.tokens -= new_purchased_price * new_shares_amount

      user_today_token_history = current_user.token_histories.find_by(date: @holding.purchased_date)
      user_today_token_history.total_token = current_user.tokens
      user_today_token_history.save
    else
      new_sold_price = @investment.histories.last.price
      new_sold_total_price = new_shares_amount * new_sold_price

      # Selling all the shares
      if new_shares_amount == old_shares_amount
        @holding.sold_price = @investment.histories.last.price
        @holding.sold_date = Date.today
        @holding.gain_loss = (@holding.sold_price - @holding.purchased_price) * @holding.shares_amount
        @holding.save

        current_user.tokens += @holding.sold_price * @holding.shares_amount

        user_today_token_history = current_user.token_histories.find_by(date: @holding.sold_date)
        user_today_token_history.total_token = current_user.tokens
        user_today_token_history.save
      else # Selling some the shares
        final_purchased_total_price = old_purchased_total_price - new_sold_total_price
        final_shares_amount = old_shares_amount - new_shares_amount
        final_purchased_price = final_purchased_total_price / final_shares_amount

        @holding.shares_amount = final_shares_amount
        @holding.purchased_price = final_purchased_price
        @holding.purchased_date = Date.today
        # @holding.gain_loss = (@holding.sold_price - @holding.purchased_price) * @holding.shares_amount
        @holding.save

        user_today_token_history = current_user.token_histories.find_by(date: @holding.purchased_date)
        user_today_token_history.total_token = current_user.tokens
        user_today_token_history.save
      end
    end

    current_user.save

    redirect_to investment_path(@investment)

    # raise

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

  def first_purchased_params
    params.require(:holding).permit(:trade, :shares_amount)
  end

  def second_trade_params
    params.require(:holding).permit(:trade, :shares_amount)
  end
end

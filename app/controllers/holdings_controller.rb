class HoldingsController < ApplicationController
  def create
    @investment = Investment.find(params[:investment_id])
    @holding = Holding.new(first_purchased_params)

    @holding.user = current_user
    @holding.investment = @investment
    @holding.purchased_price = @investment.histories.last.price
    @holding.purchased_date = Date.today

    @holding.save

    @trade_history = TradeHistory.create(user: current_user, holding: @holding, date: Date.today, shares_amount: @holding.shares_amount)

    user_history = UserHistory.find_by(user: current_user, date: Date.today)
    user_history.performance += @holding.purchased_price * @holding.shares_amount
    user_history.tokens -= @holding.purchased_price * @holding.shares_amount
    user_history.save

    redirect_to investment_path(@investment)
  end

  def update
    @investment = Investment.find(params[:investment_id])
    @holding = Holding.find(params[:id])

    new_shares_amount = params[:holding][:shares_amount].to_i
    # trade_history_shares_amount = params[:holding][:shares_amount].to_i

    if params[:holding][:trade] == 'buy'
      trade_history_shares_amount = params[:holding][:shares_amount].to_i
    else
      trade_history_shares_amount = params[:holding][:shares_amount].to_i * -1
    end

    # raise

    @trade_history = TradeHistory.create(user: current_user, holding: @holding, date: Date.today, shares_amount: trade_history_shares_amount)

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
      @holding.save

      user_history = UserHistory.find_by(user: current_user, date: Date.today)
      user_history.performance += @investment.histories.last.price * @trade_history.shares_amount
      user_history.tokens -= @investment.histories.last.price * @trade_history.shares_amount
      user_history.save
    else
      new_sold_price = @investment.histories.last.price
      new_sold_total_price = new_shares_amount * new_sold_price

      # Selling all the shares
      if new_shares_amount == old_shares_amount
        @holding.sold_price = @investment.histories.last.price
        @holding.sold_date = Date.today
        @holding.gain_loss = (@holding.sold_price - @holding.purchased_price) * @holding.shares_amount
        @holding.save

        user_history = UserHistory.find_by(user: current_user, date: Date.today)
        user_history.performance += @investment.histories.last.price * @trade_history.shares_amount
        user_history.tokens -= @investment.histories.last.price * @trade_history.shares_amount
        user_history.save

      else
        # Selling some the shares
        final_purchased_total_price = old_purchased_total_price - new_sold_total_price
        final_shares_amount = old_shares_amount - new_shares_amount
        final_purchased_price = final_purchased_total_price / final_shares_amount

        @holding.shares_amount = final_shares_amount
        @holding.purchased_price = final_purchased_price
        @holding.save

        user_history = UserHistory.find_by(user: current_user, date: Date.today)
        user_history.performance += @investment.histories.last.price * @trade_history.shares_amount
        user_history.tokens -= @investment.histories.last.price * @trade_history.shares_amount
        user_history.save

      end
    end

    redirect_to investment_path(@investment)

  end

  private

  def first_purchased_params
    params.require(:holding).permit(:trade, :shares_amount)
  end

  def second_trade_params
    params.require(:holding).permit(:trade, :shares_amount)
  end
end

class InvestmentsController < ApplicationController
  def index
    if params[:query].present?
      @investments = Investment.global_search(params[:query]).try(:includes, :histories)
    else
      @investments = Investment.all.try(:includes, :histories)
    end
  end

  def show
    @investment = Investment.find(params[:id])
    @holding = Holding.new

    @on_hold = false
    @purchased_price = {}

    current_user.holdings.each do |holding|
      if holding.investment == @investment
        @on_hold = true
        @current_holding = holding

        @purchased_price[@current_holding.purchased_date.strftime('%Y-%m-%d')] = @current_holding.purchased_price
      end
    end
  end
end
